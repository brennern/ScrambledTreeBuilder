# Residual-resampling bootstrap tree(s) from a distance matrix (UPGMA)

Build a reference tree from a distance matrix using UPGMA, then perform
residual-resampling bootstrap to obtain replicate trees and map clade
support onto the reference.

## Usage

``` r
residualBootstrapTree(D, n_bootstrap = 1000L, clamp_zero = TRUE)
```

## Arguments

- D:

  A square numeric distance matrix with identical row/column names, or a
  `dist` object.

- n_bootstrap:

  Integer number of bootstrap replicates (default 1000).

- clamp_zero:

  Logical; clamp negative distances in resampled matrices to 0
  (recommended).

## Value

A `list` with:

- `tree`: Reference tree (`phylo`) built from `D` with UPGMA. Node
  labels contain bootstrap %.

- `bootstrap_trees`: List of replicate trees (`phylo`).

- `support`: Numeric vector of bootstrap percentages per internal node
  (aligned to `tree$node.label`).

- `call`: Matched call.

## Author

Anika Mittal

## Examples

``` r
out <- residualBootstrapTree(Halo_PercentDiff, n_bootstrap = 200)
plot(out$tree, show.node.label = TRUE)

```
