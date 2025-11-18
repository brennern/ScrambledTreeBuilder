# 2D MRCA plot

2D plot of the statistics extracted for each MRCA.

## Usage

``` r
MRCA_2D_plot(tb, errorbars = FALSE, xlim = 40, ylim = 1)
```

## Arguments

- tb:

  A tibble produced by
  [`MRCAs`](https://brennern.github.io/ScrambledTreeBuilder/reference/MRCAs.md).

- errorbars:

  Plot the error bars?

- xlim, ylim:

  Maximal X and Y value.

## See also

Other Plotting functions:
[`ellipsePlot()`](https://brennern.github.io/ScrambledTreeBuilder/reference/ellipsePlot.md),
[`treeHeatMap()`](https://brennern.github.io/ScrambledTreeBuilder/reference/treeHeatMap.md),
[`visualizeTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/visualizeTree.md)

## Author

Charles Plessy

## Examples

``` r
(p <- MRCAs(Halo_DF, Halo_FocalClades) |> MRCA_2D_plot() +
  ggplot2::labs(x="nucl. diff", y="scrambling"))

p + ggplot2::geom_point(
  data=Halo_DF,
  ggplot2::aes(x = percent_difference_local,
               y = index_avg_strandDiscord,
               color = focalClade))
```
