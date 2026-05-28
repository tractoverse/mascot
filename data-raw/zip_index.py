#!/usr/bin/env python3
"""Parse the central directory of a remote ZIP file using HTTP range requests.

Outputs a JSON file mapping bundle names to a list of per-subject file entries,
each carrying the information needed to download and decompress only that file's
bytes (local_header_offset + compressed_size + compression method).

Usage:
    python3 zip_index.py <url> <output.json>
"""

import io
import json
import struct
import sys
import urllib.request


# ---------------------------------------------------------------------------
# HTTP helpers
# ---------------------------------------------------------------------------

def range_get(url: str, start: int, end: int, retries: int = 5) -> bytes:
    """Download bytes [start, end] (inclusive) from *url* via Range request."""
    for attempt in range(retries):
        try:
            req = urllib.request.Request(
                url, headers={"Range": f"bytes={start}-{end}"}
            )
            with urllib.request.urlopen(req, timeout=120) as r:
                data = r.read()
            expected = end - start + 1
            if len(data) != expected:
                raise ValueError(
                    f"Range request returned {len(data)} bytes, expected {expected}"
                )
            return data
        except Exception as exc:
            if attempt == retries - 1:
                raise
            import time
            print(
                f"  attempt {attempt + 1}/{retries} failed ({exc}); retrying…",
                file=sys.stderr,
            )
            time.sleep(5 * (attempt + 1))


def get_file_size(url: str) -> int:
    req = urllib.request.Request(url, method="HEAD")
    with urllib.request.urlopen(req, timeout=60) as r:
        length = r.headers.get("Content-Length")
        if length is None:
            raise ValueError("Server did not return Content-Length")
        return int(length)


# ---------------------------------------------------------------------------
# ZIP central directory parsing (handles ZIP64)
# ---------------------------------------------------------------------------

_SIG_EOCD = b"PK\x05\x06"
_SIG_EOCD64_LOCATOR = b"PK\x06\x07"
_SIG_EOCD64 = b"PK\x06\x06"
_SIG_CD_ENTRY = b"PK\x01\x02"


def _parse_zip64_extra(extra: bytes, need_uncompressed: bool,
                       need_compressed: bool, need_offset: bool):
    """Walk extra-field blocks and return (uncompressed, compressed, offset)
    from the ZIP64 extended information block (tag 0x0001), setting only the
    values that were flagged as 0xFFFFFFFF in the fixed fields."""
    uncompressed = compressed = offset = None
    pos = 0
    while pos + 4 <= len(extra):
        tag = struct.unpack_from("<H", extra, pos)[0]
        sz  = struct.unpack_from("<H", extra, pos + 2)[0]
        if tag == 0x0001:
            vp = pos + 4
            if need_uncompressed:
                uncompressed = struct.unpack_from("<Q", extra, vp)[0]; vp += 8
            if need_compressed:
                compressed   = struct.unpack_from("<Q", extra, vp)[0]; vp += 8
            if need_offset:
                offset       = struct.unpack_from("<Q", extra, vp)[0]
            break
        pos += 4 + sz
    return uncompressed, compressed, offset


def parse_central_directory(url: str) -> list:
    file_size = get_file_size(url)
    print(f"Archive size: {file_size:,} bytes ({file_size / 1e9:.2f} GB)",
          file=sys.stderr)

    # Fetch the tail – enough for EOCD + optional ZIP64 locator + ZIP64 EOCD.
    tail_size  = min(65_536, file_size)
    tail_start = file_size - tail_size
    tail       = range_get(url, tail_start, file_size - 1)

    # --- Locate the central directory ---
    cd_offset = cd_size = None

    loc_pos = tail.rfind(_SIG_EOCD64_LOCATOR)
    if loc_pos != -1:
        # ZIP64 end-of-central-directory locator (20 bytes)
        # offset of ZIP64 EOCD record is at bytes 8–15
        eocd64_disk_offset = struct.unpack_from("<Q", tail, loc_pos + 8)[0]
        eocd64_raw = range_get(url, eocd64_disk_offset, eocd64_disk_offset + 55)
        if eocd64_raw[:4] != _SIG_EOCD64:
            raise ValueError("ZIP64 EOCD signature mismatch")
        cd_size   = struct.unpack_from("<Q", eocd64_raw, 40)[0]
        cd_offset = struct.unpack_from("<Q", eocd64_raw, 48)[0]
        print(f"ZIP64 central directory: offset={cd_offset:,}, size={cd_size:,}",
              file=sys.stderr)
    else:
        eocd_pos = tail.rfind(_SIG_EOCD)
        if eocd_pos == -1:
            raise ValueError("Cannot find EOCD signature in the last 64 KB")
        cd_size   = struct.unpack_from("<I", tail, eocd_pos + 12)[0]
        cd_offset = struct.unpack_from("<I", tail, eocd_pos + 16)[0]
        print(f"ZIP central directory: offset={cd_offset:,}, size={cd_size:,}",
              file=sys.stderr)

    # --- Download and parse the central directory ---
    print(f"Downloading central directory ({cd_size / 1e6:.1f} MB)…",
          file=sys.stderr)
    cd_data = range_get(url, cd_offset, cd_offset + cd_size - 1)

    entries = []
    pos = 0
    while pos + 46 <= len(cd_data):
        if cd_data[pos:pos + 4] != _SIG_CD_ENTRY:
            break

        compression      = struct.unpack_from("<H", cd_data, pos + 10)[0]
        compressed_size  = struct.unpack_from("<I", cd_data, pos + 20)[0]
        uncompressed_size= struct.unpack_from("<I", cd_data, pos + 24)[0]
        fname_len        = struct.unpack_from("<H", cd_data, pos + 28)[0]
        extra_len        = struct.unpack_from("<H", cd_data, pos + 30)[0]
        comment_len      = struct.unpack_from("<H", cd_data, pos + 32)[0]
        lh_offset        = struct.unpack_from("<I", cd_data, pos + 42)[0]

        fname = cd_data[pos + 46: pos + 46 + fname_len].decode("utf-8",
                                                                 errors="replace")

        # Resolve ZIP64 extended values if any field hit the 32-bit sentinel
        need_u = uncompressed_size == 0xFFFF_FFFF
        need_c = compressed_size   == 0xFFFF_FFFF
        need_o = lh_offset         == 0xFFFF_FFFF
        if need_u or need_c or need_o:
            extra = cd_data[pos + 46 + fname_len: pos + 46 + fname_len + extra_len]
            u, c, o = _parse_zip64_extra(extra, need_u, need_c, need_o)
            if need_u and u is not None: uncompressed_size = u
            if need_c and c is not None: compressed_size   = c
            if need_o and o is not None: lh_offset         = o

        entries.append(
            dict(
                name              = fname,
                compression       = compression,
                compressed_size   = compressed_size,
                uncompressed_size = uncompressed_size,
                local_header_offset = lh_offset,
            )
        )

        pos += 46 + fname_len + extra_len + comment_len

    print(f"Parsed {len(entries)} central-directory entries.", file=sys.stderr)
    return entries


# ---------------------------------------------------------------------------
# Group entries by bundle
# ---------------------------------------------------------------------------

def build_bundle_index(entries: list) -> dict:
    """Filter for .trk files and group by bundle name.

    Expected path pattern inside the zip:
        HCP105_Zenodo_NewTrkFormat/<subject_id>/tracts/<bundle>.trk
    """
    import os
    bundles: dict = {}
    skipped = 0
    for e in entries:
        if not e["name"].endswith(".trk"):
            continue
        parts = e["name"].rstrip("/").split("/")
        if len(parts) < 3:
            skipped += 1
            continue
        subject_id = parts[-3]  # e.g. "992774"
        bundle     = os.path.splitext(parts[-1])[0]  # e.g. "AF_left"
        bundles.setdefault(bundle, []).append(
            dict(
                subject             = subject_id,
                local_header_offset = e["local_header_offset"],
                compressed_size     = e["compressed_size"],
                uncompressed_size   = e["uncompressed_size"],
                compression         = e["compression"],
            )
        )
    if skipped:
        print(f"Skipped {skipped} entries with unexpected path structure.",
              file=sys.stderr)
    return bundles


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <url> <output.json>", file=sys.stderr)
        sys.exit(1)

    url      = sys.argv[1]
    out_file = sys.argv[2]

    entries = parse_central_directory(url)
    bundles = build_bundle_index(entries)

    print(f"\nFound {len(bundles)} bundles:", file=sys.stderr)
    for b, files in sorted(bundles.items()):
        print(f"  {b}: {len(files)} subjects", file=sys.stderr)

    with open(out_file, "w") as fh:
        json.dump(bundles, fh)
    print(f"\nIndex written to {out_file}", file=sys.stderr)


if __name__ == "__main__":
    main()
