# Plot a phylogenetic tree and its node data

Plot a phylogenetic tree and its node data

## Usage

``` r
visualizeTree(
  your_tibble,
  value = "node",
  valueround = 2,
  outerlabelsize = 0.25,
  innerlabelsize = 3,
  ynudge = 0,
  xnudge = 0
)
```

## Arguments

- your_tibble:

  A
  [`ConvenientTblTree`](https://brennern.github.io/ScrambledTreeBuilder/reference/ConvenientTblTree.md)
  object.

- value:

  Tibble value to label on internal nodes of the tree, or name of a
  column in the tree object.

- valueround:

  Number of integers to round value.

- outerlabelsize:

  Size of label border.

- innerlabelsize:

  Overall size of label.

- xnudge, ynudge:

  Adjust horizontal or vertical position of labels (useful when plotting
  multiple labels).

## Value

A phylogenetic tree showcasing phylogeny of species, additional node
values, or just node IDs. No legend is show when displaying node IDs.

## See also

Other Focal clade functions:
[`eog()`](https://brennern.github.io/ScrambledTreeBuilder/reference/eog.md),
[`focalClade()`](https://brennern.github.io/ScrambledTreeBuilder/reference/focalClade.md),
[`recordAncestor()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordAncestor.md),
[`recordClades()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordClades.md),
[`subMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subMatrix.md),
[`subTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subTree.md)

Other Plotting functions:
[`MRCA_2D_plot()`](https://brennern.github.io/ScrambledTreeBuilder/reference/MRCA_2D_plot.md),
[`ellipsePlot()`](https://brennern.github.io/ScrambledTreeBuilder/reference/ellipsePlot.md),
[`treeHeatMap()`](https://brennern.github.io/ScrambledTreeBuilder/reference/treeHeatMap.md)

## Author

Noah Brenner

Charles Plessy

## Examples

``` r
visualizeTree(Halo_Tree)

visualizeTree(Halo_Tree, value = Halo_Tree$Scrambling_index)

visualizeTree(Halo_Tree, "Scrambling_index") # same
```
