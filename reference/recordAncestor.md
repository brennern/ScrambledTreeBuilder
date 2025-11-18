# Record ancestor node ID of a pair

Given a tree and a results data frame, add a new `MRCA` column that
records the node ID of the most recent common ancestor in that tree for
each row.

## Usage

``` r
recordAncestor(df, tree)
```

## Arguments

- df:

  A results data frame created with the
  [`extractValues()`](https://brennern.github.io/ScrambledTreeBuilder/reference/extractValues.md)
  function

- tree:

  A tree created with the
  [`makeTidyTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/makeTidyTree.md)
  function.

## Value

The `df` data frame with a new `MRCA` column.

## See also

Other Functions for trees:
[`childSpecies()`](https://brennern.github.io/ScrambledTreeBuilder/reference/childSpecies.md),
[`extractValues()`](https://brennern.github.io/ScrambledTreeBuilder/reference/extractValues.md),
[`subMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subMatrix.md)

Other Focal clade functions:
[`eog()`](https://brennern.github.io/ScrambledTreeBuilder/reference/eog.md),
[`focalClade()`](https://brennern.github.io/ScrambledTreeBuilder/reference/focalClade.md),
[`recordClades()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordClades.md),
[`subMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subMatrix.md),
[`subTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subTree.md),
[`visualizeTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/visualizeTree.md)

## Author

Noa Brenner

Charles Plessy

## Examples

``` r
recordAncestor(Halo_DF, Halo_Tree)$MRCA
#>  [1] 11 10  7  7  9 11 10  7  7  9 10 10  7  7  9  7  7  7  8  7  7  7  7  8  7
#> [26]  9  9  9  7  7
```
