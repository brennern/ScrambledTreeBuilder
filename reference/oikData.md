# Oikopleura data

*Oikopleura* data points to overlay on nucleotide distance / scrambling
index plots.

## Usage

``` r
oikData
```

## Format

List of tibbles. The name of each tibble is just a time stamp.

## Details

This test dataset is derived from genome alignments produced by a beta
version of the <https://nf-co.re/pairgenomealign> pipeline.

- `2025_02_17` 6 distances using the `RY128` seed.

- `2025_02_25` 10 distances using the `RY4` seed.

- `2025_02_25` 10 distances (5 windows per sequence feature) using the
  `MAM8` seed and the `2.1~beta` pipeline.

## See also

Other Lazy-loaded data:
[`Haloarchaea`](https://brennern.github.io/ScrambledTreeBuilder/reference/Haloarchaea.md)

## Author

Charles Plessy

## Examples

``` r
oikData
#> $`2025_02_17`
#> # A tibble: 6 × 7
#>    MRCA     x     y    xerr      yerr     n clade     
#>   <dbl> <dbl> <dbl>   <dbl>     <dbl> <int> <chr>     
#> 1     8 21.2  0.909 0.252   0.0183       20 Oikopleura
#> 2     9  3.32 0.146 0.00424 0.000352      2 Oikopleura
#> 3    10 12.5  0.758 0.0572  0.0370        8 Oikopleura
#> 4    11  2.87 0.522 0.0628  0.148         6 Oikopleura
#> 5    12  2.63 0.727 0.0624  0.0804        4 Oikopleura
#> 6    13  2.32 0.344 0.00233 0.0000759     2 Oikopleura
#> 
#> $`2025_02_25`
#> # A tibble: 10 × 7
#>     MRCA     x     y    xerr     yerr     n clade     
#>    <dbl> <dbl> <dbl>   <dbl>    <dbl> <int> <chr>     
#>  1    12 21.8  0.926 0.197   0.0186      36 Oikopleura
#>  2    13  3.36 0.152 0.00304 0.000250     2 Oikopleura
#>  3    14 13.1  0.801 0.176   0.0412      36 Oikopleura
#>  4    15  2.61 0.335 0.0197  0.0563       4 Oikopleura
#>  5    16  2.89 0.490 0.105   0.119       10 Oikopleura
#>  6    17  2.63 0.731 0.0660  0.0531       8 Oikopleura
#>  7    18  2.43 0.375 0.0242  0.0320       6 Oikopleura
#>  8    19  1.17 0.367 0.00283 0.000416     2 Oikopleura
#>  9    20  2.32 0.369 0.0260  0.0278       4 Oikopleura
#> 10    21  2.10 0.316 0.00382 0.000751     2 Oikopleura
#> 
#> $`2025_07_17`
#> # A tibble: 10 × 8
#>     MRCA     x     y      xerr     yerr     n clade      color
#>    <dbl> <dbl> <dbl>     <dbl>    <dbl> <int> <chr>      <chr>
#>  1    20 22.7  0.870 0.292     0.0255      36 Oikopleura red  
#>  2    25  3.36 0.152 0.00191   0.000429     2 Oikopleura red  
#>  3    26 13.1  0.725 0.188     0.0241      36 Oikopleura red  
#>  4    27  2.60 0.256 0.0210    0.00527      4 Oikopleura red  
#>  5    28  2.87 0.377 0.104     0.0639      10 Oikopleura red  
#>  6    29  2.61 0.428 0.0674    0.0523       8 Oikopleura red  
#>  7    30  2.41 0.324 0.0248    0.0415       6 Oikopleura red  
#>  8    31  1.17 0.203 0.0000707 0.0261       2 Oikopleura red  
#>  9    32  2.31 0.310 0.0268    0.0740       4 Oikopleura red  
#> 10    33  2.09 0.252 0.00233   0.0243       2 Oikopleura red  
#> 
```
