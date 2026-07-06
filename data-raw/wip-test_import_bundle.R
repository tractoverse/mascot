library(mascot)
library(tinytest)

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

# ---------------------------------------------------------------------------
# import_bundle() – TractSeg paths (download + subject list both mocked)
# ---------------------------------------------------------------------------
fake_ts_bundle <- list(dataset = "TractSeg", bundle = "Left Arcuate Fasciculus")
fake_subjects <- c("100307", "100408", "101006")

orig_tsl <- get(".tractseg_subject_list", envir = asNamespace("mascot"))
assignInNamespace(
  ".tractseg_subject_list",
  function(bundle_stem) fake_subjects,
  ns = "mascot"
)
assignInNamespace(
  ".mascot_download_file",
  function(url, destfile) saveRDS(fake_ts_bundle, destfile),
  ns = "mascot"
)

# subjects = NULL  →  named list of all subjects
res_null <- import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = NULL)
expect_true(
  is.list(res_null) && length(res_null) == 3L,
  info = "TractSeg subjects=NULL returns list of all subjects"
)
expect_equal(
  names(res_null), fake_subjects,
  info = "TractSeg subjects=NULL names match subject IDs"
)
expect_equal(
  res_null[[1L]], fake_ts_bundle,
  info = "TractSeg subjects=NULL each element is the bundle object"
)

# subjects = integer  →  named list of n random subjects
set.seed(42L)
res_int <- import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = 2L)
expect_true(
  is.list(res_int) && length(res_int) == 2L,
  info = "TractSeg subjects=2L returns list of 2 subjects"
)
expect_true(
  all(names(res_int) %in% fake_subjects),
  info = "TractSeg subjects=2L names are valid subject IDs"
)

# subjects = character (single subject)  →  bundle object directly
res_chr <- import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = "100307")
expect_equal(
  res_chr, fake_ts_bundle,
  info = "TractSeg subjects='100307' returns bundle directly (not wrapped in list)"
)

# subjects = invalid character  →  error
expect_error(
  import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = "999999"),
  info = "TractSeg subjects=invalid character triggers an error"
)

# subjects integer out of range  →  error
expect_error(
  import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = 99L),
  info = "TractSeg subjects > n_available triggers an error"
)

# invalid bundle for TractSeg  →  error
expect_error(
  import_bundle("TractSeg", "Not A Real Bundle"),
  info = "TractSeg with unsupported bundle triggers an error"
)

# release not yet published (.tractseg_subject_list returns character(0)) -> error
assignInNamespace(
  ".tractseg_subject_list",
  function(bundle_stem) character(0L),
  ns = "mascot"
)
expect_error(
  import_bundle("TractSeg", "Left Arcuate Fasciculus"),
  info = "TractSeg import errors when release assets are not yet published"
)

assignInNamespace(".tractseg_subject_list", orig_tsl, ns = "mascot")
assignInNamespace(".mascot_download_file", orig_dl, ns = "mascot")
