# Aggregate ENR scores by clade

Summarise point-level ENR statistics at the clade level using weighted
means (weights = `n` when available). Optionally require that
"ABOVE-TREND" clades also sit on the lower-divergence side (`x_mean` \<=
median `x_mean`).

## Usage

``` r
cladeENRtable(tb_points, z_cut = 1, require_low_x = TRUE)
```

## Arguments

- tb_points:

  A data.frame/tibble containing columns `x,y,resid,ENRz,clade` (and
  optionally `n`).

- z_cut:

  Threshold on standardized excess (`ENRz`) to tag categories (default
  1).

- require_low_x:

  If `TRUE`, "ABOVE-TREND" must also have `x_mean` \<= median `x_mean`.

## Value

A tibble with one row per clade: `clade`, `ENR` (mean raw residual),
`ENRz` (mean standardized), `x_mean`, `y_mean`, `n_nodes`, and
`ENR_label`.

## Examples

``` r
# tb_enr <- MRCAs(df, focal) |> computeENR()
# cladeENRtable(tb_enr, z_cut = 1)
```
