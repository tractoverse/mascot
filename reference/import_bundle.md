# Import a bundle hosted in GitHub releases

This function allows you to import a bundle from one of the available
datasets by specifying the dataset and the bundle name. Available
datasets can be queried using
[`available_datasets()`](https://tractoverse.github.io/mascot/reference/available_datasets.md).
Available bundles for a given dataset can be queried using
[`available_bundles()`](https://tractoverse.github.io/mascot/reference/available_bundles.md),
which will return the list of bundles in the specified dataset. The
function will return an object of class `bundle` containing the
streamlines for the specified bundle. The `bundle` S7 class is defined
in the fiber package.

## Usage

``` r
import_bundle(dataset, bundle)
```

## Arguments

- dataset:

  A string specifying the dataset to import the bundle from. Currently
  only `"HCP1065"` is supported.

- bundle:

  A string specifying the bundle to import. Must be one of the names of
  the bundles in the specified dataset. See
  [`available_bundles()`](https://tractoverse.github.io/mascot/reference/available_bundles.md)
  for the list of available bundles in the specified dataset.

## Value

An object of class
[fiber::bundle](https://tractoverse.github.io/fiber/reference/bundle.html)
containing the streamlines for the specified bundle.

## HCP1065

A population-averaged tractography atlas based on 1,065 HCP subjects.
See [HCP1065](https://tractoverse.github.io/mascot/reference/HCP1065.md)
for full details, source, and references.

## Examples

``` r
bdl <- import_bundle("HCP1065", "Left Cranial Nerve VII")
```
