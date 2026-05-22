zipfile <- "data-raw/HCP105_Zenodo_NewTrkFormat.zip"
utils::download.file(
  url = "https://zenodo.org/record/1477956/files/HCP105_Zenodo_NewTrkFormat.zip?download=1",
  destfile = zipfile
)

utils::unzip(zipfile)


for (f in list.files("data-raw/HCP105", recursive = TRUE, full.names = TRUE, include.dirs = FALSE, pattern = "*.tar.xz")) {
  # Setup tract name
  l <- strsplit(f, "/")[[1]]
  tract_name <- l[[length(l)]]
  patient_id <- l[[length(l) - 2]]
  tract_name <- strsplit(tract_name, "\\.")[[1]][[1]]
  tract_name <- paste0("HCP_YA105_", patient_id, "_", tract_name)
  cli::cli_alert_info("Processing {tract_name} tract...")

  # # Grab the data
  # df <- read_fascicles(f)
  #
  # # Save the data
  # assign(tract_name, df)
  # do.call("use_data", list(as.name(tract_name), overwrite = TRUE, compress = "xz", version = 3))
}

toto <- read_fascicles(list.files("data-raw/HCP105", recursive = TRUE, full.names = TRUE, include.dirs = FALSE, pattern = "*.tar.xz")[1])
