library(mascot)

# ---------------------------------------------------------------------------
# available_datasets()
# ---------------------------------------------------------------------------
expect_equal(
  available_datasets(),
  "HCP1065",
  info = "available_datasets returns the HCP1065 dataset name"
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

# ---------------------------------------------------------------------------
# .mascot_interp()
# ---------------------------------------------------------------------------
interp <- mascot:::.mascot_interp

# plain {var} interpolation
x <- "HCP1065"
expect_equal(
  interp("{x}"),
  "HCP1065",
  info = ".mascot_interp interpolates {var}"
)

# unknown variable returns the raw token unchanged
expect_equal(
  interp("{no_such_var_xyz}"),
  "{no_such_var_xyz}",
  info = ".mascot_interp leaves unknown vars unchanged"
)

# {.val {var}} pattern
bundle_name <- "Left Fornix"
result <- interp("{.val {bundle_name}}")
expect_true(
  grepl("Left Fornix", result),
  info = ".mascot_interp handles {.val {var}} pattern"
)

# ---------------------------------------------------------------------------
# .mascot_abort() – cli-available branch
# ---------------------------------------------------------------------------
expect_error(
  mascot:::.mascot_abort("test error message"),
  info = ".mascot_abort throws an error with cli available"
)

# ---------------------------------------------------------------------------
# .mascot_abort_base() – base-R fallback (tested directly for coverage)
# ---------------------------------------------------------------------------
# single-message fallback
expect_error(
  mascot:::.mascot_abort_base("single line error", env = environment()),
  info = ".mascot_abort_base: single message stops"
)

# multi-message with named and unnamed elements
msg_multi <- c("header line", i = "info line", x = "extra line")
expect_error(
  mascot:::.mascot_abort_base(msg_multi, env = environment()),
  info = ".mascot_abort_base: multi-message stops"
)

# multi-message element with empty-string prefix (nchar == 0 path)
msg_empty_prefix <- c("first line", "second line")
names(msg_empty_prefix) <- c("i", "")
expect_error(
  mascot:::.mascot_abort_base(msg_empty_prefix, env = environment()),
  info = ".mascot_abort_base: empty-string prefix treated as plain line"
)

# ---------------------------------------------------------------------------
# .mascot_abort() – else branch (cli suppressed via option)
# ---------------------------------------------------------------------------
old_opt <- options(mascot.no_cli = TRUE)
expect_error(
  mascot:::.mascot_abort("no-cli single error"),
  info = ".mascot_abort else branch dispatches to base fallback"
)
options(old_opt)
# ---------------------------------------------------------------------------
# .mascot_download_file() – exercised with a file:// URL (no network)
# ---------------------------------------------------------------------------
fake_obj <- list(check = "download_file_coverage")
src_file <- tempfile(fileext = ".rds")
dst_file <- tempfile(fileext = ".rds")
saveRDS(fake_obj, src_file)
mascot:::.mascot_download_file(paste0("file://", src_file), dst_file)
expect_equal(
  readRDS(dst_file),
  fake_obj,
  info = ".mascot_download_file downloads and the rds round-trips correctly"
)
unlink(c(src_file, dst_file))

