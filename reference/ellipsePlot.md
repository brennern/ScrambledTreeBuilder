# Ellipse plots

Plot alignments statistics for pairs of genome, draw ellipses on plots
with the same most recent common ancestor, color points and ellipses by
focal clade.

## Usage

``` r
ellipsePlot(
  df,
  dim1 = "percent_difference_local",
  dim2 = "index_avg_strandDiscord",
  xlim = c(0, max(df[[dim1]])),
  ylim = c(0, max(df[[dim2]]))
)
```

## Arguments

- df:

  A data frame produced by
  [`MRCAs`](https://brennern.github.io/ScrambledTreeBuilder/reference/MRCAs.md).

- dim1, dim2:

  the name of the pairwise statistics to summarise.

- xlim, ylim:

  Minimal and maximal X and Y values.

## See also

Other Plotting functions:
[`MRCA_2D_plot()`](https://brennern.github.io/ScrambledTreeBuilder/reference/MRCA_2D_plot.md),
[`treeHeatMap()`](https://brennern.github.io/ScrambledTreeBuilder/reference/treeHeatMap.md),
[`visualizeTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/visualizeTree.md)

## Author

Charles Plessy

## Examples

``` r
ellipsePlot(Halo_DF |> averageResults())
```
