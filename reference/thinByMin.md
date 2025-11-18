# Thin a matrix by a minimum pairwise distance

Greedily select labels so that all pairwise distances among the kept
labels are \>= `min_dist`

## Usage

``` r
thinByMin(D, min_dist)
```

## Arguments

- D:

  A square distance matrix (numeric) with identical row/column names.

- min_dist:

  minimum allowed pairwise distance.

## Value

A symmetric numeric matrix: the **thinned distance matrix** restricted
to the kept labels (rows/columns in the order they were added).

## Author

Anika Mittal

## Examples

``` r
thinByMin(Halo_PercentDiff, min_dist = 20)
#>                         Haloferax_mediterranei Halobacterium_salinarum
#> Haloferax_mediterranei                 0.00000                33.00779
#> Halobacterium_salinarum               33.00779                 0.00000
#> Salarchaeum_japonicum                 31.46069                28.31665
#> Halobacterium_noricense               32.55913                25.05309
#> Halobacterium_litoreum                31.50259                24.20247
#>                         Salarchaeum_japonicum Halobacterium_noricense
#> Haloferax_mediterranei               31.46069                32.55913
#> Halobacterium_salinarum              28.31665                25.05309
#> Salarchaeum_japonicum                 0.00000                27.73366
#> Halobacterium_noricense              27.73366                 0.00000
#> Halobacterium_litoreum               27.24849                21.22432
#>                         Halobacterium_litoreum
#> Haloferax_mediterranei                31.50259
#> Halobacterium_salinarum               24.20247
#> Salarchaeum_japonicum                 27.24849
#> Halobacterium_noricense               21.22432
#> Halobacterium_litoreum                 0.00000
```
