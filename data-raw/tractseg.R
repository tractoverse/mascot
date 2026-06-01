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

n_cores <- max(1L, parallel::detectCores())
cli::cli_alert_info("Using {n_cores} parallel worker(s).")

convert_one <- function(i) {
  f <- trk_files[[i]]
  # fetch_bundle.py names files  <subject_id>_<bundle>.trk
  subject_id <- sub(paste0("_", bundle, "\\.trk$"), "", basename(f))
  rds_name   <- paste0("TractSeg_", subject_id, "_", bundle, ".rds")
  rds_path   <- file.path(out_dir, rds_name)

  # A TRK file whose size equals exactly the 1000-byte header has zero
  # streamlines; riot::read_trk would crash with "subscript out of bounds".
  if (file.size(f) <= 1000L) {
    message(sprintf("[%d/%d] %s: empty TRK (no streamlines), skipping.",
                    i, length(trk_files), subject_id))
    return(NA_character_)
  }

  bdl <- riot::read_bundle(f)
  saveRDS(bdl, rds_path, compress = "gzip", version = 3)
  message(sprintf("[%d/%d] %s", i, length(trk_files), rds_name))
  rds_path
}

results <- parallel::mclapply(
  seq_along(trk_files),
  convert_one,
  mc.cores = n_cores,
  mc.preschedule = FALSE   # let each worker pick up the next job as soon as it is free
)

# mclapply with mc.preschedule = FALSE returns failed workers as
# class c("try-error", "character"), NOT c("error", "condition"), so we
# must check for both classes.
failed <- vapply(results, function(x) inherits(x, c("error", "try-error")), logical(1L))
if (any(failed)) {
  for (idx in which(failed)) {
    msg <- if (inherits(results[[idx]], "error")) {
      conditionMessage(results[[idx]])
    } else {
      as.character(results[[idx]])
    }
    cli::cli_alert_danger("Subject {idx} failed: {msg}")
  }
  stop("One or more subjects failed to convert.")
}

# Only count paths that correspond to files that actually exist on disk.
# (Unlisting try-error objects would otherwise produce spurious strings.)
rds_paths <- Filter(
  function(x) is.character(x) && length(x) == 1L && !is.na(x) && file.exists(x),
  results
)
n_skipped  <- sum(vapply(results, function(x) identical(x, NA_character_), logical(1L)))

cli::cli_alert_success(
  "Bundle {.val {bundle}}: {length(rds_paths)} RDS file(s) written to {.path {out_dir}}{if (n_skipped > 0) paste0(' (', n_skipped, ' empty TRK skipped)') else ''}"
)
