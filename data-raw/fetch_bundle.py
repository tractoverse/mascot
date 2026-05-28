#!/usr/bin/env python3
"""Fetch and decompress TRK files for a single bundle using HTTP range requests.

The script reads the JSON index produced by zip_index.py, selects the entries
for *bundle_name*, and for each subject:
  1. Issues an HTTP range request for the local file header (first 30 bytes).
  2. Reads fname_len / extra_len from the local header to locate the data.
  3. Issues a second range request for the compressed payload only.
  4. Decompresses (deflate or stored) and writes the .trk file to *out_dir*.

No full ZIP download is ever needed.

Usage:
    python3 fetch_bundle.py <url> <index.json> <bundle_name> <out_dir>
"""

import json
import os
import struct
import sys
import time
import urllib.request
import zlib


# ---------------------------------------------------------------------------
# HTTP helper
# ---------------------------------------------------------------------------

def range_get(url: str, start: int, end: int, retries: int = 7) -> bytes:
    for attempt in range(retries):
        try:
            req = urllib.request.Request(
                url, headers={"Range": f"bytes={start}-{end}"}
            )
            with urllib.request.urlopen(req, timeout=180) as r:
                data = r.read()
            expected = end - start + 1
            if len(data) != expected:
                raise ValueError(
                    f"Range request returned {len(data)} B, expected {expected} B"
                )
            return data
        except Exception as exc:
            if attempt == retries - 1:
                raise
            wait = 10 * (attempt + 1)
            print(
                f"  [retry {attempt + 1}/{retries}] {exc}; waiting {wait}s…",
                flush=True,
            )
            time.sleep(wait)


# ---------------------------------------------------------------------------
# Decompress one file
# ---------------------------------------------------------------------------

def fetch_and_decompress(
    url: str,
    local_header_offset: int,
    compressed_size: int,
    compression: int,
    uncompressed_size: int,
) -> bytes:
    """Download and decompress a single file from a remote ZIP archive."""

    # Local file header layout (30 bytes fixed):
    #   0–3   signature  PK\x03\x04
    #   26–27 fname_len  (2 bytes, little-endian)
    #   28–29 extra_len  (2 bytes, little-endian)
    lh = range_get(url, local_header_offset, local_header_offset + 29)
    if lh[:4] != b"PK\x03\x04":
        raise ValueError(f"Bad local file header signature at {local_header_offset:#x}")

    fname_len = struct.unpack_from("<H", lh, 26)[0]
    extra_len = struct.unpack_from("<H", lh, 28)[0]
    data_start = local_header_offset + 30 + fname_len + extra_len

    if compressed_size == 0:
        return b""

    compressed = range_get(url, data_start, data_start + compressed_size - 1)

    if compression == 0:            # stored (no compression)
        return compressed
    elif compression == 8:          # deflate
        return zlib.decompress(compressed, -15)
    else:
        raise ValueError(f"Unsupported compression method {compression}")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    if len(sys.argv) != 5:
        print(
            f"Usage: {sys.argv[0]} <url> <index.json> <bundle_name> <out_dir>",
            file=sys.stderr,
        )
        sys.exit(1)

    url         = sys.argv[1]
    index_file  = sys.argv[2]
    bundle_name = sys.argv[3]
    out_dir     = sys.argv[4]

    with open(index_file) as fh:
        index = json.load(fh)

    if bundle_name not in index:
        print(
            f"Bundle '{bundle_name}' not found in index.  "
            f"Available: {sorted(index)[:10]} …",
            file=sys.stderr,
        )
        sys.exit(1)

    files = index[bundle_name]
    os.makedirs(out_dir, exist_ok=True)

    print(f"Fetching {len(files)} TRK files for bundle '{bundle_name}'…",
          flush=True)

    for i, entry in enumerate(files, 1):
        subject  = entry["subject"]
        out_path = os.path.join(out_dir, f"{subject}_{bundle_name}.trk")

        if os.path.exists(out_path):
            expected = entry["uncompressed_size"]
            if os.path.getsize(out_path) == expected:
                print(f"[{i}/{len(files)}] {subject}: already exists, skipping.",
                      flush=True)
                continue
            # Wrong size → discard and re-download
            os.remove(out_path)

        print(f"[{i}/{len(files)}] {subject}: downloading "
              f"({entry['compressed_size']:,} → {entry['uncompressed_size']:,} B)…",
              flush=True)

        data = fetch_and_decompress(
            url,
            entry["local_header_offset"],
            entry["compressed_size"],
            entry["compression"],
            entry["uncompressed_size"],
        )

        with open(out_path, "wb") as fh:
            fh.write(data)

        actual = len(data)
        expected = entry["uncompressed_size"]
        if actual != expected:
            print(
                f"  WARNING: wrote {actual} B but index says {expected} B",
                flush=True,
            )
        else:
            print(f"  ✓ {out_path}", flush=True)

    print(f"\nDone. {len(files)} files in {out_dir}", flush=True)


if __name__ == "__main__":
    main()
