zipfile <- "data-raw/hcp1065_avg_tracts_trk.zip"
utils::download.file(
  url = "https://github.com/data-others/atlas/releases/download/hcp1065/hcp1065_avg_tracts_trk.zip",
  destfile = zipfile, 
  mode = "wb"
)
utils::unzip(zipfile, exdir = "data-raw/HCP1065")

out_dir <- Sys.getenv("HCP1065_OUT_DIR", unset = "inst/extdata")
fs::dir_create(out_dir)

for (f in list.files("data-raw/HCP1065", recursive = TRUE, full.names = TRUE, include.dirs = FALSE)) {
  # Setup bundle name
  l <- strsplit(f, "/")[[1]]
  bundle_name <- l[[length(l)]]
  bundle_name <- strsplit(bundle_name, "\\.")[[1]][[1]]
  bundle_name <- paste0("HCP1065_", bundle_name)
  cli::cli_alert_info("Processing {bundle_name} tract...")

  # Grab the data
  system(paste("gunzip", gsub(" ", "\\\\ ", f)))
  f <- gsub(".gz", "", f)
  bdl <- riot::read_bundle(f)
  fs::file_delete(f)

  # Save the data
  assign(bundle_name, bdl)
  do.call("saveRDS", list(as.name(bundle_name), file.path(out_dir, paste0(bundle_name, ".rds")), compress = "xz", version = 3))
  cli::cli_alert_success("-------------- Finished processing {bundle_name} tract! --------------")
}

fs::dir_delete("data-raw/HCP1065")
fs::file_delete("data-raw/hcp1065_avg_tracts_trk.zip")
