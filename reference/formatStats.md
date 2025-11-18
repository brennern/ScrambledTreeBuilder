# Consolidate YAML reports in one data frame

Read YAML files, one per pair of genomes, and consolidate the
information in one data frame where each row is one pair and each column
is one statistic.

## Usage

``` r
formatStats(files)
```

## Arguments

- files:

  A named character vector of paths to YAML files. The names will become
  the row names of the output data frame. Compressed files are accepted.

## Value

Formatted `data.frame` with alignment statistics such as alignment
length, strand randomisation index or percent identity. Its `lab` column
contains a 2-line text item to allow some plots to display the
`species1` and `species2` identifiers in a way that is easily centered
on the data point.

## Details

The format of the YAML files changed over time and this function has
some commands that aim at supporting legacy formats, converting column
names, etc.

## See also

Other Data load functions:
[`resultFiles()`](https://brennern.github.io/ScrambledTreeBuilder/reference/resultFiles.md)

## Author

Noah Brenner

Charles Plessy

## Examples

``` r
yamlFileData <-
  system.file("extdata/yaml", package = "ScrambledTreeBuilder") |> resultFiles()
exDataFrame <- formatStats(yamlFileData)
exDataFrame[1:10,1:6]
#>                                                   aligned_length_Min
#> Halobacterium_litoreum___Halobacterium_noricense                  62
#> Halobacterium_litoreum___Halobacterium_salinarum                 100
#> Halobacterium_litoreum___Haloferax_mediterranei                   92
#> Halobacterium_litoreum___Haloferax_volcanii                       72
#> Halobacterium_litoreum___Salarchaeum_japonicum                    66
#> Halobacterium_noricense___Halobacterium_litoreum                  66
#> Halobacterium_noricense___Halobacterium_salinarum                 76
#> Halobacterium_noricense___Haloferax_mediterranei                  60
#> Halobacterium_noricense___Haloferax_volcanii                      79
#> Halobacterium_noricense___Salarchaeum_japonicum                   77
#>                                                   aligned_length_Q1
#> Halobacterium_litoreum___Halobacterium_noricense             717.50
#> Halobacterium_litoreum___Halobacterium_salinarum             778.00
#> Halobacterium_litoreum___Haloferax_mediterranei              546.50
#> Halobacterium_litoreum___Haloferax_volcanii                  585.00
#> Halobacterium_litoreum___Salarchaeum_japonicum               674.75
#> Halobacterium_noricense___Halobacterium_litoreum             718.75
#> Halobacterium_noricense___Halobacterium_salinarum            731.00
#> Halobacterium_noricense___Haloferax_mediterranei             557.00
#> Halobacterium_noricense___Haloferax_volcanii                 577.75
#> Halobacterium_noricense___Salarchaeum_japonicum              684.00
#>                                                   aligned_length_Median
#> Halobacterium_litoreum___Halobacterium_noricense                 1409.0
#> Halobacterium_litoreum___Halobacterium_salinarum                 1459.5
#> Halobacterium_litoreum___Haloferax_mediterranei                   949.0
#> Halobacterium_litoreum___Haloferax_volcanii                       994.5
#> Halobacterium_litoreum___Salarchaeum_japonicum                   1260.5
#> Halobacterium_noricense___Halobacterium_litoreum                 1422.5
#> Halobacterium_noricense___Halobacterium_salinarum                1349.0
#> Halobacterium_noricense___Haloferax_mediterranei                  963.0
#> Halobacterium_noricense___Haloferax_volcanii                      998.0
#> Halobacterium_noricense___Salarchaeum_japonicum                  1235.0
#>                                                   aligned_length_Mean
#> Halobacterium_litoreum___Halobacterium_noricense             2177.722
#> Halobacterium_litoreum___Halobacterium_salinarum             2248.691
#> Halobacterium_litoreum___Haloferax_mediterranei              1185.227
#> Halobacterium_litoreum___Haloferax_volcanii                  1296.762
#> Halobacterium_litoreum___Salarchaeum_japonicum               1813.424
#> Halobacterium_noricense___Halobacterium_litoreum             2211.831
#> Halobacterium_noricense___Halobacterium_salinarum            2089.673
#> Halobacterium_noricense___Haloferax_mediterranei             1213.886
#> Halobacterium_noricense___Haloferax_volcanii                 1309.893
#> Halobacterium_noricense___Salarchaeum_japonicum              1781.424
#>                                                   aligned_length_Q3
#> Halobacterium_litoreum___Halobacterium_noricense            2926.50
#> Halobacterium_litoreum___Halobacterium_salinarum            3053.00
#> Halobacterium_litoreum___Haloferax_mediterranei             1506.50
#> Halobacterium_litoreum___Haloferax_volcanii                 1649.25
#> Halobacterium_litoreum___Salarchaeum_japonicum              2315.00
#> Halobacterium_noricense___Halobacterium_litoreum            2988.50
#> Halobacterium_noricense___Halobacterium_salinarum           2668.50
#> Halobacterium_noricense___Haloferax_mediterranei            1521.00
#> Halobacterium_noricense___Haloferax_volcanii                1640.25
#> Halobacterium_noricense___Salarchaeum_japonicum             2238.50
#>                                                   aligned_length_Max
#> Halobacterium_litoreum___Halobacterium_noricense               18125
#> Halobacterium_litoreum___Halobacterium_salinarum               18237
#> Halobacterium_litoreum___Haloferax_mediterranei                14391
#> Halobacterium_litoreum___Haloferax_volcanii                    14440
#> Halobacterium_litoreum___Salarchaeum_japonicum                 20211
#> Halobacterium_noricense___Halobacterium_litoreum               18125
#> Halobacterium_noricense___Halobacterium_salinarum              20473
#> Halobacterium_noricense___Haloferax_mediterranei               14665
#> Halobacterium_noricense___Haloferax_volcanii                   13872
#> Halobacterium_noricense___Salarchaeum_japonicum                18158
```
