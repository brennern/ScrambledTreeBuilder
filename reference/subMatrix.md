# Subset a matrix with a subtree

Given a matrix of values where the rows and column names are species
names that are labels in a tree, subset that matrix to the species that
are present in the subtree starting at a given node.

## Usage

``` r
subMatrix(tree, m, clade = NULL, simplify.names = FALSE)
```

## Arguments

- tree:

  A
  [`ConvenientTblTree`](https://brennern.github.io/ScrambledTreeBuilder/reference/ConvenientTblTree.md)
  object.

- m:

  A matrix, typically the output of
  [`makeMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/makeMatrix.md).

- clade:

  A
  [`FocalClade`](https://brennern.github.io/ScrambledTreeBuilder/reference/focalClade.md)
  object or the ID number of the node to base the subtree. The default
  is `NULL` in case the input tree is already a subtree (see examples).

- simplify.names:

  Reduce the genus name to a single letter.

## Value

A subset of the `m` matrix.

## See also

Other Functions for trees:
[`childSpecies()`](https://brennern.github.io/ScrambledTreeBuilder/reference/childSpecies.md),
[`extractValues()`](https://brennern.github.io/ScrambledTreeBuilder/reference/extractValues.md),
[`recordAncestor()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordAncestor.md)

Other Focal clade functions:
[`eog()`](https://brennern.github.io/ScrambledTreeBuilder/reference/eog.md),
[`focalClade()`](https://brennern.github.io/ScrambledTreeBuilder/reference/focalClade.md),
[`recordAncestor()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordAncestor.md),
[`recordClades()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordClades.md),
[`subTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subTree.md),
[`visualizeTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/visualizeTree.md)

## Author

Charles Plessy

## Examples

``` r
# Subset with a node
subMatrix(Halo_Tree, Halo_PercentDiff, 9)
#>                         Halobacterium_litoreum Halobacterium_noricense
#> Halobacterium_litoreum                 0.00000                21.18801
#> Halobacterium_noricense               21.26064                 0.00000
#> Halobacterium_salinarum               24.15702                25.05241
#> Salarchaeum_japonicum                 27.24648                27.88932
#>                         Halobacterium_salinarum Salarchaeum_japonicum
#> Halobacterium_litoreum                 24.24792              27.25050
#> Halobacterium_noricense                25.05377              27.57799
#> Halobacterium_salinarum                 0.00000              28.44185
#> Salarchaeum_japonicum                  28.19145               0.00000

# Subset with a focal clade
subMatrix(Halo_Tree, Halo_PercentDiff, Halo_FocalClades$Halobacterium)
#>                         Halobacterium_litoreum Halobacterium_noricense
#> Halobacterium_litoreum                 0.00000                21.18801
#> Halobacterium_noricense               21.26064                 0.00000
#> Halobacterium_salinarum               24.15702                25.05241
#>                         Halobacterium_salinarum
#> Halobacterium_litoreum                 24.24792
#> Halobacterium_noricense                25.05377
#> Halobacterium_salinarum                 0.00000

# Simplify names for more compact display
subMatrix(Halo_Tree, Halo_PercentDiff, simplify.names = TRUE)
#>                H_litoreum H_noricense H_salinarum H_mediterranei H_volcanii
#> H_litoreum        0.00000    21.18801    24.24792       31.27923   29.83707
#> H_noricense      21.26064     0.00000    25.05377       31.54667   30.03853
#> H_salinarum      24.15702    25.05241     0.00000       32.99448   31.51122
#> H_mediterranei   31.72595    33.57159    33.02111        0.00000   19.77441
#> H_volcanii       29.88642    30.06817    31.51689       19.60559    0.00000
#> S_japonicum      27.24648    27.88932    28.19145       31.34071   30.17554
#>                S_japonicum
#> H_litoreum        27.25050
#> H_noricense       27.57799
#> H_salinarum       28.44185
#> H_mediterranei    31.58067
#> H_volcanii        30.20358
#> S_japonicum        0.00000

# Pipe a subsetted tree directly to the function
subTree(Halo_Tree, 9) |> subMatrix(Halo_PercentDiff)
#>                         Halobacterium_litoreum Halobacterium_noricense
#> Halobacterium_litoreum                 0.00000                21.18801
#> Halobacterium_noricense               21.26064                 0.00000
#> Halobacterium_salinarum               24.15702                25.05241
#> Salarchaeum_japonicum                 27.24648                27.88932
#>                         Halobacterium_salinarum Salarchaeum_japonicum
#> Halobacterium_litoreum                 24.24792              27.25050
#> Halobacterium_noricense                25.05377              27.57799
#> Halobacterium_salinarum                 0.00000              28.44185
#> Salarchaeum_japonicum                  28.19145               0.00000
```
