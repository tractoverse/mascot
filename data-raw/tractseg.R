# TractSeg high-quality white matter reference tracts
# Wasserthal et al. (2018), https://zenodo.org/records/1477956
#
# This script converts the raw .trk files to .rds assets ready for upload to
# GitHub Releases.  Each bundle gets its own release tagged
# "tractseg-<bundle_name>" (e.g. "tractseg-AF_left").  Within that release
# there is one asset per subject: TractSeg_<subject_id>_<bundle>.rds.
# Up to 1 000 assets are allowed per GitHub release, so 105 subjects/bundle
# is well within the limit.

url <- "https://zenodo.org/record/1477956/files/HCP105_Zenodo_NewTrkFormat.zip?download=1"
zipfile <- "data-raw/HCP105_Zenodo_NewTrkFormat.zip"

# Resumable download using libcurl (cross-platform, no system tools required).
# Re-running this script after an interruption will resume from where it left off.
download_with_resume <- function(url, destfile, max_tries = 10L, timeout = 300L) {
  for (i in seq_len(max_tries)) {
    offset <- if (file.exists(destfile)) file.size(destfile) else 0
    h <- curl::new_handle(
      resume_from_large = offset,
      connecttimeout = timeout,
      low_speed_time = timeout,
      low_speed_limit = 1L     # abort if < 1 byte/s for `timeout` seconds
    )
    tryCatch(
      {
        # Open in *append* binary mode so partial content is not truncated on retry.
        # curl::curl_download() uses "wb" internally which would overwrite the file.
        con <- file(destfile, open = "ab")
        on.exit(close(con), add = TRUE)
        resp <- curl::curl_fetch_stream(url, fun = function(x) writeBin(x, con), handle = h)
        # 200 = server ignored Range header and sent from byte 0 (data was duplicated).
        # Truncate and restart from scratch in that case.
        if (resp$status_code == 200L && offset > 0L) {
          message("Server does not support range requests; restarting download.")
          close(con)
          on.exit(NULL)
          file.create(destfile)  # truncate
          con <- file(destfile, open = "ab")
          on.exit(close(con), add = TRUE)
          curl::new_handle(connecttimeout = timeout, low_speed_time = timeout, low_speed_limit = 1L) |>
            curl::curl_fetch_stream(url = url, fun = function(x) writeBin(x, con), handle = _)
        }
        return(invisible(destfile))
      },
      error = function(e) {
        message(sprintf("Attempt %d/%d failed: %s", i, max_tries, conditionMessage(e)))
        if (i == max_tries) stop(e)
        Sys.sleep(5)
      }
    )
  }
}

download_with_resume(url, zipfile)

system2("unzip", c("-o", zipfile, "-d", dirname(zipfile)))

out_dir <- Sys.getenv("TRACTSEG_OUT_DIR", unset = "inst/extdata")
fs::dir_create(out_dir)

trk_files <- list.files(
  "data-raw/HCP105_Zenodo_NewTrkFormat",
  recursive = TRUE, full.names = TRUE,
  include.dirs = FALSE, pattern = "\\.trk$"
)

# Derive unique bundle names (e.g. "AF_left", "CC_1", ...)
bundle_names <- unique(
  vapply(trk_files, function(f) {
    tools::file_path_sans_ext(basename(f))
  }, character(1))
)

# Outer loop: one sub-directory (= one GitHub release) per bundle.
# Release tag: tractseg-<bundle_name>  (e.g. tractseg-AF_left)
for (bundle in bundle_names) {
  cli::cli_alert_info("Processing bundle {bundle}...")

  # Each bundle's assets live in their own sub-directory so they can be
  # uploaded to the matching GitHub release in one batch.
  bundle_dir <- file.path(out_dir, bundle)
  fs::dir_create(bundle_dir)

  bundle_trk_files <- grep(
    paste0("/", bundle, "\\.trk$"), trk_files,
    value = TRUE
  )
  n_subjects <- 0L
  rds_paths <- character(0)

  # Inner loop: one .rds per subject
  for (f in bundle_trk_files) {
    l <- strsplit(f, "/")[[1]]
    subject_id <- l[[length(l) - 2L]]
    rds_name <- paste0("TractSeg_", subject_id, "_", bundle, ".rds")
    rds_path <- file.path(bundle_dir, rds_name)

    bdl <- riot::read_bundle(f)
    saveRDS(bdl, rds_path, compress = "xz", version = 3)
    rds_paths <- c(rds_paths, rds_path)
    n_subjects <- n_subjects + 1L
    cli::cli_alert_success("Saved {rds_name}")
    fs::file_delete(f)
  }

  # Zip all subject rds files for this bundle into a single archive
  zip_path <- file.path(normalizePath(out_dir), paste0("TractSeg_", bundle, ".zip"))
  local({
    old_wd <- setwd(bundle_dir)
    on.exit(setwd(old_wd), add = TRUE)
    zip(zip_path, files = basename(rds_paths))
  })
  fs::dir_delete(bundle_dir)

  cli::cli_alert_success(
    "-------------- Bundle {bundle}: {n_subjects} subject(s) archived to {zip_path} --------------"
  )
  cli::cli_alert_info(
    "Upload {zip_path} to GitHub release tag: tractseg-{bundle}"
  )
}
