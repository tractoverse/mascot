library(toad)

# ---------------------------------------------------------------------------
# available_datasets()
# ---------------------------------------------------------------------------
expect_equal(
  available_datasets(),
  c("HCP1065", "TractSeg"),
  info = "available_datasets returns HCP1065 and TractSeg dataset names"
)

# ---------------------------------------------------------------------------
# available_bundles()
# ---------------------------------------------------------------------------
bundles <- available_bundles("HCP1065")
expect_true(
  is.character(bundles),
  info = "available_bundles returns a character vector"
)
expect_equal(
  length(bundles), 87L,
  info = "HCP1065 has 87 bundles"
)
expect_true(
  "Left Arcuate Fasciculus" %in% bundles,
  info = "Left Arcuate Fasciculus is listed"
)
expect_true(
  "Corpus Callosum" %in% bundles,
  info = "Corpus Callosum is listed"
)

# invalid dataset -> error
expect_error(
  available_bundles("unknown"),
  info = "unsupported dataset triggers an error"
)

# TractSeg bundles
ts_bundles <- available_bundles("TractSeg")
expect_true(
  is.character(ts_bundles),
  info = "available_bundles('TractSeg') returns a character vector"
)
expect_equal(
  length(ts_bundles), 72L,
  info = "TractSeg has 72 bundles"
)
expect_true(
  "Left Arcuate Fasciculus" %in% ts_bundles,
  info = "Left Arcuate Fasciculus is listed in TractSeg"
)
expect_true(
  "Corpus Callosum" %in% ts_bundles,
  info = "Corpus Callosum is listed in TractSeg"
)

# ---------------------------------------------------------------------------
# .tractseg_subject_list() – network mocked via assignInNamespace on url()
# ---------------------------------------------------------------------------
# Mock by patching .tractseg_subject_list directly
orig_tsl <- get(".tractseg_subject_list", envir = asNamespace("toad"))
assignInNamespace(
  ".tractseg_subject_list",
  function(bundle_stem) c("100307", "100408", "101006"),
  ns = "toad"
)

subjects <- toad:::.tractseg_subject_list("AF_left")
expect_equal(
  subjects,
  c("100307", "100408", "101006"),
  info = ".tractseg_subject_list returns mocked subject IDs"
)

assignInNamespace(".tractseg_subject_list", orig_tsl, ns = "toad")

# Real call to a non-existent release should return character(0) (not error)
result_missing <- toad:::.tractseg_subject_list("BUNDLE_DOES_NOT_EXIST_XYZ")
expect_equal(
  result_missing, character(0L),
  info = ".tractseg_subject_list returns character(0) when release does not exist"
)

# ---------------------------------------------------------------------------
# .toad_interp()
# ---------------------------------------------------------------------------
interp <- toad:::.toad_interp

# plain {var} interpolation
x <- "HCP1065"
expect_equal(
  interp("{x}"),
  "HCP1065",
  info = ".toad_interp interpolates {var}"
)

# unknown variable returns the raw token unchanged
expect_equal(
  interp("{no_such_var_xyz}"),
  "{no_such_var_xyz}",
  info = ".toad_interp leaves unknown vars unchanged"
)

# {.val {var}} pattern
bundle_name <- "Left Fornix"
result <- interp("{.val {bundle_name}}")
expect_true(
  grepl("Left Fornix", result),
  info = ".toad_interp handles {.val {var}} pattern"
)

# ---------------------------------------------------------------------------
# .toad_abort() – cli-available branch
# ---------------------------------------------------------------------------
expect_error(
  toad:::.toad_abort("test error message"),
  info = ".toad_abort throws an error with cli available"
)

# ---------------------------------------------------------------------------
# .toad_abort_base() – base-R fallback (tested directly for coverage)
# ---------------------------------------------------------------------------
# single-message fallback
expect_error(
  toad:::.toad_abort_base("single line error", env = environment()),
  info = ".toad_abort_base: single message stops"
)

# multi-message with named and unnamed elements
msg_multi <- c("header line", i = "info line", x = "extra line")
expect_error(
  toad:::.toad_abort_base(msg_multi, env = environment()),
  info = ".toad_abort_base: multi-message stops"
)

# multi-message element with empty-string prefix (nchar == 0 path)
msg_empty_prefix <- c("first line", "second line")
names(msg_empty_prefix) <- c("i", "")
expect_error(
  toad:::.toad_abort_base(msg_empty_prefix, env = environment()),
  info = ".toad_abort_base: empty-string prefix treated as plain line"
)

# ---------------------------------------------------------------------------
# .toad_abort() – else branch (cli suppressed via option)
# ---------------------------------------------------------------------------
old_opt <- options(toad.no_cli = TRUE)
expect_error(
  toad:::.toad_abort("no-cli single error"),
  info = ".toad_abort else branch dispatches to base fallback"
)
options(old_opt)
# ---------------------------------------------------------------------------
# .toad_download_file() – exercised with a file:// URL (no network)
# ---------------------------------------------------------------------------
fake_obj <- list(check = "download_file_coverage")
src_file <- tempfile(fileext = ".rds")
dst_file <- tempfile(fileext = ".rds")
saveRDS(fake_obj, src_file)
toad:::.toad_download_file(paste0("file://", src_file), dst_file)
expect_equal(
  readRDS(dst_file),
  fake_obj,
  info = ".toad_download_file downloads and the rds round-trips correctly"
)
unlink(c(src_file, dst_file))

