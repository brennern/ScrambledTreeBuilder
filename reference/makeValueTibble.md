# Project a matrix onto a tree

Adds a new node column data in a tree, summarising a square matrix
representing all the pairs between that tree's leaves by applying a
function to all the matrix values that relate pairs through the same
node.

## Usage

``` r
makeValueTibble(your_tibble, your_matrix = NULL, fun = mean, colname = "value")
```

## Arguments

- your_tibble:

  A
  [`ConvenientTblTree`](https://brennern.github.io/ScrambledTreeBuilder/reference/ConvenientTblTree.md)
  object.

- your_matrix:

  Matrix containing values to summarise in the tibble.

- fun:

  function to apply to the values

- colname:

  New column name for value being added to tibble.

## Value

The `your_tibble` object in which a new `colname` column was added where
the `your_matrix` values summarised on the tree with the `fun` function,
or the original `your_tibble` object if the `your_matrix` argument was
NULL

## Author

Noa Brenner

Charles Plessy

## Examples

``` r
makeValueTibble(Halo_Tree, Halo_PercentDiff, colname = "Strand_Randomisation_Index")
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
#> # ℹ 2 more variables: Scrambling_index <dbl>, Strand_Randomisation_Index <dbl>
```
