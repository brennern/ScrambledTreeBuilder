# Focal clades (焦点系統群)

Clades of interest to be plotted in color

## Usage

``` r
focalClade(Tibble, left, right, color, displayName)
```

## Arguments

- Tibble:

  A
  [`ConvenientTblTree`](https://brennern.github.io/ScrambledTreeBuilder/reference/ConvenientTblTree.md)
  object.

- left, right:

  Leaf labels whose most common recent ancestor will define the clade

- color:

  Color of the clade in plots

- displayName:

  Display name of the clade (can contain spaces)

## See also

Other Focal clade functions:
[`eog()`](https://brennern.github.io/ScrambledTreeBuilder/reference/eog.md),
[`recordAncestor()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordAncestor.md),
[`recordClades()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordClades.md),
[`subMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subMatrix.md),
[`subTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subTree.md),
[`visualizeTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/visualizeTree.md)

## Author

Charles Plessy

## Examples

``` r
(Halobacterium <- focalClade(Halo_Tree,
  "Halobacterium_noricense", "Halobacterium_salinarum", "blue", "Halobacterium genus"))
#> Halobacterium genus, node ID: 10, number of genomes: 3
(Haloferax <- focalClade(Halo_Tree,
  "Haloferax_mediterranei", "Haloferax_volcanii", "green3", "Haloferax genus"))
#> Haloferax genus, node ID: 8, number of genomes: 2
(clades <- FocalCladeList(Halobacterium, Haloferax))
#> Halobacterium genus, node ID: 10, number of genomes: 3
#> Haloferax genus, node ID: 8, number of genomes: 2
visualizeTree(Halo_Tree) + clades
```
