# HCP-YA105 Tractography Atlas

This dataset contains segmentations of 72 white matter tracts obtained
from 105 subjects included in the Human Connectome Project (HCP) young
adult dataset (https://www.humanconnectome.org/study/hcp-young-adult).
The folder names correspond to the ID of the HCP subjects. This dataset
only contains the tracts. It does not contain the original DWI data.
This has to be downloaded from the HCP website (it is free, but you have
to register to get access).

## Source

<https://zenodo.org/record/1477956#.Yo4XMy8RrrB>

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

Wasserthal, J., Neher, P., & Maier-Hein, K. H. (2018). TractSeg-Fast and
accurate white matter tract segmentation. NeuroImage, 183, 239-253.
