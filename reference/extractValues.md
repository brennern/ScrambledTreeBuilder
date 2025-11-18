# Extract values from a matrix.

Extract values from a matrix.

## Usage

``` r
extractValues(node, your_tibble, your_matrix, fun = mean)
```

## Arguments

- node:

  Node

- your_tibble:

  Tibble data developed from tree.

- your_matrix:

  Matrix containing species data.

- fun:

  Calculates mean, median, etc. between node values to plot on the tree
  (default fun is mean)

## Value

Values to store in a variable (percent difference, scrambling index,
etc.)

## See also

Other Functions for trees:
[`childSpecies()`](https://brennern.github.io/ScrambledTreeBuilder/reference/childSpecies.md),
[`recordAncestor()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordAncestor.md),
[`subMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subMatrix.md)

## Examples

``` r
unique(Halo_Tree$parent) |> sort() |>
  purrr::set_names() |> sapply(extractValues, Halo_Tree, Halo_PercentDiff)
#>        7        8        9       10       11 
#> 31.44680 19.77441 27.77575 24.60471 21.18801 
```
