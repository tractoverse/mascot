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
    python3 fetch_bundle.py <url> <index.json> <bundle_name> <out_dir> [workers]

The optional *workers* argument (default: 16) controls how many TRK files are
downloaded concurrently.  Increasing it speeds up the fetch step further, but
be mindful of the remote server's rate limits.
"""

import json
import os
import struct
import sys
import time
import urllib.error
import urllib.request
import zlib
from concurrent.futures import ThreadPoolExecutor, as_completed


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
        except urllib.error.HTTPError as exc:
            if attempt == retries - 1:
                raise
            if exc.code == 429:
                # Respect Retry-After if the server provides it; otherwise use
                # an aggressive exponential back-off so we don't keep hammering
                # Zenodo and burning through the retry budget.
                retry_after = exc.headers.get("Retry-After")
                if retry_after is not None:
                    try:
                        wait = int(retry_after)
                    except ValueError:
                        wait = 60 * (attempt + 1)
                else:
                    wait = 60 * (attempt + 1)   # 60 s, 120 s, 180 s …
            else:
                wait = 10 * (attempt + 1)
            print(
                f"  [retry {attempt + 1}/{retries}] HTTP {exc.code}; waiting {wait}s…",
                flush=True,
            )
            time.sleep(wait)
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

def fetch_entry(url: str, entry: dict, out_dir: str, bundle_name: str, index: int, total: int) -> str:
    """Fetch, decompress and write one TRK file.  Returns a status string."""
    subject  = entry["subject"]
    out_path = os.path.join(out_dir, f"{subject}_{bundle_name}.trk")

    if os.path.exists(out_path):
        expected = entry["uncompressed_size"]
        if os.path.getsize(out_path) == expected:
            return f"[{index}/{total}] {subject}: already exists, skipping."
        os.remove(out_path)

    data = fetch_and_decompress(
        url,
        entry["local_header_offset"],
        entry["compressed_size"],
        entry["compression"],
        entry["uncompressed_size"],
    )

    with open(out_path, "wb") as fh:
        fh.write(data)

    actual   = len(data)
    expected = entry["uncompressed_size"]
    if actual != expected:
        return (
            f"[{index}/{total}] {subject}: WARNING wrote {actual} B "
            f"but index says {expected} B"
        )
    return (
        f"[{index}/{total}] {subject}: ✓ "
        f"({entry['compressed_size']:,} → {actual:,} B)"
    )


def main():
    if len(sys.argv) not in (5, 6):
        print(
            f"Usage: {sys.argv[0]} <url> <index.json> <bundle_name> <out_dir> [workers]",
            file=sys.stderr,
        )
        sys.exit(1)

    url         = sys.argv[1]
    index_file  = sys.argv[2]
    bundle_name = sys.argv[3]
    out_dir     = sys.argv[4]
    workers     = int(sys.argv[5]) if len(sys.argv) == 6 else 16

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
    total = len(files)

    print(
        f"Fetching {total} TRK files for bundle '{bundle_name}' "
        f"({workers} parallel workers)…",
        flush=True,
    )

    errors = []
    completed = 0

    with ThreadPoolExecutor(max_workers=workers) as pool:
        futures = {
            pool.submit(fetch_entry, url, entry, out_dir, bundle_name, i, total): entry
            for i, entry in enumerate(files, 1)
        }
        for future in as_completed(futures):
            completed += 1
            try:
                msg = future.result()
                print(msg, flush=True)
            except Exception as exc:
                entry = futures[future]
                msg = f"ERROR {entry['subject']}: {exc}"
                errors.append(msg)
                print(msg, flush=True)

    if errors:
        print(f"\n{len(errors)} file(s) failed:", file=sys.stderr, flush=True)
        for e in errors:
            print(f"  {e}", file=sys.stderr)
        sys.exit(1)

    print(f"\nDone. {total} files in {out_dir}", flush=True)


if __name__ == "__main__":
    main()
