# Add needed columns to be convenient

The `ConvenientTblTree` S7 class is only a draft and lacks validation
functions that ensure that an object provides everything expected from
such a tree, in particular the `isTip` and `y` columns that can become
invalid upon subsetting.

## Usage

``` r
makeItConvenient(tree)
```

## Arguments

- tree:

  A
  [`ConvenientTblTree`](https://brennern.github.io/ScrambledTreeBuilder/reference/ConvenientTblTree.md)
  object.

## Value

A
[`ConvenientTblTree`](https://brennern.github.io/ScrambledTreeBuilder/reference/ConvenientTblTree.md)
object with valid `isTip` and `y` information.

## Details

This private function (re)computes `isTip` and `y`.

## Examples

``` r
ScrambledTreeBuilder:::makeItConvenient(Halo_Tree)
#> # A tbl_tree abstraction: 11 × 9
#> # which can be converted to treedata or phylo 
#> # via as.treedata or as.phylo
#>    parent  node branch.length label               isTip     y Percent_difference
#>     <int> <int>         <dbl> <chr>               <lgl> <dbl>              <dbl>
#>  1     11     1         10.6  Halobacterium_lito… TRUE   5                  NA  
#>  2     11     2         10.6  Halobacterium_nori… TRUE   6                  NA  
#>  3     10     3         12.3  Halobacterium_sali… TRUE   4                  NA  
#>  4      8     4          9.85 Haloferax_mediterr… TRUE   1                  NA  
#>  5      8     5          9.85 Haloferax_volcanii  TRUE   2                  NA  
#>  6      9     6         13.9  Salarchaeum_japoni… TRUE   3                  NA  
#>  7      7     7         NA    NA                  FALSE  2.69               31.4
#>  8      7     8          5.79 NA                  FALSE  1.5                19.8
#>  9      7     9          1.75 NA                  FALSE  3.88               27.8
#> 10      9    10          1.57 NA                  FALSE  4.75               24.6
#> 11     10    11          1.70 NA                  FALSE  5.5                21.2
#> # ℹ 2 more variables: Scrambling_index <dbl>, bootstrap <dbl>
```
