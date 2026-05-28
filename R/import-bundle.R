#' Import a bundle hosted in GitHub releases
#' 
#' This function allows you to import a bundle from one of the available datasets by specifying
#' the dataset and the bundle name. Available datasets can be queried using [`available_datasets()`].
#' Available bundles for a given dataset can be queried using [`available_bundles()`], which
#' will return the list of bundles in the specified dataset. For multi-subject datasets (e.g.
#' `"TractSeg"`), the `subjects` argument controls which subjects are loaded. For single-atlas
#' datasets (e.g. `"HCP1065"`), `subjects` is ignored.
#' 
#' @inheritSection HCP1065 HCP1065
#' 
#' @param dataset A string specifying the dataset to import the bundle from. Currently
#'   `"HCP1065"` and `"TractSeg"` are supported.
#' @param bundle A string specifying the bundle to import. Must be one of the names returned by
#'   [`available_bundles()`] for the chosen dataset.
#' @param subjects Controls which subjects are loaded for multi-subject datasets (ignored for
#'   `"HCP1065"`). Three forms are accepted:
#'   \describe{
#'     \item{`NULL` (default)}{All available subjects are loaded and returned as a named list
#'       whose names are the subject IDs.}
#'     \item{An integer scalar `n`}{`n` subjects are drawn at random (without replacement) and
#'       returned as a named list.}
#'     \item{A character string}{The bundle for that single subject ID is returned directly as a
#'       [fiber::bundle] object (not wrapped in a list).}
#'   }
#' 
#' @returns For `"HCP1065"`, or for `"TractSeg"` with a character `subjects` value: an object
#'   of class [fiber::bundle]. For `"TractSeg"` with `subjects = NULL` or an integer: a named
#'   list of [fiber::bundle] objects, one per subject.
#' 
#' @export
#' @examples
#' bdl <- import_bundle("HCP1065", "Left Cranial Nerve VII")
#' 
#' \dontrun{
#' # Single subject
#' bdl <- import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = "599469")
#' 
#' # Random sample of 10 subjects
#' bdls <- import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = 10L)
#' }
import_bundle <- function(dataset, bundle, subjects = NULL) {
  if (!dataset %in% available_datasets()) {
    .mascot_abort("Dataset not supported. Currently available datasets are {available_datasets()}.")
  }

  if (!bundle %in% available_bundles(dataset)) {
    .mascot_abort(c(
      "The {dataset} dataset does not contain the bundle {.val {bundle}}.",
      "i" = "Available bundles:",
      "*" = available_bundles(dataset)
    ))
  }

  if (dataset == "HCP1065") {
    short_bundle <- HCP1065_ACRONYM_LIST[[bundle]]
    tf <- tempfile(fileext = ".rds")
    on.exit(unlink(tf), add = TRUE)
    .mascot_download_file(
      url = paste0("https://github.com/tractoverse/mascot/releases/download/hcp1065/HCP1065_", short_bundle, ".rds"),
      destfile = tf
    )
    return(readRDS(tf))
  }

  # ---- TractSeg ----
  bundle_stem <- TractSeg_BUNDLE_LIST[[bundle]]

  # Discover available subject IDs for this bundle via a single GitHub API
  # call — avoids per-subject URL probing entirely.
  subject_names <- .tractseg_subject_list(bundle_stem)
  if (length(subject_names) == 0L) {
    .mascot_abort(c(
      "No subjects found for bundle {.val {bundle}}.",
      "i" = "The GitHub release \"tractseg-{bundle_stem}\" may not have been published yet.",
      "i" = "Run the \"Release TractSeg Data\" GitHub Actions workflow to generate the release assets."
    ))
  }

  if (is.null(subjects)) {
    # keep all validated subject_names
  } else if (is.numeric(subjects)) {
    n <- as.integer(subjects)
    if (n < 1L || n > length(subject_names)) {
      .mascot_abort("`subjects` must be between 1 and {length(subject_names)} (total available subjects).")
    }
    subject_names <- sample(subject_names, n)
  } else if (is.character(subjects)) {
    if (!subjects %in% subject_names) {
      .mascot_abort(c(
        "Subject {.val {subjects}} not found in the TractSeg dataset.",
        "i" = "Available subjects:",
        "*" = subject_names
      ))
    }
    subject_names <- subjects
  } else {
    .mascot_abort("`subjects` must be NULL, an integer count, or a subject ID string.")
  }

  out <- lapply(subject_names, function(subject) {
    url <- paste0("https://github.com/tractoverse/mascot/releases/download/tractseg-", bundle_stem, "/TractSeg_", subject, "_", bundle_stem, ".rds")
    tf <- tempfile(fileext = ".rds")
    on.exit(unlink(tf), add = TRUE)
    .mascot_download_file(url, tf)
    readRDS(tf)
  })

  if (length(out) == 1L && is.character(subjects)) {
    return(out[[1L]])
  }

  names(out) <- subject_names
  out
}
