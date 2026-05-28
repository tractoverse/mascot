# TractSeg high-quality white matter reference tracts
# Wasserthal et al. (2018), https://zenodo.org/records/1477956
#
# Per-bundle conversion script.  Called by the GitHub Actions matrix job
# (release-tractseg-data.yaml) after the TRK files have already been
# downloaded and decompressed by fetch_bundle.py.
#
# Required environment variables
# --------------------------------
#   TRACTSEG_BUNDLE   bundle name, e.g. "AF_left"
#   TRACTSEG_TRK_DIR  directory containing <subject>_<bundle>.trk files
#   TRACTSEG_OUT_DIR  directory where .rds files will be written
#                     (defaults to a temp dir if unset)
#
# Output
# ------
#   One TractSeg_<subject>_<bundle>.rds per subject, written to TRACTSEG_OUT_DIR.

bundle  <- Sys.getenv("TRACTSEG_BUNDLE")
trk_dir <- Sys.getenv("TRACTSEG_TRK_DIR")
out_dir <- Sys.getenv("TRACTSEG_OUT_DIR", unset = tempdir())

if (bundle  == "") stop("Environment variable TRACTSEG_BUNDLE is not set.")
if (trk_dir == "") stop("Environment variable TRACTSEG_TRK_DIR is not set.")

fs::dir_create(out_dir)

trk_files <- list.files(trk_dir, pattern = "\\.trk$", full.names = TRUE)
if (length(trk_files) == 0L) {
  stop("No .trk files found in TRACTSEG_TRK_DIR: ", trk_dir)
}

cli::cli_alert_info(
  "Bundle {.val {bundle}}: converting {length(trk_files)} TRK file(s) \u2192 RDS \u2026"
)

rds_paths <- character(length(trk_files))

for (i in seq_along(trk_files)) {
  f <- trk_files[[i]]
  # fetch_bundle.py names files  <subject_id>_<bundle>.trk
  subject_id <- sub(paste0("_", bundle, "\\.trk$"), "", basename(f))
  rds_name   <- paste0("TractSeg_", subject_id, "_", bundle, ".rds")
  rds_path   <- file.path(out_dir, rds_name)

  bdl <- riot::read_bundle(f)
  saveRDS(bdl, rds_path, compress = "xz", version = 3)
  rds_paths[[i]] <- rds_path
  cli::cli_alert_success("[{i}/{length(trk_files)}] {rds_name}")
}

cli::cli_alert_success(
  "Bundle {.val {bundle}}: {length(rds_paths)} RDS file(s) written to {.path {out_dir}}"
)
