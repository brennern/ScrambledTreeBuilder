# Order a comparison matrix

Re-order a comparison matrix according to the leaves of a plotted tree,
to ease figure production

## Usage

``` r
orderWithTree(m, tree)
```

## Arguments

- m:

  A matrix produced with
  [`makeMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/makeMatrix.md).

- tree:

  A
  [`ConvenientTblTree`](https://brennern.github.io/ScrambledTreeBuilder/reference/ConvenientTblTree.md)
  object.

## Value

The `m` matrix, sorted like the leaves of `tree`.

## Author

Charles Plessy

## Examples

``` r
orderWithTree(Halo_PercentDiff, Halo_Tree)
#>                         Halobacterium_noricense Halobacterium_litoreum
#> Halobacterium_noricense                 0.00000               21.26064
#> Halobacterium_litoreum                 21.18801                0.00000
#> Halobacterium_salinarum                25.05241               24.15702
#> Salarchaeum_japonicum                  27.88932               27.24648
#> Haloferax_volcanii                     30.06817               29.88642
#> Haloferax_mediterranei                 33.57159               31.72595
#>                         Halobacterium_salinarum Salarchaeum_japonicum
#> Halobacterium_noricense                25.05377              27.57799
#> Halobacterium_litoreum                 24.24792              27.25050
#> Halobacterium_salinarum                 0.00000              28.44185
#> Salarchaeum_japonicum                  28.19145               0.00000
#> Haloferax_volcanii                     31.51689              30.20358
#> Haloferax_mediterranei                 33.02111              31.58067
#>                         Haloferax_volcanii Haloferax_mediterranei
#> Halobacterium_noricense           30.03853               31.54667
#> Halobacterium_litoreum            29.83707               31.27923
#> Halobacterium_salinarum           31.51122               32.99448
#> Salarchaeum_japonicum             30.17554               31.34071
#> Haloferax_volcanii                 0.00000               19.60559
#> Haloferax_mediterranei            19.77441                0.00000
```
