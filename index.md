# mascot

The goal of [**mascot**](https://tractoverse.github.io/mascot/) is to
provide easy access to recent macroscale structural connectomes of the
Human brain obtained from diffusion MRI data through diffusion modeling
and subsequent so-called tractography.

## Installation

You can install the development version of mascot from
[GitHub](https://github.com/) with:

``` r

# install.packages("remotes")
remotes::install_github("astamm/mascot")
```

## Datasets

Currently, the package contains:

- the HCP1065 tractography atlases from Yeh FC, Panesar S, Fernandes D,
  Meola A, Yoshino M, Fernandez-Miranda JC, Vettel JM, Verstynen T.
  Population-averaged atlas of the macroscale human structural
  connectome and its network topology. Neuroimage. 2018 Sep 1;178:57-68
  (2021 update).

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
