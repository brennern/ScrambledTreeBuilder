# Children species of an ancestor

Children species of an ancestor

## Usage

``` r
childSpecies(tree, node)
```

## Arguments

- tree:

  A
  [`ConvenientTblTree`](https://brennern.github.io/ScrambledTreeBuilder/reference/ConvenientTblTree.md)
  object.

- node:

  An internal node in that tree.

## Value

A list of the label names on the left and right branch of the tree.

## See also

Other Functions for trees:
[`extractValues()`](https://brennern.github.io/ScrambledTreeBuilder/reference/extractValues.md),
[`recordAncestor()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordAncestor.md),
[`subMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subMatrix.md)

## Author

Noa Brenner

Charles Plessy

## Examples

``` r
childSpecies(Halo_Tree, 7)
#> $left
#> [1] "Haloferax_mediterranei" "Haloferax_volcanii"    
#> 
#> $right
#> [1] "Halobacterium_litoreum"  "Halobacterium_noricense"
#> [3] "Halobacterium_salinarum" "Salarchaeum_japonicum"  
#> 
```
