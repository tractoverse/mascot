# TractSeg High-Quality White Matter Reference Tracts

This dataset contains segmentations of 72 white matter tracts obtained
from 105 subjects included in the Human Connectome Project (HCP) Young
Adult dataset (<https://www.humanconnectome.org/study/hcp-young-adult>).
The folder names in the source archive correspond to the HCP subject
IDs. This dataset contains only tracts; the original DWI data must be
downloaded separately from the HCP website (free registration required).

## Source

<https://zenodo.org/records/1477956>

## Details

The included bundles are stored as objects of class
[fiber::bundle](https://tractoverse.github.io/fiber/reference/bundle.html).
A
[fiber::bundle](https://tractoverse.github.io/fiber/reference/bundle.html)
object is an S7 class which has two slots: `@streamlines` and
`@bundle_data`, where:

- `@streamlines` is a list of
  [fiber::streamline](https://tractoverse.github.io/fiber/reference/streamline.html)
  objects, which, in turn, are S7 classes with slots `@points`,
  `@point_data` and `@streamline_data`.

- `@bundle_data` is a list of metadata about the bundle, such as its
  name, where it was extracted from, etc.

More details about the format of the data can be found in the
documentation of the [fiber](https://tractoverse.github.io/fiber/)
package.

## TractSeg

Per-subject white matter bundle segmentations generated with TractSeg
from 105 HCP subjects. Each bundle is hosted in a dedicated GitHub
release (`tractseg-<bundle_name>`). Assets are named
`TractSeg_<subject_id>_<bundle_name>.rds`.

## References

Wasserthal, J., Neher, P., & Maier-Hein, K. H. (2018). TractSeg – Fast
and accurate white matter tract segmentation. *NeuroImage*, 183,
239–253.
[doi:10.1016/j.neuroimage.2018.07.070](https://doi.org/10.1016/j.neuroimage.2018.07.070)
