# Pairwise comparison matrix

Make a matrix from a data frame containing species data.

## Usage

``` r
makeMatrix(
  DF,
  column = "",
  defaultDiagonal = 100,
  defaultValue = NA,
  impute = c("no", "average", "missForest", "missForest2"),
  ...
)
```

## Arguments

- DF:

  Data frame containing species information, produced with
  [`formatStats()`](https://brennern.github.io/ScrambledTreeBuilder/reference/formatStats.md)

- column:

  The variable from the data frame to extract species data from.

- defaultDiagonal:

  Maximum possible value of variable.

- defaultValue:

  Minimum possible value of variable.

- impute:

  Method to impute missing value. Defaults to `no`.

- ...:

  Other arguments passed to the imputing function.

## Value

A square `matrix` where rows and columns are sample identifiers and
values are statistics for the pairs of samples. In addition it has an
attribute "builtWith" that records the value of `column`.

## Note

In case of missing values, the following options are available.

- Leave them missing (`NA`). This is the default.

- Give them a fixed value defined by the `devaultValue` option.

- Impute them from the replicate (when *target* and *query* roles are
  exchanged) if available (`impute=average`), else give them the default
  value.

- Impute them from the replicate, and then with random forests
  (`impute=missForest`). Hide the diagonal values (which are extreme)
  when (`impute=missForest2`).

## Author

Noa Brenner

Charles Plessy

Anika Mittal

## Examples

``` r
df <- Halo_DF

# Missing values get NA by default unless specified in the 4th argument.
df["Salarchaeum_japonicum___Haloferax_volcanii", "percent_difference_global"] <- NA

makeMatrix(df, "percent_difference_global", 0)
#>                         Halobacterium_litoreum Halobacterium_noricense
#> Halobacterium_litoreum                 0.00000                21.18801
#> Halobacterium_noricense               21.26064                 0.00000
#> Halobacterium_salinarum               24.15702                25.05241
#> Haloferax_mediterranei                31.72595                33.57159
#> Haloferax_volcanii                    29.88642                30.06817
#> Salarchaeum_japonicum                 27.24648                27.88932
#>                         Halobacterium_salinarum Haloferax_mediterranei
#> Halobacterium_litoreum                 24.24792               31.27923
#> Halobacterium_noricense                25.05377               31.54667
#> Halobacterium_salinarum                 0.00000               32.99448
#> Haloferax_mediterranei                 33.02111                0.00000
#> Haloferax_volcanii                     31.51689               19.60559
#> Salarchaeum_japonicum                  28.19145               31.34071
#>                         Haloferax_volcanii Salarchaeum_japonicum
#> Halobacterium_litoreum            29.83707              27.25050
#> Halobacterium_noricense           30.03853              27.57799
#> Halobacterium_salinarum           31.51122              28.44185
#> Haloferax_mediterranei            19.77441              31.58067
#> Haloferax_volcanii                 0.00000              30.20358
#> Salarchaeum_japonicum                   NA               0.00000
#> attr(,"builtWith")
#> [1] "percent_difference_global"
makeMatrix(df, "percent_difference_global", 0, impute = "average")
#>                         Halobacterium_litoreum Halobacterium_noricense
#> Halobacterium_litoreum                 0.00000                21.18801
#> Halobacterium_noricense               21.26064                 0.00000
#> Halobacterium_salinarum               24.15702                25.05241
#> Haloferax_mediterranei                31.72595                33.57159
#> Haloferax_volcanii                    29.88642                30.06817
#> Salarchaeum_japonicum                 27.24648                27.88932
#>                         Halobacterium_salinarum Haloferax_mediterranei
#> Halobacterium_litoreum                 24.24792               31.27923
#> Halobacterium_noricense                25.05377               31.54667
#> Halobacterium_salinarum                 0.00000               32.99448
#> Haloferax_mediterranei                 33.02111                0.00000
#> Haloferax_volcanii                     31.51689               19.60559
#> Salarchaeum_japonicum                  28.19145               31.34071
#>                         Haloferax_volcanii Salarchaeum_japonicum
#> Halobacterium_litoreum            29.83707              27.25050
#> Halobacterium_noricense           30.03853              27.57799
#> Halobacterium_salinarum           31.51122              28.44185
#> Haloferax_mediterranei            19.77441              31.58067
#> Haloferax_volcanii                 0.00000              30.20358
#> Salarchaeum_japonicum             30.20358               0.00000
#> attr(,"builtWith")
#> [1] "percent_difference_global"

# NA value imputation with missForest use random numbers
set.seed(1664)
df["Haloferax_volcanii___Salarchaeum_japonicum", "percent_difference_global"] <- NA
makeMatrix(df, "percent_difference_global", 0, impute =    "average")
#>                         Halobacterium_litoreum Halobacterium_noricense
#> Halobacterium_litoreum                 0.00000                21.18801
#> Halobacterium_noricense               21.26064                 0.00000
#> Halobacterium_salinarum               24.15702                25.05241
#> Haloferax_mediterranei                31.72595                33.57159
#> Haloferax_volcanii                    29.88642                30.06817
#> Salarchaeum_japonicum                 27.24648                27.88932
#>                         Halobacterium_salinarum Haloferax_mediterranei
#> Halobacterium_litoreum                 24.24792               31.27923
#> Halobacterium_noricense                25.05377               31.54667
#> Halobacterium_salinarum                 0.00000               32.99448
#> Haloferax_mediterranei                 33.02111                0.00000
#> Haloferax_volcanii                     31.51689               19.60559
#> Salarchaeum_japonicum                  28.19145               31.34071
#>                         Haloferax_volcanii Salarchaeum_japonicum
#> Halobacterium_litoreum            29.83707              27.25050
#> Halobacterium_noricense           30.03853              27.57799
#> Halobacterium_salinarum           31.51122              28.44185
#> Haloferax_mediterranei            19.77441              31.58067
#> Haloferax_volcanii                 0.00000                    NA
#> Salarchaeum_japonicum                   NA               0.00000
#> attr(,"builtWith")
#> [1] "percent_difference_global"
makeMatrix(df, "percent_difference_global", 0, impute = "missForest")
#>                         Halobacterium_litoreum Halobacterium_noricense
#> Halobacterium_litoreum                 0.00000                21.18801
#> Halobacterium_noricense               21.26064                 0.00000
#> Halobacterium_salinarum               24.15702                25.05241
#> Haloferax_mediterranei                31.72595                33.57159
#> Haloferax_volcanii                    29.88642                30.06817
#> Salarchaeum_japonicum                 27.24648                27.88932
#>                         Halobacterium_salinarum Haloferax_mediterranei
#> Halobacterium_litoreum                 24.24792               31.27923
#> Halobacterium_noricense                25.05377               31.54667
#> Halobacterium_salinarum                 0.00000               32.99448
#> Haloferax_mediterranei                 33.02111                0.00000
#> Haloferax_volcanii                     31.51689               19.60559
#> Salarchaeum_japonicum                  28.19145               31.34071
#>                         Haloferax_volcanii Salarchaeum_japonicum
#> Halobacterium_litoreum            29.83707              27.25050
#> Halobacterium_noricense           30.03853              27.57799
#> Halobacterium_salinarum           31.51122              28.44185
#> Haloferax_mediterranei            19.77441              31.58067
#> Haloferax_volcanii                 0.00000              23.51869
#> Salarchaeum_japonicum             22.35144               0.00000
#> attr(,"builtWith")
#> [1] "percent_difference_global"
makeMatrix(df, "percent_difference_global", 0, impute = "missForest2")
#>                         Halobacterium_litoreum Halobacterium_noricense
#> Halobacterium_litoreum                 0.00000                21.18801
#> Halobacterium_noricense               21.26064                 0.00000
#> Halobacterium_salinarum               24.15702                25.05241
#> Haloferax_mediterranei                31.72595                33.57159
#> Haloferax_volcanii                    29.88642                30.06817
#> Salarchaeum_japonicum                 27.24648                27.88932
#>                         Halobacterium_salinarum Haloferax_mediterranei
#> Halobacterium_litoreum                 24.24792               31.27923
#> Halobacterium_noricense                25.05377               31.54667
#> Halobacterium_salinarum                 0.00000               32.99448
#> Haloferax_mediterranei                 33.02111                0.00000
#> Haloferax_volcanii                     31.51689               19.60559
#> Salarchaeum_japonicum                  28.19145               31.34071
#>                         Haloferax_volcanii Salarchaeum_japonicum
#> Halobacterium_litoreum            29.83707              27.25050
#> Halobacterium_noricense           30.03853              27.57799
#> Halobacterium_salinarum           31.51122              28.44185
#> Haloferax_mediterranei            19.77441              31.58067
#> Haloferax_volcanii                 0.00000              28.85750
#> Salarchaeum_japonicum             27.67239               0.00000
#> attr(,"builtWith")
#> [1] "percent_difference_global"

# Warns and returns NULL if column not found
makeMatrix(df, "you_will_never_find_this_column", 0, 50)
#> Warning: Column “you_will_never_find_this_column” not found.
#> NULL
```
