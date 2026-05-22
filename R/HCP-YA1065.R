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
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_AC"

#' HCP-YA1065 Left Arcuate Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_AF_L"

#' HCP-YA1065 Right Arcuate Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_AF_R"

#' HCP-YA1065 Left Acoustic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_AR_L"

#' HCP-YA1065 Right Acoustic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_AR_R"

#' HCP-YA1065 Left Frontal Parietal Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_FP_L"

#' HCP-YA1065 Right Frontal Parietal Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_FP_R"

#' HCP-YA1065 Left Frontal Parahippocampal Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_FPH_L"

#' HCP-YA1065 Right Frontal Parahippocampal Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_FPH_R"

#' HCP-YA1065 Left Parahippocampal Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_PH_L"

#' HCP-YA1065 Right Parahippocampal Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_PH_R"

#' HCP-YA1065 Left Parahippocampal Parietal Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_PHP_L"

#' HCP-YA1065 Right Parahippocampal Parietal Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_PHP_R"

#' HCP-YA1065 Left Parolfactory Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_PO_L"

#' HCP-YA1065 Right Parolfactory Cingulum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_C_PO_R"

#' HCP-YA1065 Left Cerebellum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CB_L"

#' HCP-YA1065 Right Cerebellum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CB_R"

#' HCP-YA1065 Left Corticobulbar Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CBT_L"

#' HCP-YA1065 Right Corticobulbar Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CBT_R"

#' HCP-YA1065 Corpus Callosum
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CC"

#' HCP-YA1065 Left Cranial Nerve II
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNII_L"

#' HCP-YA1065 Right Cranial Nerve II
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNII_R"

#' HCP-YA1065 Left Cranial Nerve III
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNIII_L"

#' HCP-YA1065 Right Cranial Nerve III
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNIII_R"

#' HCP-YA1065 Left Cranial Nerve V
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNV_L"

#' HCP-YA1065 Right Cranial Nerve V
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNV_R"

#' HCP-YA1065 Left Cranial Nerve VII
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNVII_L"

#' HCP-YA1065 Right Cranial Nerve VII
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNVII_R"

#' HCP-YA1065 Left Cranial Nerve VIII
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNVIII_L"

#' HCP-YA1065 Right Cranial Nerve VIII
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CNVIII_R"

#' HCP-YA1065 Left Frontal Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CPT_F_L"

#' HCP-YA1065 Right Frontal Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CPT_F_R"

#' HCP-YA1065 Left Occipital Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CPT_O_L"

#' HCP-YA1065 Right Occipital Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CPT_O_R"

#' HCP-YA1065 Left Parietal Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CPT_P_L"

#' HCP-YA1065 Right Parietal Corticopontine Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CPT_P_R"

#' HCP-YA1065 Left Anterior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CS_A_L"

#' HCP-YA1065 Right Anterior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CS_A_R"

#' HCP-YA1065 Left Posterior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CS_P_L"

#' HCP-YA1065 Right Posterior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CS_P_R"

#' HCP-YA1065 Left Superior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CS_S_L"

#' HCP-YA1065 Right Superior Corticostriatal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CS_S_R"

#' HCP-YA1065 Left Corticospinal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CST_L"

#' HCP-YA1065 Right Corticospinal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_CST_R"

#' HCP-YA1065 Left Dentatorubrothalamic Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_DRTT_L"

#' HCP-YA1065 Right Dentatorubrothalamic Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_DRTT_R"

#' HCP-YA1065 Left Extreme Capsule
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_EMC_L"

#' HCP-YA1065 Right Extreme Capsule
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_EMC_R"

#' HCP-YA1065 Left Fornix
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_F_L"

#' HCP-YA1065 Right Fornix
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_F_R"

#' HCP-YA1065 Left Frontal Aslant Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_FAT_L"

#' HCP-YA1065 Right Frontal Aslant Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_FAT_R"

#' HCP-YA1065 Left Inferior Cerebellar Peduncle
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_ICP_L"

#' HCP-YA1065 Right Inferior Cerebellar Peduncle
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_ICP_R"

#' HCP-YA1065 Left Inferior Fronto-Occipital Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_IFOF_L"

#' HCP-YA1065 Right Inferior Fronto-Occipital Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_IFOF_R"

#' HCP-YA1065 Left Inferior Longitudinal Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_ILF_L"

#' HCP-YA1065 Right Inferior Longitudinal Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_ILF_R"

#' HCP-YA1065 Middle Cerebellar Peduncle
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_MCP"

#' HCP-YA1065 Left Middle Longitudinal Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_MdLF_L"

#' HCP-YA1065 Right Middle Longitudinal Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_MdLF_R"

#' HCP-YA1065 Left Medial Lemniscus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_ML_L"

#' HCP-YA1065 Right Medial Lemniscus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_ML_R"

#' HCP-YA1065 Left Optic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_OR_L"

#' HCP-YA1065 Right Optic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_OR_R"

#' HCP-YA1065 Left Parietal Aslant Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_PAT_L"

#' HCP-YA1065 Right Parietal Aslant Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_PAT_R"

#' HCP-YA1065 Left Reticulospinal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_RST_L"

#' HCP-YA1065 Right Reticulospinal Tract
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_RST_R"

#' HCP-YA1065 Superior Cerebellar Peduncle
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_SCP"

#' HCP-YA1065 Left Superior Longitudinal Fasciculus I
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_SLF1_L"

#' HCP-YA1065 Right Superior Longitudinal Fasciculus I
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_SLF1_R"

#' HCP-YA1065 Left Superior Longitudinal Fasciculus II
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_SLF2_L"

#' HCP-YA1065 Right Superior Longitudinal Fasciculus II
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_SLF2_R"

#' HCP-YA1065 Left Superior Longitudinal Fasciculus III
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_SLF3_L"

#' HCP-YA1065 Right Superior Longitudinal Fasciculus III
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_SLF3_R"

#' HCP-YA1065 Left Anterior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_TR_A_L"

#' HCP-YA1065 Right Anterior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_TR_A_R"

#' HCP-YA1065 Left Posterior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_TR_P_L"

#' HCP-YA1065 Right Posterior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_TR_P_R"

#' HCP-YA1065 Left Superior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_TR_S_L"

#' HCP-YA1065 Right Superior Thalamic Radiation
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_TR_S_R"

#' HCP-YA1065 Left Uncinate Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_UF_L"

#' HCP-YA1065 Right Uncinate Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_UF_R"

#' HCP-YA1065 Vermis
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_V"

#' HCP-YA1065 Left Vertical Occipital Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_VOF_L"

#' HCP-YA1065 Right Vertical Occipital Fasciculus
#' @inherit HCP-YA1065 description details source references
"HCP_YA1065_VOF_R"
