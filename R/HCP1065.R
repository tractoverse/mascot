#' HCP-YA1065 Tractography Atlas
#'
#' @description HCP-YA1065 atlas is an updated atlas from HCP-YA842 atlas. The
#'   new atlas relies on 1,065 subjects and is based on [ICBM 2009a Nonlinear
#'   Asymmetric](https://www.bic.mni.mcgill.ca/ServicesAtlases/ICBM152NLin2009)
#'   space, whereas HCP-YA842 relied on 842 subjects and was based on FSL’s FA
#'   map (58 FA images averaged to old MNI152). The new atlas further provides
#'   subcomponents for cingulum, SLF, corticopontine track, corticostriatal
#'   track, corticothalamic track (renamed as thalamic radiation).
#'
#' @details The included bundles are stored as objects of class `bundle` as
#'  defined in the [fiber](https://tractoverse.github.io/fiber/) package. A
#'  `bundle` object is an S7 class which has two slots: `@streamlines` and
#'  `@bundle_data`, where:
#'  
#'  - `@streamlines` is a list of `streamline` objects, which, in turn, are
#'  S7 classes with slots `@points`, `@point_data` and `@streamline_data`.
#'  - `@bundle_data` is a list of metadata about the bundle, such as its name,
#'  where it was extracted from, etc.
#' 
#' More details about the format of the data can be found in the documentation
#' of the [fiber](https://tractoverse.github.io/fiber/) package.
#'
#' @source \url{https://brain.labsolver.org/hcp_trk_atlas.html}
#' @references
#'   - Yeh, Fang-Cheng, et al. "Population-averaged atlas of the macroscale
#'   human structural connectome and its network topology." Neuroimage 178 (2018):
#'   57-68. https://doi.org/10.1016/j.neuroimage.2018.05.027
#'   - Yeh, Fang-Cheng. "Population-based tract-to-region connectome of
#'   the human brain and its hierarchical topology." Nature communications 13.1
#'   (2022): 4933. https://doi.org/10.1038/s41467-022-32595-4
#' @name HCP-YA1065
NULL

#' HCP-YA1065 Anterior Commissure
#' @rdname HCP-YA1065
#' @export
HCP1065_AC <- function() {
  # readRDS(system.file("extdata", "HCP1065_AC.rds", package = "mascot"))
  tf <- tempfile(fileext = ".rds")
  download.file(
    url = "https://github.com/tractoverse/mascot/releases/download/v0.1.0/HCP1065_AC.rds",
    destfile = tf, 
    mode = "wb"
  )
  bdl <- readRDS(tf)
  unlink(tf)
  bdl
}

#' HCP-YA1065 Left Arcuate Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_AF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_AF_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Arcuate Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_AF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_AF_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Acoustic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_AR_L <- function() {
  readRDS(system.file("extdata", "HCP1065_AR_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Acoustic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_AR_R <- function() {
  readRDS(system.file("extdata", "HCP1065_AR_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Frontal Parietal Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_FP_L <- function() {
  readRDS(system.file("extdata", "HCP1065_C_FP_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Frontal Parietal Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_FP_R <- function() {
  readRDS(system.file("extdata", "HCP1065_C_FP_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Frontal Parahippocampal Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_FPH_L <- function() {
  readRDS(system.file("extdata", "HCP1065_C_FPH_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Frontal Parahippocampal Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_FPH_R <- function() {
  readRDS(system.file("extdata", "HCP1065_C_FPH_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Parahippocampal Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_PH_L <- function() {
  readRDS(system.file("extdata", "HCP1065_C_PH_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Parahippocampal Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_PH_R <- function() {
  readRDS(system.file("extdata", "HCP1065_C_PH_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Parahippocampal Parietal Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_PHP_L <- function() {
  readRDS(system.file("extdata", "HCP1065_C_PHP_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Parahippocampal Parietal Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_PHP_R <- function() {
  readRDS(system.file("extdata", "HCP1065_C_PHP_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Parolfactory Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_PO_L <- function() {
  readRDS(system.file("extdata", "HCP1065_C_PO_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Parolfactory Cingulum
#' @inherit HCP-YA1065 description details source references
HCP1065_C_PO_R <- function() {
  readRDS(system.file("extdata", "HCP1065_C_PO_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Cerebellum
#' @inherit HCP-YA1065 description details source references
HCP1065_CB_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CB_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Cerebellum
#' @inherit HCP-YA1065 description details source references
HCP1065_CB_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CB_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Corticobulbar Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CBT_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CBT_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Corticobulbar Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CBT_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CBT_R.rds", package = "mascot"))
}

#' HCP-YA1065 Corpus Callosum
#' @inherit HCP-YA1065 description details source references
HCP1065_CC <- function() {
  readRDS(system.file("extdata", "HCP1065_CC.rds", package = "mascot"))
}

#' HCP-YA1065 Left Cranial Nerve II
#' @inherit HCP-YA1065 description details source references
HCP1065_CNII_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNII_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Cranial Nerve II
#' @inherit HCP-YA1065 description details source references
HCP1065_CNII_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNII_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Cranial Nerve III
#' @inherit HCP-YA1065 description details source references
HCP1065_CNIII_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNIII_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Cranial Nerve III
#' @inherit HCP-YA1065 description details source references
HCP1065_CNIII_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNIII_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Cranial Nerve V
#' @inherit HCP-YA1065 description details source references
HCP1065_CNV_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNV_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Cranial Nerve V
#' @inherit HCP-YA1065 description details source references
HCP1065_CNV_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNV_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Cranial Nerve VII
#' @inherit HCP-YA1065 description details source references
HCP1065_CNVII_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNVII_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Cranial Nerve VII
#' @inherit HCP-YA1065 description details source references
HCP1065_CNVII_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNVII_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Cranial Nerve VIII
#' @inherit HCP-YA1065 description details source references
HCP1065_CNVIII_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNVIII_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Cranial Nerve VIII
#' @inherit HCP-YA1065 description details source references
HCP1065_CNVIII_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNVIII_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Frontal Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CPT_F_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_F_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Frontal Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CPT_F_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_F_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Occipital Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CPT_O_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_O_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Occipital Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CPT_O_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_O_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Parietal Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CPT_P_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_P_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Parietal Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CPT_P_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_P_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Anterior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CS_A_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_A_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Anterior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CS_A_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_A_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Posterior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CS_P_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_P_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Posterior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CS_P_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_P_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Superior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CS_S_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_S_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Superior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CS_S_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_S_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Corticospinal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CST_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CST_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Corticospinal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_CST_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CST_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Dentatorubrothalamic Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_DRTT_L <- function() {
  readRDS(system.file("extdata", "HCP1065_DRTT_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Dentatorubrothalamic Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_DRTT_R <- function() {
  readRDS(system.file("extdata", "HCP1065_DRTT_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Extreme Capsule
#' @inherit HCP-YA1065 description details source references
HCP1065_EMC_L <- function() {
  readRDS(system.file("extdata", "HCP1065_EMC_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Extreme Capsule
#' @inherit HCP-YA1065 description details source references
HCP1065_EMC_R <- function() {
  readRDS(system.file("extdata", "HCP1065_EMC_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Fornix
#' @inherit HCP-YA1065 description details source references
HCP1065_F_L <- function() {
  readRDS(system.file("extdata", "HCP1065_F_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Fornix
#' @inherit HCP-YA1065 description details source references
HCP1065_F_R <- function() {
  readRDS(system.file("extdata", "HCP1065_F_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Frontal Aslant Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_FAT_L <- function() {
  readRDS(system.file("extdata", "HCP1065_FAT_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Frontal Aslant Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_FAT_R <- function() {
  readRDS(system.file("extdata", "HCP1065_FAT_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Inferior Cerebellar Peduncle
#' @inherit HCP-YA1065 description details source references
HCP1065_ICP_L <- function() {
  readRDS(system.file("extdata", "HCP1065_ICP_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Inferior Cerebellar Peduncle
#' @inherit HCP-YA1065 description details source references
HCP1065_ICP_R <- function() {
  readRDS(system.file("extdata", "HCP1065_ICP_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Inferior Fronto-Occipital Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_IFOF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_IFOF_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Inferior Fronto-Occipital Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_IFOF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_IFOF_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Inferior Longitudinal Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_ILF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_ILF_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Inferior Longitudinal Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_ILF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_ILF_R.rds", package = "mascot"))
}

#' HCP-YA1065 Middle Cerebellar Peduncle
#' @inherit HCP-YA1065 description details source references
HCP1065_MCP <- function() {
  readRDS(system.file("extdata", "HCP1065_MCP.rds", package = "mascot"))
}

#' HCP-YA1065 Left Middle Longitudinal Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_MdLF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_MdLF_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Middle Longitudinal Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_MdLF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_MdLF_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Medial Lemniscus
#' @inherit HCP-YA1065 description details source references
HCP1065_ML_L <- function() {
  readRDS(system.file("extdata", "HCP1065_ML_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Medial Lemniscus
#' @inherit HCP-YA1065 description details source references
HCP1065_ML_R <- function() {
  readRDS(system.file("extdata", "HCP1065_ML_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Optic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_OR_L <- function() {
  readRDS(system.file("extdata", "HCP1065_OR_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Optic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_OR_R <- function() {
  readRDS(system.file("extdata", "HCP1065_OR_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Parietal Aslant Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_PAT_L <- function() {
  readRDS(system.file("extdata", "HCP1065_PAT_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Parietal Aslant Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_PAT_R <- function() {
  readRDS(system.file("extdata", "HCP1065_PAT_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Reticulospinal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_RST_L <- function() {
  readRDS(system.file("extdata", "HCP1065_RST_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Reticulospinal Tract
#' @inherit HCP-YA1065 description details source references
HCP1065_RST_R <- function() {
  readRDS(system.file("extdata", "HCP1065_RST_R.rds", package = "mascot"))
}

#' HCP-YA1065 Superior Cerebellar Peduncle
#' @inherit HCP-YA1065 description details source references
HCP1065_SCP <- function() {
  readRDS(system.file("extdata", "HCP1065_SCP.rds", package = "mascot"))
}

#' HCP-YA1065 Left Superior Longitudinal Fasciculus I
#' @inherit HCP-YA1065 description details source references
HCP1065_SLF1_L <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF1_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Superior Longitudinal Fasciculus I
#' @inherit HCP-YA1065 description details source references
HCP1065_SLF1_R <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF1_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Superior Longitudinal Fasciculus II
#' @inherit HCP-YA1065 description details source references
HCP1065_SLF2_L <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF2_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Superior Longitudinal Fasciculus II
#' @inherit HCP-YA1065 description details source references
HCP1065_SLF2_R <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF2_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Superior Longitudinal Fasciculus III
#' @inherit HCP-YA1065 description details source references
HCP1065_SLF3_L <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF3_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Superior Longitudinal Fasciculus III
#' @inherit HCP-YA1065 description details source references
HCP1065_SLF3_R <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF3_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Anterior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_TR_A_L <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_A_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Anterior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_TR_A_R <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_A_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Posterior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_TR_P_L <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_P_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Posterior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_TR_P_R <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_P_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Superior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_TR_S_L <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_S_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Superior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
HCP1065_TR_S_R <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_S_R.rds", package = "mascot"))
}

#' HCP-YA1065 Left Uncinate Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_UF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_UF_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Uncinate Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_UF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_UF_R.rds", package = "mascot"))
}

#' HCP-YA1065 Vermis
#' @inherit HCP-YA1065 description details source references
HCP1065_V <- function() {
  readRDS(system.file("extdata", "HCP1065_V.rds", package = "mascot"))
}

#' HCP-YA1065 Left Vertical Occipital Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_VOF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_VOF_L.rds", package = "mascot"))
}

#' HCP-YA1065 Right Vertical Occipital Fasciculus
#' @inherit HCP-YA1065 description details source references
HCP1065_VOF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_VOF_R.rds", package = "mascot"))
}

#' Get a bundle from the HCP-YA1065 dataset
#' 
#' This function allows you to get a bundle from the HCP-YA1065 dataset by specifying
#' the dataset and the bundle name. The bundle name must be one of the names of the
#' bundles in the HCP-YA1065 dataset, which can be found in the `HCP1065_ACRONYM_LIST`
#' object. The function will return a data frame containing the streamlines for the
#' specified bundle.
#' 
#' @param dataset The dataset to get the bundle from. Currently only "HCP-YA1065" is supported.
#' @param bundle The bundle to get. Must be one of the names of the bundles in the HCP-YA1065
#' dataset. See `HCP1065_ACRONYM_LIST` for the list of bundles and their corresponding acronyms.
#' 
#' @returns A data frame containing the streamlines for the specified bundle.
#' 
#' @export
#' @examples
#' get_bundle("HCP1065", "Left Arcuate Fasciculus")
get_bundle <- function(dataset, bundle) {
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
    url = paste0("https://github.com/tractoverse/mascot/releases/download/v0.1.0/HCP1065_", short_bundle, ".rds"),
    destfile = tf, 
    mode = "wb"
  )
  bdl <- readRDS(tf)
  unlink(tf)
  bdl
  # readRDS(system.file("extdata", paste0("HCP1065_", bundle, ".rds"), package = "mascot"))
}

available_bundles <- function(dataset) {
  if (!(dataset %in% available_datasets())) {
    cli::cli_abort("Dataset not supported. Currently available datasets are {available_datasets()}.")
  }

  switch(dataset,
    "HCP1065" = names(HCP1065_ACRONYM_LIST)
  )
}

available_datasets <- function() {
  return(c("HCP1065"))
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