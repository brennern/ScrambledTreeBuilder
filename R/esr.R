#' Compute ESR points (Excess Scrambling over a LOESS trend)
#'
#' Fit a LOESS trend `y ~ x`, compute residuals `resid = y - y_hat`, and
#' standardize them to unit-free z-like scores `ESRz`.
#'
#' @param tb A tibble produced by [`MRCAs`]
#' @param span LOESS span for the mean trend (default 0.7).
#' @param family LOESS family; `"symmetric"` is robust to outliers (default).
#' @param degree Local polynomial degree for LOESS (1 = local lines).
#' @param use_weights Logical; if `TRUE` use `n` as LOESS weights.
#' @param std_mode One of `"robust_global"`, `"global_sd"`, or `"local_loess"`.
#'   - `robust_global`: global MAD*1.4826
#'   - `global_sd`: global standard deviation
#'   - `local_loess`: LOESS on `abs(resid)` to get a local sigma
#' @param span_scale LOESS span used only for the `local_loess` sigma fit.
#'
#' @return The input table with added columns:
#'   - `y_hat`: LOESS fitted value at each `x`
#'   - `resid`: raw residual `y - y_hat`
#'   - `ESRz`: standardized residual (z-like score)
#'
#' @author Anika Mittal
#'
#' @examples
#' out <- MRCAs(Halo_DF, Halo_FocalClades) |> computeESR()
#' head(out)
#'
#' @export
#' @importFrom stats loess predict mad sd
computeESR <- function(tb,
                               span = 0.7,
                               family = "symmetric",
                               degree = 1,
                               use_weights = TRUE,
                               std_mode = c("robust_global","global_sd","local_loess"),
                               span_scale = 0.7) {
  stopifnot(all(c("x","y") %in% names(tb)))
  std_mode <- match.arg(std_mode)
  
  # Optional LOESS weight
  w <- if (use_weights && "n" %in% names(tb)) tb$n else NULL
  
  # Fit LOESS mean trend
  fit <- stats::loess(y ~ x, data = tb, span = span, family = family, degree = degree, weights = w)
  
  # Predict fitted values (use only 'x' to avoid surprises)
  tb$y_hat <- as.numeric(stats::predict(fit, newdata = data.frame(x = tb$x)))
  tb$resid <- tb$y - tb$y_hat
  
  # Standardize residuals
  if (std_mode == "robust_global") {
    s <- stats::mad(tb$resid, center = 0, na.rm = TRUE) * 1.4826
    if (!is.finite(s) || s < .Machine$double.eps) s <- stats::sd(tb$resid, na.rm = TRUE)
    if (!is.finite(s) || s < .Machine$double.eps) s <- 1
    tb$ESRz <- tb$resid / s
    
  } else if (std_mode == "global_sd") {
    s <- stats::sd(tb$resid, na.rm = TRUE)
    if (!is.finite(s) || s < .Machine$double.eps) s <- 1
    tb$ESRz <- tb$resid / s
    
  } else {
    # local_loess: model heteroskedasticity via LOESS on |resid|
    abs_fit <- stats::loess(abs(resid) ~ x, data = tb, span = span_scale, family = "symmetric")
    sigma_hat <- as.numeric(stats::predict(abs_fit, newdata = data.frame(x = tb$x))) * 1.253
    # Fallback to global SD when needed
    global_sd <- stats::sd(tb$resid, na.rm = TRUE)
    if (!is.finite(global_sd) || global_sd < .Machine$double.eps) global_sd <- 1
    bad <- !is.finite(sigma_hat) | sigma_hat < .Machine$double.eps
    sigma_hat[bad] <- global_sd
    tb$ESRz <- tb$resid / sigma_hat
  }
  
  tb
}

#' Aggregate ESR scores by clade
#'
#' Summarise point-level ESR statistics at the clade level using weighted means
#' (weights = `n` when available). Optionally require that "FAST" clades also
#' sit on the lower-divergence side (x_mean <= median x_mean).
#'
#' @param tb_points A data.frame/tibble returned by [compute_esr_points()]
#' @param z_cut Threshold on standardized excess (`ESRz`) to tag FAST/SLOW (default 1).
#' @param require_low_x If `TRUE`, "FAST" must also have `x_mean` <= median `x_mean`.
#'
#' @return A tibble with one row per clade:
#'   `clade`, `ESR` (mean raw residual), `ESRz` (mean standardized),
#'   `x_mean`, `y_mean`, `n_nodes`, and `ESR_label`.
#'
#' @author Anika Mittal
#'
#' @examples
#' tb_esr <- MRCAs(Halo_DF, Halo_FocalClades) |> computeESR()
#' cladeESRtable(tb_esr, z_cut = 1)
#'
#' @export
#' @importFrom dplyr filter group_by summarise mutate case_when arrange desc n
#' @importFrom rlang .data
cladeESRtable <- function(tb_points, z_cut = 1, require_low_x = TRUE) {
  if (!all(c("x","y","resid","ESRz","clade") %in% names(tb_points))) {
    stop("tb_points must contain columns: x, y, resid, ESRz, clade")
  }
  
  # Weighted summaries by clade
  clade_tbl <- tb_points |>
    dplyr::filter(!is.na(.data$clade), .data$clade != "Other") |>
    dplyr::group_by(.data$clade) |>
    dplyr::summarise(
      ESR    = stats::weighted.mean(.data$resid, w = if ("n" %in% names(tb_points)) .data$n else NULL, na.rm = TRUE),
      ESRz   = stats::weighted.mean(.data$ESRz,  w = if ("n" %in% names(tb_points)) .data$n else NULL, na.rm = TRUE),
      x_mean = stats::weighted.mean(.data$x,     w = if ("n" %in% names(tb_points)) .data$n else NULL, na.rm = TRUE),
      y_mean = stats::weighted.mean(.data$y,     w = if ("n" %in% names(tb_points)) .data$n else NULL, na.rm = TRUE),
      n_nodes = if ("n" %in% names(tb_points)) sum(.data$n, na.rm = TRUE) else dplyr::n(),
      .groups = "drop"
    )
  
  x_threshold <- stats::median(clade_tbl$x_mean, na.rm = TRUE)
  
  clade_tbl |>
    dplyr::mutate(
      ESR_label = dplyr::case_when(
        ESRz >=  z_cut & (!require_low_x | x_mean <= x_threshold) ~ "FAST (ESR)",
        ESRz <= -z_cut                                            ~ "SLOW/STABLE (ESR)",
        TRUE                                                      ~ "TYPICAL (ESR)"
      )
    )|>
    dplyr::arrange(dplyr::desc(.data$ESRz))
}
