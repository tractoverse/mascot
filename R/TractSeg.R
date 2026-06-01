#' TractSeg High-Quality White Matter Reference Tracts
#'
#' @description
#' This dataset contains segmentations of 72 white matter tracts obtained from
#' 105 subjects included in the Human Connectome Project (HCP) Young Adult
#' dataset (<https://www.humanconnectome.org/study/hcp-young-adult>). The
#' folder names in the source archive correspond to the HCP subject IDs. This
#' dataset contains only tracts; the original DWI data must be downloaded
#' separately from the HCP website (free registration required).
#'
#' @inherit HCP1065 details
#'
#' @section TractSeg:
#' Per-subject white matter bundle segmentations generated with TractSeg from
#' 105 HCP subjects. Each bundle is hosted in a dedicated GitHub release
#' (`tractseg-<bundle_name>`). Assets are named
#' `TractSeg_<subject_id>_<bundle_name>.rds`.
#'
#' @section License:
#' The TractSeg data are redistributed under the
#' **Creative Commons Attribution–NonCommercial 4.0 International (CC BY-NC 4.0)**
#' license, consistent with the original Zenodo dataset.
#' **Non-commercial use only.**
#' See <https://creativecommons.org/licenses/by-nc/4.0/>.
#'
#' @section Attribution and Citation:
#' Please cite the original TractSeg publication when using or redistributing
#' this data:
#'
#' Wasserthal, J., Neher, P., & Maier-Hein, K. H. (2018). TractSeg -- Fast and
#' accurate white matter tract segmentation. *NeuroImage*, 183, 239–253.
#' <https://doi.org/10.1016/j.neuroimage.2018.07.070>
#'
#' Raw data archived at Zenodo: <https://zenodo.org/records/1477956>
#' (DOI: 10.5281/zenodo.1477956).
#'
#' @section HCP Data Terms:
#' The source tractograms are derived from the **Human Connectome Project
#' Young Adult** dataset. Users must comply with the applicable
#' [HCP data-use terms](https://www.humanconnectome.org/study/hcp-young-adult/document/wu-minn-hcp-consortium-open-access-data-use-terms)
#' and acknowledgment requirements.
#'
#' @section Modifications:
#' The original `.trk` streamline files from the Zenodo archive have been
#' converted to R `fiber::bundle` objects and serialised as `.rds` files using
#' the `mascot` package pipeline. No spatial or statistical modifications were
#' made to the streamline data. Bundles are split one per GitHub release tag.
#'
#' @section Disclaimer:
#' This redistribution does not imply endorsement by the original authors,
#' DKFZ, Zenodo, HCP, or any affiliated institution. The original authors are
#' listed as contributors (`ctb`) in the package `DESCRIPTION` to acknowledge
#' their authorship of the source data; this does not imply their endorsement
#' of the `mascot` package.
#'
#' @source \url{https://zenodo.org/records/1477956}
#' @references Wasserthal, J., Neher, P., & Maier-Hein, K. H. (2018).
#'   TractSeg -- Fast and accurate white matter tract segmentation.
#'   \emph{NeuroImage}, 183, 239--253.
#'   \doi{10.1016/j.neuroimage.2018.07.070}
#' @name TractSeg
NULL

#' TractSeg Left Arcuate Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_AF_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = subjects)
}

#' TractSeg Right Arcuate Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_AF_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Arcuate Fasciculus", subjects = subjects)
}

#' TractSeg Left Anterior Thalamic Radiation
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ATR_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Anterior Thalamic Radiation", subjects = subjects)
}

#' TractSeg Right Anterior Thalamic Radiation
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ATR_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Anterior Thalamic Radiation", subjects = subjects)
}

#' TractSeg Commissure Anterior
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CA <- function(subjects = NULL) {
  import_bundle("TractSeg", "Commissure Anterior", subjects = subjects)
}

#' TractSeg Corpus Callosum
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CC <- function(subjects = NULL) {
  import_bundle("TractSeg", "Corpus Callosum", subjects = subjects)
}

#' TractSeg Corpus Callosum Rostrum
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CC_1 <- function(subjects = NULL) {
  import_bundle("TractSeg", "Corpus Callosum Rostrum", subjects = subjects)
}

#' TractSeg Corpus Callosum Genu
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CC_2 <- function(subjects = NULL) {
  import_bundle("TractSeg", "Corpus Callosum Genu", subjects = subjects)
}

#' TractSeg Corpus Callosum Rostral Body
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CC_3 <- function(subjects = NULL) {
  import_bundle("TractSeg", "Corpus Callosum Rostral Body", subjects = subjects)
}

#' TractSeg Corpus Callosum Anterior Midbody
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CC_4 <- function(subjects = NULL) {
  import_bundle("TractSeg", "Corpus Callosum Anterior Midbody", subjects = subjects)
}

#' TractSeg Corpus Callosum Posterior Midbody
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CC_5 <- function(subjects = NULL) {
  import_bundle("TractSeg", "Corpus Callosum Posterior Midbody", subjects = subjects)
}

#' TractSeg Corpus Callosum Isthmus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CC_6 <- function(subjects = NULL) {
  import_bundle("TractSeg", "Corpus Callosum Isthmus", subjects = subjects)
}

#' TractSeg Corpus Callosum Splenium
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CC_7 <- function(subjects = NULL) {
  import_bundle("TractSeg", "Corpus Callosum Splenium", subjects = subjects)
}

#' TractSeg Left Cingulum
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CG_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Cingulum", subjects = subjects)
}

#' TractSeg Right Cingulum
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CG_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Cingulum", subjects = subjects)
}

#' TractSeg Left Corticospinal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CST_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Corticospinal Tract", subjects = subjects)
}

#' TractSeg Right Corticospinal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_CST_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Corticospinal Tract", subjects = subjects)
}

#' TractSeg Left Fronto-Pontine Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_FPT_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Fronto-Pontine Tract", subjects = subjects)
}

#' TractSeg Right Fronto-Pontine Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_FPT_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Fronto-Pontine Tract", subjects = subjects)
}

#' TractSeg Left Fornix
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_FX_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Fornix", subjects = subjects)
}

#' TractSeg Right Fornix
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_FX_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Fornix", subjects = subjects)
}

#' TractSeg Left Inferior Cerebellar Peduncle
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ICP_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Inferior Cerebellar Peduncle", subjects = subjects)
}

#' TractSeg Right Inferior Cerebellar Peduncle
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ICP_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Inferior Cerebellar Peduncle", subjects = subjects)
}

#' TractSeg Left Inferior Fronto-Occipital Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_IFO_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Inferior Fronto-Occipital Fasciculus", subjects = subjects)
}

#' TractSeg Right Inferior Fronto-Occipital Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_IFO_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Inferior Fronto-Occipital Fasciculus", subjects = subjects)
}

#' TractSeg Left Inferior Longitudinal Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ILF_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Inferior Longitudinal Fasciculus", subjects = subjects)
}

#' TractSeg Right Inferior Longitudinal Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ILF_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Inferior Longitudinal Fasciculus", subjects = subjects)
}

#' TractSeg Middle Cerebellar Peduncle
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_MCP <- function(subjects = NULL) {
  import_bundle("TractSeg", "Middle Cerebellar Peduncle", subjects = subjects)
}

#' TractSeg Left Middle Longitudinal Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_MLF_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Middle Longitudinal Fasciculus", subjects = subjects)
}

#' TractSeg Right Middle Longitudinal Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_MLF_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Middle Longitudinal Fasciculus", subjects = subjects)
}

#' TractSeg Left Optic Radiation
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_OR_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Optic Radiation", subjects = subjects)
}

#' TractSeg Right Optic Radiation
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_OR_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Optic Radiation", subjects = subjects)
}

#' TractSeg Left Parieto-Occipital Pontine Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_POPT_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Parieto-Occipital Pontine Tract", subjects = subjects)
}

#' TractSeg Right Parieto-Occipital Pontine Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_POPT_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Parieto-Occipital Pontine Tract", subjects = subjects)
}

#' TractSeg Left Superior Cerebellar Peduncle
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_SCP_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Superior Cerebellar Peduncle", subjects = subjects)
}

#' TractSeg Right Superior Cerebellar Peduncle
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_SCP_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Superior Cerebellar Peduncle", subjects = subjects)
}

#' TractSeg Left Superior Longitudinal Fasciculus I
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_SLF_I_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Superior Longitudinal Fasciculus I", subjects = subjects)
}

#' TractSeg Right Superior Longitudinal Fasciculus I
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_SLF_I_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Superior Longitudinal Fasciculus I", subjects = subjects)
}

#' TractSeg Left Superior Longitudinal Fasciculus II
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_SLF_II_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Superior Longitudinal Fasciculus II", subjects = subjects)
}

#' TractSeg Right Superior Longitudinal Fasciculus II
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_SLF_II_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Superior Longitudinal Fasciculus II", subjects = subjects)
}

#' TractSeg Left Superior Longitudinal Fasciculus III
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_SLF_III_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Superior Longitudinal Fasciculus III", subjects = subjects)
}

#' TractSeg Right Superior Longitudinal Fasciculus III
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_SLF_III_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Superior Longitudinal Fasciculus III", subjects = subjects)
}

#' TractSeg Left Superior Thalamic Radiation
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_STR_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Superior Thalamic Radiation", subjects = subjects)
}

#' TractSeg Right Superior Thalamic Radiation
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_STR_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Superior Thalamic Radiation", subjects = subjects)
}

#' TractSeg Left Striato-Fronto-Orbital Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_FO_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Striato-Fronto-Orbital Tract", subjects = subjects)
}

#' TractSeg Right Striato-Fronto-Orbital Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_FO_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Striato-Fronto-Orbital Tract", subjects = subjects)
}

#' TractSeg Left Striato-Occipital Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_OCC_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Striato-Occipital Tract", subjects = subjects)
}

#' TractSeg Right Striato-Occipital Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_OCC_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Striato-Occipital Tract", subjects = subjects)
}

#' TractSeg Left Striato-Parietal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_PAR_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Striato-Parietal Tract", subjects = subjects)
}

#' TractSeg Right Striato-Parietal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_PAR_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Striato-Parietal Tract", subjects = subjects)
}

#' TractSeg Left Striato-Postcentral Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_POSTC_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Striato-Postcentral Tract", subjects = subjects)
}

#' TractSeg Right Striato-Postcentral Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_POSTC_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Striato-Postcentral Tract", subjects = subjects)
}

#' TractSeg Left Striato-Precentral Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_PREC_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Striato-Precentral Tract", subjects = subjects)
}

#' TractSeg Right Striato-Precentral Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_PREC_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Striato-Precentral Tract", subjects = subjects)
}

#' TractSeg Left Striato-Prefrontal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_PREF_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Striato-Prefrontal Tract", subjects = subjects)
}

#' TractSeg Right Striato-Prefrontal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_PREF_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Striato-Prefrontal Tract", subjects = subjects)
}

#' TractSeg Left Striato-Premotor Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_PREM_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Striato-Premotor Tract", subjects = subjects)
}

#' TractSeg Right Striato-Premotor Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_ST_PREM_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Striato-Premotor Tract", subjects = subjects)
}

#' TractSeg Left Thalamo-Occipital Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_OCC_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Thalamo-Occipital Tract", subjects = subjects)
}

#' TractSeg Right Thalamo-Occipital Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_OCC_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Thalamo-Occipital Tract", subjects = subjects)
}

#' TractSeg Left Thalamo-Parietal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_PAR_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Thalamo-Parietal Tract", subjects = subjects)
}

#' TractSeg Right Thalamo-Parietal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_PAR_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Thalamo-Parietal Tract", subjects = subjects)
}

#' TractSeg Left Thalamo-Postcentral Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_POSTC_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Thalamo-Postcentral Tract", subjects = subjects)
}

#' TractSeg Right Thalamo-Postcentral Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_POSTC_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Thalamo-Postcentral Tract", subjects = subjects)
}

#' TractSeg Left Thalamo-Precentral Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_PREC_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Thalamo-Precentral Tract", subjects = subjects)
}

#' TractSeg Right Thalamo-Precentral Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_PREC_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Thalamo-Precentral Tract", subjects = subjects)
}

#' TractSeg Left Thalamo-Prefrontal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_PREF_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Thalamo-Prefrontal Tract", subjects = subjects)
}

#' TractSeg Right Thalamo-Prefrontal Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_PREF_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Thalamo-Prefrontal Tract", subjects = subjects)
}

#' TractSeg Left Thalamo-Premotor Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_PREM_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Thalamo-Premotor Tract", subjects = subjects)
}

#' TractSeg Right Thalamo-Premotor Tract
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_T_PREM_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Thalamo-Premotor Tract", subjects = subjects)
}

#' TractSeg Left Uncinate Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_UF_left <- function(subjects = NULL) {
  import_bundle("TractSeg", "Left Uncinate Fasciculus", subjects = subjects)
}

#' TractSeg Right Uncinate Fasciculus
#' @inherit TractSeg description details source references
#' @inheritParams import_bundle
#' @export
TractSeg_UF_right <- function(subjects = NULL) {
  import_bundle("TractSeg", "Right Uncinate Fasciculus", subjects = subjects)
}
