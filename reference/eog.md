# Run `eog` on a plot for a clade

Prepare a shell command to run the Eye of Gnome image viewer on a subset
of alignment pairwise plots comparing genomes from the same clade.

## Usage

``` r
eog(tree, node, target = NULL)
```

## Arguments

- tree:

  A tree created with the
  [`makeTidyTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/makeTidyTree.md)
  function.

- node:

  The ID number of the node to base the subtree, or a `FocalClade`
  object.

- target:

  A pattern to restrict the files to share the same target genome.

## See also

Other Focal clade functions:
[`focalClade()`](https://brennern.github.io/ScrambledTreeBuilder/reference/focalClade.md),
[`recordAncestor()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordAncestor.md),
[`recordClades()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordClades.md),
[`subMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subMatrix.md),
[`subTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subTree.md),
[`visualizeTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/visualizeTree.md)

## Author

Charles Plessy

## Examples

``` r
eog(Halo_Tree, 10)
#> [1] "eog results_{Halobacterium_litoreum,Halobacterium_noricense,Halobacterium_salinarum}/alignment/*___{Halobacterium_litoreum,Halobacterium_noricense,Halobacterium_salinarum}.o2o_plt.png"
eog(Halo_Tree, 10, target = "nori")
#> [1] "eog results_Halobacterium_noricense/alignment/*___{Halobacterium_litoreum,Halobacterium_noricense,Halobacterium_salinarum}.o2o_plt.png"
eog(Halo_Tree, Halo_FocalClades$Haloferax)
#> [1] "eog results_{Haloferax_mediterranei,Haloferax_volcanii}/alignment/*___{Haloferax_mediterranei,Haloferax_volcanii}.o2o_plt.png"
```
