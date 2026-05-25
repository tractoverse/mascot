# HCP1065 Left Cranial Nerve VII

The HCP1065 population-averaged tractography atlas is an updated atlas
from the HCP842 version. The new atlas relies on 1,065 subjects and is
based on [ICBM 2009a Nonlinear
Asymmetric](https://www.bic.mni.mcgill.ca/ServicesAtlases/ICBM152NLin2009)
space, whereas HCP842 relied on 842 subjects and was based on FSL’s FA
map (58 FA images averaged to old MNI152). The new atlas further
provides subcomponents for cingulum, superior longitudinal fasciculus,
corticopontine tract, corticostriatal tract, and corticothalamic tract
(renamed as thalamic radiation).

## Usage

``` r
HCP1065_CNVII_L()
```

## Source

<https://brain.labsolver.org/hcp_trk_atlas.html>

## Details

The included bundles are stored as objects of class `bundle` as defined
in the [fiber](https://tractoverse.github.io/fiber/) package. A `bundle`
object is an S7 class which has two slots: `@streamlines` and
`@bundle_data`, where:

- `@streamlines` is a list of `streamline` objects, which, in turn, are
  S7 classes with slots `@points`, `@point_data` and `@streamline_data`.

- `@bundle_data` is a list of metadata about the bundle, such as its
  name, where it was extracted from, etc.

More details about the format of the data can be found in the
documentation of the [fiber](https://tractoverse.github.io/fiber/)
package.

## References

- Yeh, Fang-Cheng, et al. "Population-averaged atlas of the macroscale
  human structural connectome and its network topology." Neuroimage 178
  (2018): 57-68. https://doi.org/10.1016/j.neuroimage.2018.05.027

- Yeh, Fang-Cheng. "Population-based tract-to-region connectome of the
  human brain and its hierarchical topology." Nature communications 13.1
  (2022): 4933. https://doi.org/10.1038/s41467-022-32595-4
