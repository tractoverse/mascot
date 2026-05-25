library(mascot)

# ---------------------------------------------------------------------------
# import_bundle() – error paths
# ---------------------------------------------------------------------------
expect_error(
  import_bundle("bad_dataset", "Left Fornix"),
  info = "import_bundle with unsupported dataset triggers an error"
)

expect_error(
  import_bundle("HCP1065", "Not A Real Bundle"),
  info = "import_bundle with unsupported bundle triggers an error"
)

# ---------------------------------------------------------------------------
# import_bundle() – happy path (download mocked, no network required)
# ---------------------------------------------------------------------------
fake_bundle <- list(dataset = "HCP1065", bundle = "Anterior Commissure")

orig_dl <- get(".mascot_download_file", envir = asNamespace("mascot"))
assignInNamespace(
  ".mascot_download_file",
  function(url, destfile) saveRDS(fake_bundle, destfile),
  ns = "mascot"
)

result <- import_bundle("HCP1065", "Anterior Commissure")

assignInNamespace(".mascot_download_file", orig_dl, ns = "mascot")

expect_equal(
  result,
  fake_bundle,
  info = "import_bundle returns the object from the downloaded rds"
)
