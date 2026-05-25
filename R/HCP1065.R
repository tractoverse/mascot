#' HCP1065 Population-Averaged Tractography Atlas
#'
#' @description The HCP1065 population-averaged tractography atlas is an
#' updated atlas from the HCP842 version. The new atlas relies on 1,065
#' subjects and is based on
#' [ICBM 2009a Nonlinear Asymmetric](https://www.bic.mni.mcgill.ca/ServicesAtlases/ICBM152NLin2009)
#' space, whereas HCP842 relied on 842 subjects and was based on FSL’s
#' FA map (58 FA images averaged to old MNI152). The new atlas further
#' provides subcomponents for cingulum, superior longitudinal fasciculus,
#' corticopontine tract, corticostriatal tract, and corticothalamic tract
#' (renamed as thalamic radiation).
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
#' @name HCP1065
NULL

#' HCP1065 Anterior Commissure
#' @rdname HCP1065
#' @export
HCP1065_AC <- function() {
  # readRDS(system.file("extdata", "HCP1065_AC.rds", package = "mascot"))
  import_bundle("HCP1065", "Anterior Commissure")
}

#' HCP1065 Left Arcuate Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_AF_L <- function() {
  # readRDS(system.file("extdata", "HCP1065_AF_L.rds", package = "mascot"))
  import_bundle("HCP1065", "Left Arcuate Fasciculus")
}

#' HCP1065 Right Arcuate Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_AF_R <- function() {
  # readRDS(system.file("extdata", "HCP1065_AF_R.rds", package = "mascot"))
  import_bundle("HCP1065", "Right Arcuate Fasciculus")
}

#' HCP1065 Left Acoustic Radiation
#' @inherit HCP1065 description details source references
HCP1065_AR_L <- function() {
  # readRDS(system.file("extdata", "HCP1065_AR_L.rds", package = "mascot"))
  import_bundle("HCP1065", "Left Acoustic Radiation")
}

#' HCP1065 Right Acoustic Radiation
#' @inherit HCP1065 description details source references
HCP1065_AR_R <- function() {
  # readRDS(system.file("extdata", "HCP1065_AR_R.rds", package = "mascot"))
  import_bundle("HCP1065", "Right Acoustic Radiation")
}

#' HCP1065 Left Frontal Parietal Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_FP_L <- function() {
  # readRDS(system.file("extdata", "HCP1065_C_FP_L.rds", package = "mascot"))
  import_bundle("HCP1065", "Left Frontal Parietal Cingulum")
}

#' HCP1065 Right Frontal Parietal Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_FP_R <- function() {
  # readRDS(system.file("extdata", "HCP1065_C_FP_R.rds", package = "mascot"))
  import_bundle("HCP1065", "Right Frontal Parietal Cingulum")
}

#' HCP1065 Left Frontal Parahippocampal Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_FPH_L <- function() {
  # readRDS(system.file("extdata", "HCP1065_C_FPH_L.rds", package = "mascot"))
  import_bundle("HCP1065", "Left Frontal Parahippocampal Cingulum")
}

#' HCP1065 Right Frontal Parahippocampal Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_FPH_R <- function() {
  # readRDS(system.file("extdata", "HCP1065_C_FPH_R.rds", package = "mascot"))
  import_bundle("HCP1065", "Right Frontal Parahippocampal Cingulum")
}

#' HCP1065 Left Parahippocampal Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_PH_L <- function() {
  # readRDS(system.file("extdata", "HCP1065_C_PH_L.rds", package = "mascot"))
  import_bundle("HCP1065", "Left Parahippocampal Cingulum")
}

#' HCP1065 Right Parahippocampal Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_PH_R <- function() {
  # readRDS(system.file("extdata", "HCP1065_C_PH_R.rds", package = "mascot"))
  import_bundle("HCP1065", "Right Parahippocampal Cingulum")
}

#' HCP1065 Left Parahippocampal Parietal Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_PHP_L <- function() {
  # readRDS(system.file("extdata", "HCP1065_C_PHP_L.rds", package = "mascot"))
  import_bundle("HCP1065", "Left Parahippocampal Parietal Cingulum")
}

#' HCP1065 Right Parahippocampal Parietal Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_PHP_R <- function() {
  readRDS(system.file("extdata", "HCP1065_C_PHP_R.rds", package = "mascot"))
}

#' HCP1065 Left Parolfactory Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_PO_L <- function() {
  readRDS(system.file("extdata", "HCP1065_C_PO_L.rds", package = "mascot"))
}

#' HCP1065 Right Parolfactory Cingulum
#' @inherit HCP1065 description details source references
HCP1065_C_PO_R <- function() {
  readRDS(system.file("extdata", "HCP1065_C_PO_R.rds", package = "mascot"))
}

#' HCP1065 Left Cerebellum
#' @inherit HCP1065 description details source references
HCP1065_CB_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CB_L.rds", package = "mascot"))
}

#' HCP1065 Right Cerebellum
#' @inherit HCP1065 description details source references
HCP1065_CB_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CB_R.rds", package = "mascot"))
}

#' HCP1065 Left Corticobulbar Tract
#' @inherit HCP1065 description details source references
HCP1065_CBT_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CBT_L.rds", package = "mascot"))
}

#' HCP1065 Right Corticobulbar Tract
#' @inherit HCP1065 description details source references
HCP1065_CBT_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CBT_R.rds", package = "mascot"))
}

#' HCP1065 Corpus Callosum
#' @inherit HCP1065 description details source references
HCP1065_CC <- function() {
  readRDS(system.file("extdata", "HCP1065_CC.rds", package = "mascot"))
}

#' HCP1065 Left Cranial Nerve II
#' @inherit HCP1065 description details source references
HCP1065_CNII_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNII_L.rds", package = "mascot"))
}

#' HCP1065 Right Cranial Nerve II
#' @inherit HCP1065 description details source references
HCP1065_CNII_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNII_R.rds", package = "mascot"))
}

#' HCP1065 Left Cranial Nerve III
#' @inherit HCP1065 description details source references
HCP1065_CNIII_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNIII_L.rds", package = "mascot"))
}

#' HCP1065 Right Cranial Nerve III
#' @inherit HCP1065 description details source references
HCP1065_CNIII_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNIII_R.rds", package = "mascot"))
}

#' HCP1065 Left Cranial Nerve V
#' @inherit HCP1065 description details source references
HCP1065_CNV_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNV_L.rds", package = "mascot"))
}

#' HCP1065 Right Cranial Nerve V
#' @inherit HCP1065 description details source references
HCP1065_CNV_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNV_R.rds", package = "mascot"))
}

#' HCP1065 Left Cranial Nerve VII
#' @inherit HCP1065 description details source references
HCP1065_CNVII_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNVII_L.rds", package = "mascot"))
}

#' HCP1065 Right Cranial Nerve VII
#' @inherit HCP1065 description details source references
HCP1065_CNVII_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNVII_R.rds", package = "mascot"))
}

#' HCP1065 Left Cranial Nerve VIII
#' @inherit HCP1065 description details source references
HCP1065_CNVIII_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CNVIII_L.rds", package = "mascot"))
}

#' HCP1065 Right Cranial Nerve VIII
#' @inherit HCP1065 description details source references
HCP1065_CNVIII_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CNVIII_R.rds", package = "mascot"))
}

#' HCP1065 Left Frontal Corticopontine Tract
#' @inherit HCP1065 description details source references
HCP1065_CPT_F_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_F_L.rds", package = "mascot"))
}

#' HCP1065 Right Frontal Corticopontine Tract
#' @inherit HCP1065 description details source references
HCP1065_CPT_F_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_F_R.rds", package = "mascot"))
}

#' HCP1065 Left Occipital Corticopontine Tract
#' @inherit HCP1065 description details source references
HCP1065_CPT_O_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_O_L.rds", package = "mascot"))
}

#' HCP1065 Right Occipital Corticopontine Tract
#' @inherit HCP1065 description details source references
HCP1065_CPT_O_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_O_R.rds", package = "mascot"))
}

#' HCP1065 Left Parietal Corticopontine Tract
#' @inherit HCP1065 description details source references
HCP1065_CPT_P_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_P_L.rds", package = "mascot"))
}

#' HCP1065 Right Parietal Corticopontine Tract
#' @inherit HCP1065 description details source references
HCP1065_CPT_P_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CPT_P_R.rds", package = "mascot"))
}

#' HCP1065 Left Anterior Corticostriatal Tract
#' @inherit HCP1065 description details source references
HCP1065_CS_A_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_A_L.rds", package = "mascot"))
}

#' HCP1065 Right Anterior Corticostriatal Tract
#' @inherit HCP1065 description details source references
HCP1065_CS_A_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_A_R.rds", package = "mascot"))
}

#' HCP1065 Left Posterior Corticostriatal Tract
#' @inherit HCP1065 description details source references
HCP1065_CS_P_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_P_L.rds", package = "mascot"))
}

#' HCP1065 Right Posterior Corticostriatal Tract
#' @inherit HCP1065 description details source references
HCP1065_CS_P_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_P_R.rds", package = "mascot"))
}

#' HCP1065 Left Superior Corticostriatal Tract
#' @inherit HCP1065 description details source references
HCP1065_CS_S_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_S_L.rds", package = "mascot"))
}

#' HCP1065 Right Superior Corticostriatal Tract
#' @inherit HCP1065 description details source references
HCP1065_CS_S_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CS_S_R.rds", package = "mascot"))
}

#' HCP1065 Left Corticospinal Tract
#' @inherit HCP1065 description details source references
HCP1065_CST_L <- function() {
  readRDS(system.file("extdata", "HCP1065_CST_L.rds", package = "mascot"))
}

#' HCP1065 Right Corticospinal Tract
#' @inherit HCP1065 description details source references
HCP1065_CST_R <- function() {
  readRDS(system.file("extdata", "HCP1065_CST_R.rds", package = "mascot"))
}

#' HCP1065 Left Dentatorubrothalamic Tract
#' @inherit HCP1065 description details source references
HCP1065_DRTT_L <- function() {
  readRDS(system.file("extdata", "HCP1065_DRTT_L.rds", package = "mascot"))
}

#' HCP1065 Right Dentatorubrothalamic Tract
#' @inherit HCP1065 description details source references
HCP1065_DRTT_R <- function() {
  readRDS(system.file("extdata", "HCP1065_DRTT_R.rds", package = "mascot"))
}

#' HCP1065 Left Extreme Capsule
#' @inherit HCP1065 description details source references
HCP1065_EMC_L <- function() {
  readRDS(system.file("extdata", "HCP1065_EMC_L.rds", package = "mascot"))
}

#' HCP1065 Right Extreme Capsule
#' @inherit HCP1065 description details source references
HCP1065_EMC_R <- function() {
  readRDS(system.file("extdata", "HCP1065_EMC_R.rds", package = "mascot"))
}

#' HCP1065 Left Fornix
#' @inherit HCP1065 description details source references
HCP1065_F_L <- function() {
  readRDS(system.file("extdata", "HCP1065_F_L.rds", package = "mascot"))
}

#' HCP1065 Right Fornix
#' @inherit HCP1065 description details source references
HCP1065_F_R <- function() {
  readRDS(system.file("extdata", "HCP1065_F_R.rds", package = "mascot"))
}

#' HCP1065 Left Frontal Aslant Tract
#' @inherit HCP1065 description details source references
HCP1065_FAT_L <- function() {
  readRDS(system.file("extdata", "HCP1065_FAT_L.rds", package = "mascot"))
}

#' HCP1065 Right Frontal Aslant Tract
#' @inherit HCP1065 description details source references
HCP1065_FAT_R <- function() {
  readRDS(system.file("extdata", "HCP1065_FAT_R.rds", package = "mascot"))
}

#' HCP1065 Left Inferior Cerebellar Peduncle
#' @inherit HCP1065 description details source references
HCP1065_ICP_L <- function() {
  readRDS(system.file("extdata", "HCP1065_ICP_L.rds", package = "mascot"))
}

#' HCP1065 Right Inferior Cerebellar Peduncle
#' @inherit HCP1065 description details source references
HCP1065_ICP_R <- function() {
  readRDS(system.file("extdata", "HCP1065_ICP_R.rds", package = "mascot"))
}

#' HCP1065 Left Inferior Fronto-Occipital Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_IFOF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_IFOF_L.rds", package = "mascot"))
}

#' HCP1065 Right Inferior Fronto-Occipital Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_IFOF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_IFOF_R.rds", package = "mascot"))
}

#' HCP1065 Left Inferior Longitudinal Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_ILF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_ILF_L.rds", package = "mascot"))
}

#' HCP1065 Right Inferior Longitudinal Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_ILF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_ILF_R.rds", package = "mascot"))
}

#' HCP1065 Middle Cerebellar Peduncle
#' @inherit HCP1065 description details source references
HCP1065_MCP <- function() {
  readRDS(system.file("extdata", "HCP1065_MCP.rds", package = "mascot"))
}

#' HCP1065 Left Middle Longitudinal Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_MdLF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_MdLF_L.rds", package = "mascot"))
}

#' HCP1065 Right Middle Longitudinal Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_MdLF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_MdLF_R.rds", package = "mascot"))
}

#' HCP1065 Left Medial Lemniscus
#' @inherit HCP1065 description details source references
HCP1065_ML_L <- function() {
  readRDS(system.file("extdata", "HCP1065_ML_L.rds", package = "mascot"))
}

#' HCP1065 Right Medial Lemniscus
#' @inherit HCP1065 description details source references
HCP1065_ML_R <- function() {
  readRDS(system.file("extdata", "HCP1065_ML_R.rds", package = "mascot"))
}

#' HCP1065 Left Optic Radiation
#' @inherit HCP1065 description details source references
HCP1065_OR_L <- function() {
  readRDS(system.file("extdata", "HCP1065_OR_L.rds", package = "mascot"))
}

#' HCP1065 Right Optic Radiation
#' @inherit HCP1065 description details source references
HCP1065_OR_R <- function() {
  readRDS(system.file("extdata", "HCP1065_OR_R.rds", package = "mascot"))
}

#' HCP1065 Left Parietal Aslant Tract
#' @inherit HCP1065 description details source references
HCP1065_PAT_L <- function() {
  readRDS(system.file("extdata", "HCP1065_PAT_L.rds", package = "mascot"))
}

#' HCP1065 Right Parietal Aslant Tract
#' @inherit HCP1065 description details source references
HCP1065_PAT_R <- function() {
  readRDS(system.file("extdata", "HCP1065_PAT_R.rds", package = "mascot"))
}

#' HCP1065 Left Reticulospinal Tract
#' @inherit HCP1065 description details source references
HCP1065_RST_L <- function() {
  readRDS(system.file("extdata", "HCP1065_RST_L.rds", package = "mascot"))
}

#' HCP1065 Right Reticulospinal Tract
#' @inherit HCP1065 description details source references
HCP1065_RST_R <- function() {
  readRDS(system.file("extdata", "HCP1065_RST_R.rds", package = "mascot"))
}

#' HCP1065 Superior Cerebellar Peduncle
#' @inherit HCP1065 description details source references
HCP1065_SCP <- function() {
  readRDS(system.file("extdata", "HCP1065_SCP.rds", package = "mascot"))
}

#' HCP1065 Left Superior Longitudinal Fasciculus I
#' @inherit HCP1065 description details source references
HCP1065_SLF1_L <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF1_L.rds", package = "mascot"))
}

#' HCP1065 Right Superior Longitudinal Fasciculus I
#' @inherit HCP1065 description details source references
HCP1065_SLF1_R <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF1_R.rds", package = "mascot"))
}

#' HCP1065 Left Superior Longitudinal Fasciculus II
#' @inherit HCP1065 description details source references
HCP1065_SLF2_L <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF2_L.rds", package = "mascot"))
}

#' HCP1065 Right Superior Longitudinal Fasciculus II
#' @inherit HCP1065 description details source references
HCP1065_SLF2_R <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF2_R.rds", package = "mascot"))
}

#' HCP1065 Left Superior Longitudinal Fasciculus III
#' @inherit HCP1065 description details source references
HCP1065_SLF3_L <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF3_L.rds", package = "mascot"))
}

#' HCP1065 Right Superior Longitudinal Fasciculus III
#' @inherit HCP1065 description details source references
HCP1065_SLF3_R <- function() {
  readRDS(system.file("extdata", "HCP1065_SLF3_R.rds", package = "mascot"))
}

#' HCP1065 Left Anterior Thalamic Radiation
#' @inherit HCP1065 description details source references
HCP1065_TR_A_L <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_A_L.rds", package = "mascot"))
}

#' HCP1065 Right Anterior Thalamic Radiation
#' @inherit HCP1065 description details source references
HCP1065_TR_A_R <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_A_R.rds", package = "mascot"))
}

#' HCP1065 Left Posterior Thalamic Radiation
#' @inherit HCP1065 description details source references
HCP1065_TR_P_L <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_P_L.rds", package = "mascot"))
}

#' HCP1065 Right Posterior Thalamic Radiation
#' @inherit HCP1065 description details source references
HCP1065_TR_P_R <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_P_R.rds", package = "mascot"))
}

#' HCP1065 Left Superior Thalamic Radiation
#' @inherit HCP1065 description details source references
HCP1065_TR_S_L <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_S_L.rds", package = "mascot"))
}

#' HCP1065 Right Superior Thalamic Radiation
#' @inherit HCP1065 description details source references
HCP1065_TR_S_R <- function() {
  readRDS(system.file("extdata", "HCP1065_TR_S_R.rds", package = "mascot"))
}

#' HCP1065 Left Uncinate Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_UF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_UF_L.rds", package = "mascot"))
}

#' HCP1065 Right Uncinate Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_UF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_UF_R.rds", package = "mascot"))
}

#' HCP1065 Vermis
#' @inherit HCP1065 description details source references
HCP1065_V <- function() {
  readRDS(system.file("extdata", "HCP1065_V.rds", package = "mascot"))
}

#' HCP1065 Left Vertical Occipital Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_VOF_L <- function() {
  readRDS(system.file("extdata", "HCP1065_VOF_L.rds", package = "mascot"))
}

#' HCP1065 Right Vertical Occipital Fasciculus
#' @inherit HCP1065 description details source references
HCP1065_VOF_R <- function() {
  readRDS(system.file("extdata", "HCP1065_VOF_R.rds", package = "mascot"))
}
