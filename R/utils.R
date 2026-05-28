#' List available datasets
#'
#' Returns the names of all tractography atlas datasets that can be accessed
#' via [import_bundle()].
#'
#' @returns A character vector of dataset names.
#'
#' @export
#' @examples
#' available_datasets()
available_datasets <- function() {
  return(c("HCP1065", "TractSeg"))
}

# Internal helpers: use cli when available, otherwise fall back to base R.
# cli supports named-vector bullet formatting and glue-style interpolation;
# the fallback collapses everything into a plain message.
# Base-R fallback used when cli is not available. Extracted to a named
# function so it can be tested independently for coverage.
.mascot_abort_base <- function(msg, env) {
  if (length(msg) > 1) {
    prefixes <- names(msg)
    lines <- mapply(function(prefix, text) {
      text <- .mascot_interp(text, env = env)
      if (!is.null(prefix) && nchar(prefix) > 0) {
        paste0(prefix, " ", text)
      } else {
        text
      }
    }, prefixes, msg)
    stop(paste(lines, collapse = "\n"), call. = FALSE)
  } else {
    stop(.mascot_interp(msg, env = env), call. = FALSE)
  }
}

.mascot_abort <- function(msg, call = sys.call(-1)) {
  use_cli <- !isTRUE(getOption("mascot.no_cli")) &&
    requireNamespace("cli", quietly = TRUE)
  if (use_cli) {
    cli::cli_abort(msg, call = call)
  } else {
    .mascot_abort_base(msg, env = parent.frame())
  }
}

# Minimal glue-style interpolation using the supplied environment.
.mascot_interp <- function(msg, env = parent.frame()) {
  result <- character(length(msg))
  for (i in seq_along(msg)) {
    text <- msg[i]
    # Step 1: {.val {varname}} (cli-style quoted value)
    hits <- regmatches(text, gregexpr("\\{[.]val \\{([^}]+)\\}\\}", text, perl = TRUE))[[1]]
    for (hit in unique(hits)) {
      var <- sub("^\\{[.]val \\{(.*)\\}\\}$", "\\1", hit)
      val <- tryCatch(
        paste(eval(parse(text = var), envir = env), collapse = ", "),
        error = function(e) hit
      )
      text <- gsub(hit, val, text, fixed = TRUE)
    }
    # Step 2: simple {expr}
    hits2 <- regmatches(text, gregexpr("\\{([^{}]+)\\}", text, perl = TRUE))[[1]]
    for (hit in unique(hits2)) {
      expr_str <- sub("^\\{(.*)\\}$", "\\1", hit)
      val <- tryCatch(
        paste(eval(parse(text = expr_str), envir = env), collapse = ", "),
        error = function(e) hit
      )
      text <- gsub(hit, val, text, fixed = TRUE)
    }
    result[i] <- text
  }
  result
}

# Thin wrapper around download.file; separated so tests can mock it.
.mascot_download_file <- function(url, destfile) {
  download.file(url = url, destfile = destfile, mode = "wb")
}

#' List available bundles for a dataset
#'
#' Returns the full names of all white-matter bundles available in the
#' specified dataset. The returned names are the values to supply to the
#' `bundle` argument of [import_bundle()].
#'
#' @param dataset A string naming the dataset. Must be one of the values
#'   returned by [available_datasets()].
#'
#' @returns A character vector of bundle names.
#'
#' @export
#' @examples
#' available_bundles("HCP1065")
#' available_bundles("TractSeg")
available_bundles <- function(dataset) {
  if (!(dataset %in% available_datasets())) {
    .mascot_abort("Dataset not supported. Currently available datasets are {available_datasets()}.")
  }

  switch(dataset,
    "HCP1065" = names(HCP1065_ACRONYM_LIST),
    "TractSeg" = names(TractSeg_BUNDLE_LIST)
  )
}

HCP1065_ACRONYM_LIST <- c(
  "Anterior Commissure" = "AC",
  "Left Arcuate Fasciculus" = "AF_L",
  "Right Arcuate Fasciculus" = "AF_R",
  "Left Acoustic Radiation" = "AR_L",
  "Right Acoustic Radiation" = "AR_R",
  "Left Frontal Parietal Cingulum" = "C_FP_L",
  "Right Frontal Parietal Cingulum" = "C_FP_R",
  "Left Frontal Parahippocampal Cingulum" = "C_FPH_L",
  "Right Frontal Parahippocampal Cingulum" = "C_FPH_R",
  "Left Parahippocampal Cingulum" = "C_PH_L",
  "Right Parahippocampal Cingulum" = "C_PH_R",
  "Left Parahippocampal Parietal Cingulum" = "C_PHP_L",
  "Right Parahippocampal Parietal Cingulum" = "C_PHP_R",
  "Left Parolfactory Cingulum" = "C_PO_L",
  "Right Parolfactory Cingulum" = "C_PO_R",
  "Left Cerebellum" = "CB_L",
  "Right Cerebellum" = "CB_R",
  "Left Corticobulbar Tract" = "CBT_L",
  "Right Corticobulbar Tract" = "CBT_R",
  "Corpus Callosum" = "CC",
  "Left Cranial Nerve II" = "CNII_L",
  "Right Cranial Nerve II" = "CNII_R",
  "Left Cranial Nerve III" = "CNIII_L",
  "Right Cranial Nerve III" = "CNIII_R",
  "Left Cranial Nerve V" = "CNV_L",
  "Right Cranial Nerve V" = "CNV_R",
  "Left Cranial Nerve VII" = "CNVII_L",
  "Right Cranial Nerve VII" = "CNVII_R",
  "Left Cranial Nerve VIII" = "CNVIII_L",
  "Right Cranial Nerve VIII" = "CNVIII_R",
  "Left Frontal Corticopontine Tract" = "CPT_F_L",
  "Right Frontal Corticopontine Tract" = "CPT_F_R",
  "Left Occipital Corticopontine Tract" = "CPT_O_L",
  "Right Occipital Corticopontine Tract" = "CPT_O_R",
  "Left Parietal Corticopontine Tract" = "CPT_P_L",
  "Right Parietal Corticopontine Tract" = "CPT_P_R",
  "Left Anterior Corticostriatal Tract" = "CS_A_L",
  "Right Anterior Corticostriatal Tract" = "CS_A_R",
  "Left Posterior Corticostriatal Tract" = "CS_P_L",
  "Right Posterior Corticostriatal Tract" = "CS_P_R",
  "Left Superior Corticostriatal Tract" = "CS_S_L",
  "Right Superior Corticostriatal Tract" = "CS_S_R",
  "Left Corticospinal Tract" = "CST_L",
  "Right Corticospinal Tract" = "CST_R",
  "Left Dentatorubrothalamic Tract" = "DRTT_L",
  "Right Dentatorubrothalamic Tract" = "DRTT_R",
  "Left Extreme Capsule" = "EMC_L",
  "Right Extreme Capsule" = "EMC_R",
  "Left Fornix" = "F_L",
  "Right Fornix" = "F_R",
  "Left Frontal Aslant Tract" = "FAT_L",
  "Right Frontal Aslant Tract" = "FAT_R",
  "Left Inferior Cerebellar Peduncle" = "ICP_L",
  "Right Inferior Cerebellar Peduncle" = "ICP_R",
  "Left Inferior Fronto-Occipital Fasciculus" = "IFOF_L",
  "Right Inferior Fronto-Occipital Fasciculus" = "IFOF_R",
  "Left Inferior Longitudinal Fasciculus" = "ILF_L",
  "Right Inferior Longitudinal Fasciculus" = "ILF_R",
  "Middle Cerebellar Peduncle" = "MCP",
  "Left Middle Longitudinal Fasciculus" = "MdLF_L",
  "Right Middle Longitudinal Fasciculus" = "MdLF_R",
  "Left Medial Lemniscus" = "ML_L",
  "Right Medial Lemniscus" = "ML_R",
  "Left Optic Radiation" = "OR_L",
  "Right Optic Radiation" = "OR_R",
  "Left Parietal Aslant Tract" = "PAT_L",
  "Right Parietal Aslant Tract" = "PAT_R",
  "Left Reticulospinal Tract" = "RST_L",
  "Right Reticulospinal Tract" = "RST_R",
  "Superior Cerebellar Peduncle" = "SCP",
  "Left Superior Longitudinal Fasciculus I" = "SLF1_L",
  "Right Superior Longitudinal Fasciculus I" = "SLF1_R",
  "Left Superior Longitudinal Fasciculus II" = "SLF2_L",
  "Right Superior Longitudinal Fasciculus II" = "SLF2_R",
  "Left Superior Longitudinal Fasciculus III" = "SLF3_L",
  "Right Superior Longitudinal Fasciculus III" = "SLF3_R",
  "Left Anterior Thalamic Radiation" = "TR_A_L",
  "Right Anterior Thalamic Radiation" = "TR_A_R",
  "Left Posterior Thalamic Radiation" = "TR_P_L",
  "Right Posterior Thalamic Radiation" = "TR_P_R",
  "Left Superior Thalamic Radiation" = "TR_S_L",
  "Right Superior Thalamic Radiation" = "TR_S_R",
  "Left Uncinate Fasciculus" = "UF_L",
  "Right Uncinate Fasciculus" = "UF_R",
  "Vermis" = "V",
  "Left Vertical Occipital Fasciculus" = "VOF_L",
  "Right Vertical Occipital Fasciculus" = "VOF_R"
)

# TractSeg bundle name → trk file stem (= GitHub release asset prefix)
# 72 bundles from Wasserthal et al. (2018), https://zenodo.org/records/1477956
TractSeg_BUNDLE_LIST <- c(
  "Left Arcuate Fasciculus"                    = "AF_left",
  "Right Arcuate Fasciculus"                   = "AF_right",
  "Left Anterior Thalamic Radiation"           = "ATR_left",
  "Right Anterior Thalamic Radiation"          = "ATR_right",
  "Commissure Anterior"                        = "CA",
  "Corpus Callosum"                            = "CC",
  "Corpus Callosum Rostrum"                    = "CC_1",
  "Corpus Callosum Genu"                       = "CC_2",
  "Corpus Callosum Rostral Body"               = "CC_3",
  "Corpus Callosum Anterior Midbody"           = "CC_4",
  "Corpus Callosum Posterior Midbody"          = "CC_5",
  "Corpus Callosum Isthmus"                    = "CC_6",
  "Corpus Callosum Splenium"                   = "CC_7",
  "Left Cingulum"                              = "CG_left",
  "Right Cingulum"                             = "CG_right",
  "Left Corticospinal Tract"                   = "CST_left",
  "Right Corticospinal Tract"                  = "CST_right",
  "Left Fronto-Pontine Tract"                  = "FPT_left",
  "Right Fronto-Pontine Tract"                 = "FPT_right",
  "Left Fornix"                                = "FX_left",
  "Right Fornix"                               = "FX_right",
  "Left Inferior Cerebellar Peduncle"          = "ICP_left",
  "Right Inferior Cerebellar Peduncle"         = "ICP_right",
  "Left Inferior Fronto-Occipital Fasciculus"  = "IFO_left",
  "Right Inferior Fronto-Occipital Fasciculus" = "IFO_right",
  "Left Inferior Longitudinal Fasciculus"      = "ILF_left",
  "Right Inferior Longitudinal Fasciculus"     = "ILF_right",
  "Middle Cerebellar Peduncle"                 = "MCP",
  "Left Middle Longitudinal Fasciculus"        = "MLF_left",
  "Right Middle Longitudinal Fasciculus"       = "MLF_right",
  "Left Optic Radiation"                       = "OR_left",
  "Right Optic Radiation"                      = "OR_right",
  "Left Parieto-Occipital Pontine Tract"       = "POPT_left",
  "Right Parieto-Occipital Pontine Tract"      = "POPT_right",
  "Left Superior Cerebellar Peduncle"          = "SCP_left",
  "Right Superior Cerebellar Peduncle"         = "SCP_right",
  "Left Superior Longitudinal Fasciculus I"    = "SLF_I_left",
  "Right Superior Longitudinal Fasciculus I"   = "SLF_I_right",
  "Left Superior Longitudinal Fasciculus II"   = "SLF_II_left",
  "Right Superior Longitudinal Fasciculus II"  = "SLF_II_right",
  "Left Superior Longitudinal Fasciculus III"  = "SLF_III_left",
  "Right Superior Longitudinal Fasciculus III" = "SLF_III_right",
  "Left Superior Thalamic Radiation"           = "STR_left",
  "Right Superior Thalamic Radiation"          = "STR_right",
  "Left Striato-Fronto-Orbital Tract"          = "ST_FO_left",
  "Right Striato-Fronto-Orbital Tract"         = "ST_FO_right",
  "Left Striato-Occipital Tract"               = "ST_OCC_left",
  "Right Striato-Occipital Tract"              = "ST_OCC_right",
  "Left Striato-Parietal Tract"                = "ST_PAR_left",
  "Right Striato-Parietal Tract"               = "ST_PAR_right",
  "Left Striato-Postcentral Tract"             = "ST_POSTC_left",
  "Right Striato-Postcentral Tract"            = "ST_POSTC_right",
  "Left Striato-Precentral Tract"              = "ST_PREC_left",
  "Right Striato-Precentral Tract"             = "ST_PREC_right",
  "Left Striato-Prefrontal Tract"              = "ST_PREF_left",
  "Right Striato-Prefrontal Tract"             = "ST_PREF_right",
  "Left Striato-Premotor Tract"                = "ST_PREM_left",
  "Right Striato-Premotor Tract"               = "ST_PREM_right",
  "Left Thalamo-Occipital Tract"               = "T_OCC_left",
  "Right Thalamo-Occipital Tract"              = "T_OCC_right",
  "Left Thalamo-Parietal Tract"                = "T_PAR_left",
  "Right Thalamo-Parietal Tract"               = "T_PAR_right",
  "Left Thalamo-Postcentral Tract"             = "T_POSTC_left",
  "Right Thalamo-Postcentral Tract"            = "T_POSTC_right",
  "Left Thalamo-Precentral Tract"              = "T_PREC_left",
  "Right Thalamo-Precentral Tract"             = "T_PREC_right",
  "Left Thalamo-Prefrontal Tract"              = "T_PREF_left",
  "Right Thalamo-Prefrontal Tract"             = "T_PREF_right",
  "Left Thalamo-Premotor Tract"                = "T_PREM_left",
  "Right Thalamo-Premotor Tract"               = "T_PREM_right",
  "Left Uncinate Fasciculus"                   = "UF_left",
  "Right Uncinate Fasciculus"                  = "UF_right"
)

# Discover available subjects for a TractSeg bundle by querying the GitHub
# Releases API for the matching release tag.  Returns a character vector of
# subject IDs parsed from the .rds asset names.
.tractseg_subject_list <- function(bundle_stem) {
  api_url <- paste0(
    "https://api.github.com/repos/tractoverse/mascot/releases/tags/tractseg-",
    bundle_stem
  )
  con <- url(api_url)
  json_lines <- tryCatch(
    readLines(con, warn = FALSE),
    error = function(e) {
      close(con)
      stop(e)
    }
  )
  close(con)
  json_text <- paste(json_lines, collapse = "")

  # Extract matching asset names with a targeted regex — no jsonlite needed.
  rds_pattern <- paste0("TractSeg_[^\"]+_", bundle_stem, "\\.rds")
  asset_names <- regmatches(json_text, gregexpr(rds_pattern, json_text))[[1L]]

  # Parse subject IDs from filenames: TractSeg_<subject>_<bundle_stem>.rds
  sub(paste0("^TractSeg_(.+)_", bundle_stem, "\\.rds$"), "\\1", asset_names)
}
