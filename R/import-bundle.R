#' Import a bundle hosted in GitHub releases
#' 
#' This function allows you to import a bundle from one of the available datasets by specifying
#' the dataset and the bundle name. Available datasets can be queried using `available_datasets()`.
#' Available bundles for a given dataset can be queried using `available_bundles(dataset)`, which
#' will return the list of bundles in the specified dataset. The function will return an object of
#' class `bundle` containing the streamlines for the specified bundle. The `bundle` S7 class is
#' defined in the fiber package.
#' 
#' @param dataset A string specifying the dataset to import the bundle from. Currently only `"HCP1065"` is supported.
#' @param bundle A string specifying the bundle to import. Must be one of the names of the bundles in the specified
#' dataset. See `available_bundles(dataset)` for the list of available bundles in the specified dataset.
#' 
#' @returns An object of class `bundle` containing the streamlines for the specified bundle.
#' 
#' @export
#' @examples
#' import_bundle("HCP1065", "Left Cranial Nerve VII")
import_bundle <- function(dataset, bundle) {
  if (!dataset %in% available_datasets()) {
    cli::cli_abort("Dataset not supported. Currently available datasets are {available_datasets()}.")
  }

  if (!bundle %in% available_bundles(dataset)) {
    cli::cli_abort(c(
      "The {dataset} dataset does not contain the bundle {.val {bundle}}.",
      "i" = "Available bundles:",
      "*" = available_bundles(dataset)
    ))
  }

  short_bundle <- HCP1065_ACRONYM_LIST[[bundle]]
  tf <- tempfile(fileext = ".rds")
  download.file(
    url = paste0("https://github.com/tractoverse/mascot/releases/download/hcp1065/HCP1065_", short_bundle, ".rds"),
    destfile = tf, 
    mode = "wb"
  )
  bdl <- readRDS(tf)
  unlink(tf)
  bdl
  # readRDS(system.file("extdata", paste0("HCP1065_", bundle, ".rds"), package = "mascot"))
}
