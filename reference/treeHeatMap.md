# Clustered heatmap

Takes a matrix, a tree, and optionally some focal clades to plot a
heatmap clustered with that tree. Obviously, the tree and the matrix
need to be related.

## Usage

``` r
treeHeatMap(mat, tree = NULL, clades = NULL, ...)
```

## Arguments

- mat:

  a matrix with numerical values.

- tree:

  A
  [`ConvenientTblTree`](https://brennern.github.io/ScrambledTreeBuilder/reference/ConvenientTblTree.md)
  object.

- clades:

  A
  [`FocalCladeList`](https://brennern.github.io/ScrambledTreeBuilder/reference/FocalCladeList.md)
  object.

- ...:

  Extra arguments passed to
  [`pheatmap::pheatmap()`](https://rdrr.io/pkg/pheatmap/man/pheatmap.html)

## Value

A `pheatmap` object.

## See also

Other Plotting functions:
[`MRCA_2D_plot()`](https://brennern.github.io/ScrambledTreeBuilder/reference/MRCA_2D_plot.md),
[`ellipsePlot()`](https://brennern.github.io/ScrambledTreeBuilder/reference/ellipsePlot.md),
[`visualizeTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/visualizeTree.md)

## Author

Charles Plessy

## Examples

``` r
treeHeatMap(Halo_PercentDiff)

treeHeatMap(Halo_PercentDiff, Halo_Tree)

treeHeatMap(Halo_PercentDiff, Halo_Tree, Halo_FocalClades)

```
