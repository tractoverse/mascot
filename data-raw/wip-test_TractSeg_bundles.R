library(toad)

# Mock .toad_download_file and .tractseg_subject_list so no network is needed
fake_bundle <- list(mock = TRUE)
fake_subjects <- c("100307", "100408")

orig_dl <- get(".toad_download_file", envir = asNamespace("toad"))
orig_tsl <- get(".tractseg_subject_list", envir = asNamespace("toad"))

assignInNamespace(
  ".toad_download_file",
  function(url, destfile) saveRDS(fake_bundle, destfile),
  ns = "toad"
)
assignInNamespace(
  ".tractseg_subject_list",
  function(bundle_stem) fake_subjects,
  ns = "toad"
)

# Discover and call every TractSeg_* accessor function in the package
bundle_fns <- ls(asNamespace("toad"))
bundle_fns <- bundle_fns[grepl("^TractSeg_", bundle_fns)]
bundle_fns <- bundle_fns[vapply(
  bundle_fns,
  function(n) is.function(get(n, envir = asNamespace("toad"))),
  logical(1)
)]

for (fn_name in bundle_fns) {
  result <- do.call(get(fn_name, envir = asNamespace("toad")), list())
  expect_true(
    fiber::is_bundle_set(result) && length(result) == length(fake_subjects),
    info = paste(fn_name, "returns list of subjects (default subjects=NULL)")
  )
  expect_equal(
    result[[1L]], fake_bundle,
    info = paste(fn_name, "first element is the mocked bundle")
  )
}

# Restore
assignInNamespace(".toad_download_file", orig_dl, ns = "toad")
assignInNamespace(".tractseg_subject_list", orig_tsl, ns = "toad")
