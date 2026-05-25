library(mascot)

# Mock .mascot_download_file so no network is required
fake_bundle <- list(mock = TRUE)
orig_dl <- get(".mascot_download_file", envir = asNamespace("mascot"))
assignInNamespace(
  ".mascot_download_file",
  function(url, destfile) saveRDS(fake_bundle, destfile),
  ns = "mascot"
)

# Discover and call every HCP1065_* accessor function in the package
bundle_fns <- ls(asNamespace("mascot"))
bundle_fns <- bundle_fns[grepl("^HCP1065_", bundle_fns)]
bundle_fns <- bundle_fns[vapply(
  bundle_fns,
  function(n) is.function(get(n, envir = asNamespace("mascot"))),
  logical(1)
)]

for (fn_name in bundle_fns) {
  expect_equal(
    do.call(get(fn_name, envir = asNamespace("mascot")), list()),
    fake_bundle,
    info = paste(fn_name, "returns the mocked bundle object")
  )
}

# Restore
assignInNamespace(".mascot_download_file", orig_dl, ns = "mascot")
