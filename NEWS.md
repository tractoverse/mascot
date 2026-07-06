# mascot 0.1.0

## HCP1065 atlas

### License correction

The HCP1065 population-averaged tractography atlas is published by Fang-Cheng
Yeh under the **Creative Commons Attribution-ShareAlike 4.0 International
(CC BY-SA 4.0)** license
(<https://creativecommons.org/licenses/by-sa/4.0/>), not CC BY 4.0 as
previously documented. `DESCRIPTION`, the roxygen block in
[`R/HCP1065.R`](R/HCP1065.R), and the GitHub release notes for the `hcp1065`
tag have all been corrected accordingly.  A no-endorsement disclaimer has also
been added to the release notes.

### Attribution and citation

Please cite the original work when using HCP1065 data:

> Yeh FC. Population-based tract-to-region connectome of the human brain and
> its hierarchical topology. *Nat Commun* **13**, 4933 (2022).
> <https://doi.org/10.1038/s41467-022-32595-4>

The atlas originates from the Human Connectome Project Young Adult dataset;
users must also comply with the applicable
[HCP data-use terms](https://www.humanconnectome.org/study/hcp-young-adult/document/wu-minn-hcp-consortium-open-access-data-use-terms).

### Asset-generation design notes

The 87 HCP1065 bundles are all published in a **single GitHub release**
(`hcp1065`), each as one `.rds` file.  Key choices:

* **One release, 87 assets.** The atlas is population-averaged (one
  streamline set per bundle, no per-subject variation), so the total file
  count is small enough to fit comfortably in a single release without hitting
  GitHub's 2 GB per-file or 2 GB per-release soft limits.

* **`compress = "xz"`** (LZMA).  Because the job runs sequentially on a
  single runner and the file count is low, we can afford the slower but
  space-optimal XZ compression (typically 10–30 % smaller than gzip at
  comparable decompression speed).  Download time for end users is therefore
  minimised.

* **Single sequential workflow job.**  All bundles are converted in one
  `Rscript data-raw/hcp1065.R` step.  The source archive is a modest ZIP
  downloaded once; no range-request tricks are needed.

---

## TractSeg data redistribution

The TractSeg per-subject bundle data (72 white matter tracts, 105 HCP Young
Adult subjects) are redistributed from the Zenodo archive
(<https://zenodo.org/records/1477956>, DOI: 10.5281/zenodo.1477956) with the
explicit permission of the original authors.

### License

**Creative Commons Attribution–NonCommercial 4.0 International (CC BY-NC
4.0)** — non-commercial use only.
See <https://creativecommons.org/licenses/by-nc/4.0/>.

### Attribution and citation

Please cite the original TractSeg publication:

> Wasserthal J, Neher P, Maier-Hein KH. TractSeg — Fast and accurate white
> matter tract segmentation. *NeuroImage* **183**, 239–253 (2018).
> <https://doi.org/10.1016/j.neuroimage.2018.07.070>

Raw data archived at Zenodo: <https://zenodo.org/records/1477956>.

The source tractograms are derived from the Human Connectome Project Young
Adult dataset; users must comply with the applicable
[HCP data-use terms](https://www.humanconnectome.org/study/hcp-young-adult/document/wu-minn-hcp-consortium-open-access-data-use-terms).

### Disclaimer

This redistribution does not imply endorsement by the original authors, DKFZ,
Zenodo, HCP, or any affiliated institution.  Jakob Wasserthal, Peter Neher,
and Klaus H. Maier-Hein are listed as contributors (`ctb`) in `DESCRIPTION`
to acknowledge their authorship of the source data; this does not imply their
endorsement of the `mascot` package.

### Asset-generation design notes

The 72 × 105 = 7,560 per-subject bundle files present very different
constraints from the HCP1065 atlas.  Key design choices and trade-offs:

* **One release per bundle (72 releases, `tractseg-<bundle_name>`).**
  Putting all 7,560 files in a single release would be unwieldy (GitHub UI,
  API pagination, accidental full-release downloads).  One release per bundle
  gives users a clean, addressable unit and enables partial re-runs when only
  specific bundles need to be updated.

* **GitHub Actions matrix parallelism (up to 216 concurrent jobs).**  Each
  bundle is split into 3 subject batches (≈ 35 subjects each), yielding
  72 × 3 = 216 matrix configurations — just under GitHub's hard limit of 256.
  Each runner handles one batch end-to-end (fetch → convert → upload), so the
  full 72-bundle conversion completes in roughly the time of the slowest
  single batch rather than 72 × 105 subject-jobs in sequence.

* **HTTP range requests instead of a full archive download.**  The Zenodo
  archive is a large ZIP file.  `data-raw/zip_index.py` reads only the ZIP
  central directory (two small HTTP range requests), then
  `data-raw/fetch_bundle.py` fetches each `.trk` entry individually via a
  further range request.  This avoids downloading gigabytes of data per
  runner and keeps per-job bandwidth proportional to bundle size.

* **`compress = "gzip"`** instead of `"xz"`.  With 105 files to serialise
  per job (and all 72 jobs running in parallel in CI), gzip's faster
  compression is the better trade-off: wall-clock time in CI is reduced while
  the size penalty relative to XZ is modest (typically 10–20 %).  End-user
  download sizes remain acceptable because each release is fetched
  bundle-by-bundle through `import_bundle()`.

* **Parallel `mclapply` within each runner.**  Subject-level TRK → RDS
  conversion is embarrassingly parallel; `parallel::mclapply` exploits all
  cores available on the GitHub-hosted runner (typically 2) to halve
  per-batch conversion time.

* **Empty-TRK guard.**  A TRK file whose size is ≤ 1,000 bytes contains
  only a header with no streamlines.  Such files are silently skipped rather
  than producing a corrupt `.rds`, keeping the subject count accurate.

### Workflow reliability improvements

The GitHub Actions workflow that publishes the 72 per-bundle TractSeg releases
has been hardened against Zenodo rate-limiting and GitHub's matrix size limit:

* **Subject batching.**  Each bundle's 105 subjects are split into 3 batches
  (≈ 35 subjects each) processed by separate runners.  At ≈ 12 min/subject on
  a 2-core runner this yields ≈ 210 min per job — within the 300-minute
  timeout — and keeps the total matrix size at 72 × 3 = 216, below GitHub's
  hard cap of 256 configurations.

* **Race-safe release upload.**  Because multiple batches for the same bundle
  run concurrently, release creation is idempotent: each batch attempts
  `gh release create ... || true` (concurrent creators all succeed silently)
  before calling `gh release upload --clobber`.  Since every per-subject RDS
  filename is unique, `--clobber` never overwrites another batch's assets.

* **429 retry floor.** `data-raw/fetch_bundle.py` now enforces a minimum
  back-off of 30 × (attempt + 1) seconds on every HTTP 429 response,
  regardless of the value in the `Retry-After` header.  Zenodo occasionally
  returns `Retry-After: 0` on repeated throttling responses, which previously
  caused instant-retry thundering herds that exhausted the retry budget within
  seconds.  The floor prevents this.

* **Reduced concurrency.**  The matrix is capped at `max-parallel: 5` and
  each job uses 2 parallel download workers, keeping peak simultaneous Zenodo
  connections at ≤ 10.

## Comparison with HCP1065

| Aspect | HCP1065 | TractSeg |
|---|---|---|
| Nature of data | Population average | Per-subject (105 subjects) |
| Total assets | 87 `.rds` files | 7,560 `.rds` files |
| Release structure | 1 release, 87 assets | 72 releases, 105 assets each |
| Compression | `xz` (slow, small) | `gzip` (fast, modest overhead) |
| Workflow jobs | 1 sequential job | 216 parallel matrix jobs (72 bundles × 3 batches) |
| Source download | Full ZIP once | Range requests per bundle |
| In-runner parallelism | None needed | `mclapply` over subjects |
| License | CC BY-SA 4.0 | CC BY-NC 4.0 |
