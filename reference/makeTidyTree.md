# Make a tidy tree

Given a distance matrix, computes a cladogram with the
[`stats::hclust`](https://rdrr.io/r/stats/hclust.html) function, and
returns it as a
[`tibble::tibble`](https://tibble.tidyverse.org/reference/tibble.html)
formatted for the `tidytree` package.

## Usage

``` r
makeTidyTree(distMat, n_bootstrap = 0)
```

## Arguments

- distMat:

  a distance matrix

- n_bootstrap:

  Integer number of bootstrap replicates (default 0, no bootstrap).

## Value

A `tbl_tree` object. Bootstrap values will be `NA` if no boostrap is
done.

## Examples

``` r
makeTidyTree((Halo_PercentDiff/2 + t(Halo_PercentDiff)/2))
#> # A tbl_tree abstraction: 11 × 7
#> # which can be converted to treedata or phylo 
#> # via as.treedata or as.phylo
#>    parent  node branch.length label                   isTip     y bootstrap
#>     <int> <int>         <dbl> <chr>                   <lgl> <dbl>     <dbl>
#>  1     11     1         10.6  Halobacterium_litoreum  TRUE   5           NA
#>  2     11     2         10.6  Halobacterium_noricense TRUE   6           NA
#>  3     10     3         12.3  Halobacterium_salinarum TRUE   4           NA
#>  4      8     4          9.85 Haloferax_mediterranei  TRUE   1           NA
#>  5      8     5          9.85 Haloferax_volcanii      TRUE   2           NA
#>  6      9     6         13.9  Salarchaeum_japonicum   TRUE   3           NA
#>  7      7     7         NA    NA                      FALSE  2.69        NA
#>  8      7     8          5.79 NA                      FALSE  1.5         NA
#>  9      7     9          1.75 NA                      FALSE  3.88        NA
#> 10      9    10          1.57 NA                      FALSE  4.75        NA
#> 11     10    11          1.70 NA                      FALSE  5.5         NA
```
