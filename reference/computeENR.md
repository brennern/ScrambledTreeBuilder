# Compute ENR points (Excess Normalized Residuals over a LOESS trend)

Trait-agnostic residual standardization for any y vs x relationship. Fit
a LOESS mean trend ŷ(x), compute residuals r = y - ŷ, and standardize
them to unit-free, z-like scores ENRz. Positive ENRz = above-trend;
negative = below-trend.

## Usage

``` r
computeENR(
  tb,
  span = 0.7,
  family = "symmetric",
  degree = 1,
  use_weights = TRUE,
  std_mode = c("robust_global", "global_sd", "local_loess"),
  span_scale = 0.7
)
```

## Arguments

- tb:

  A data.frame/tibble with at least columns `x` and `y`.

- span:

  LOESS span for the mean trend (default 0.7).

- family:

  LOESS family; `"symmetric"` is robust to outliers (default).

- degree:

  Local polynomial degree for LOESS (1 = local lines).

- use_weights:

  If `TRUE`, use column `n` as LOESS weights when present.

- std_mode:

  One of `"robust_global"`, `"global_sd"`, or `"local_loess"`.

  - `robust_global`: global MAD\*1.4826 (robust σ)

  - `global_sd`: global standard deviation

  - `local_loess`: LOESS on `abs(resid)` to model local σ

- span_scale:

  LOESS span used only for the `local_loess` sigma fit.

## Value

`tb` with added columns:

- `y_hat`: LOESS fitted value at each `x`

- `resid`: raw residual `y - y_hat`

- `ENRz`: standardized residual (z-like score)

## Examples

``` r
# out <- MRCAs(df, focal) |> computeENR()
# head(out)
```
