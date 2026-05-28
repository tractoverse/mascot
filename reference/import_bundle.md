# Import a bundle hosted in GitHub releases

This function allows you to import a bundle from one of the available
datasets by specifying the dataset and the bundle name. Available
datasets can be queried using
[`available_datasets()`](https://tractoverse.github.io/mascot/reference/available_datasets.md).
Available bundles for a given dataset can be queried using
[`available_bundles()`](https://tractoverse.github.io/mascot/reference/available_bundles.md),
which will return the list of bundles in the specified dataset. For
multi-subject datasets (e.g. `"TractSeg"`), the `subjects` argument
controls which subjects are loaded. For single-atlas datasets (e.g.
`"HCP1065"`), `subjects` is ignored.

## Usage

``` r
import_bundle(dataset, bundle, subjects = NULL)
```

## Arguments

- dataset:

  A string specifying the dataset to import the bundle from. Currently
  `"HCP1065"` and `"TractSeg"` are supported.

- bundle:

  A string specifying the bundle to import. Must be one of the names
  returned by
  [`available_bundles()`](https://tractoverse.github.io/mascot/reference/available_bundles.md)
  for the chosen dataset.

- subjects:

  Controls which subjects are loaded for multi-subject datasets (ignored
  for `"HCP1065"`). Three forms are accepted:

  `NULL` (default)

  :   All available subjects are loaded and returned as a named list
      whose names are the subject IDs.

  An integer scalar `n`

  :   `n` subjects are drawn at random (without replacement) and
      returned as a named list.

  A character string

  :   The bundle for that single subject ID is returned directly as a
      [fiber::bundle](https://tractoverse.github.io/fiber/reference/bundle.html)
      object (not wrapped in a list).

## Value

For `"HCP1065"`, or for `"TractSeg"` with a character `subjects` value:
an object of class
[fiber::bundle](https://tractoverse.github.io/fiber/reference/bundle.html).
For `"TractSeg"` with `subjects = NULL` or an integer: a named list of
[fiber::bundle](https://tractoverse.github.io/fiber/reference/bundle.html)
objects, one per subject.

## HCP1065

A population-averaged tractography atlas based on 1,065 HCP subjects.
See [HCP1065](https://tractoverse.github.io/mascot/reference/HCP1065.md)
for full details, source, and references.

## Examples

``` r
bdl <- import_bundle("HCP1065", "Left Cranial Nerve VII")

if (FALSE) { # \dontrun{
# Single subject
bdl <- import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = "599469")

# Random sample of 10 subjects
bdls <- import_bundle("TractSeg", "Left Arcuate Fasciculus", subjects = 10L)
} # }
```
