# Most recent common ancestors

Summarise statistics for MRCAs

## Usage

``` r
MRCAs(
  results,
  clades = NULL,
  dim1 = "percent_difference_local",
  dim2 = "index_avg_strandDiscord",
  center = mean,
  dispersion = sd
)
```

## Arguments

- results:

  A results data frame produed by
  [`formatStats()`](https://brennern.github.io/ScrambledTreeBuilder/reference/formatStats.md),
  with MRCAs annotated with
  [`recordAncestor()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordAncestor.md).

- clades:

  A
  [`FocalCladeList`](https://brennern.github.io/ScrambledTreeBuilder/reference/FocalCladeList.md)
  object.

- dim1, dim2:

  the name of the pairwise statistics to summarise.

- center, dispersion:

  Functions to compute a representation of the central tendency and the
  dispersion of the values for each MRCA.

## Value

A tibble
([tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html))
ready for
[`MRCA_2D_plot`](https://brennern.github.io/ScrambledTreeBuilder/reference/MRCA_2D_plot.md).

## Author

Charles Plessy

## Examples

``` r
MRCAs(Halo_DF, Halo_FocalClades)
#> # A tibble: 5 × 8
#>    MRCA     x     y   xerr     yerr     n clade         color 
#>   <dbl> <dbl> <dbl>  <dbl>    <dbl> <int> <chr>         <chr> 
#> 1     7  28.9 0.927 1.36   0.0335      16 Other         NA    
#> 2     8  17.0 0.682 0.0876 0.000411     2 Haloferax     green3
#> 3     9  25.1 0.868 0.947  0.0474       6 Other         NA    
#> 4    10  22.3 0.617 0.273  0.173        4 Halobacterium blue  
#> 5    11  18.7 0.606 0.0104 0.00136      2 Halobacterium blue  
```
