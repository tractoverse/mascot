# Files are also here:
# https://pitt-my.sharepoint.com/:f:/g/personal/yehfc_pitt_edu/Ek0DdO67iQ9NvkJUci91lzMBXCVBq926QXTTY7JK6LIjgw?e=jvydcC
library(usethis)

zipfile <- "data-raw/hcp1065_avg_tracts_trk.zip"
utils::download.file(
  url = "https://github.com/data-others/atlas/releases/download/hcp1065/hcp1065_avg_tracts_trk.zip",
  destfile = zipfile, 
  mode = "wb"
)
utils::unzip(zipfile, exdir = "data-raw/HCP1065")

for (f in list.files("data-raw/HCP1065", recursive = TRUE, full.names = TRUE, include.dirs = FALSE)) {
  # Setup bundle name
  l <- strsplit(f, "/")[[1]]
  bundle_name <- l[[length(l)]]
  bundle_name <- strsplit(bundle_name, "\\.")[[1]][[1]]
  bundle_name <- paste0("HCP_YA1065_", bundle_name)
  cli::cli_alert_info("Processing {bundle_name} tract...")

  # Grab the data
  system(paste("gunzip", gsub(" ", "\\\\ ", f)))
  f <- gsub(".gz", "", f)
  bdl <- riot::read_bundle(f)
  fs::file_delete(f)

  # Save the data
  assign(bundle_name, bdl)
  do.call("use_data", list(as.name(bundle_name), overwrite = TRUE, compress = "xz", version = 3))
  cli::cli_alert_success("-------------- Finished processing {bundle_name} tract! --------------")
}

fs::dir_delete("data-raw/HCP1065")
fs::file_delete("data-raw/hcp1065_avg_tracts_trk.zip")
