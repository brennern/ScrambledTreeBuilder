#' Ellipse plots
#'
#' Plot alignments statistics for pairs of genome, draw ellipses on plots with
#' the same most recent common ancestor, color points and ellipses by focal
#' clade.
#'
#' @param df A data frame produced by [`MRCAs`].
#' @param dim1,dim2 the name of the pairwise statistics to summarise.
#' @param xlim,ylim Minimal and maximal X and Y values.
#'
#' @author Charles Plessy
#'
#' @family Plotting functions
#'
#' @importFrom dplyr pull
#' @importFrom ggforce geom_mark_ellipse
#' @importFrom ggplot2 scale_color_manual scale_fill_manual theme_bw
#' @importFrom ggplot2 scale_x_continuous scale_y_continuous
#' @export
#'
#' @examples
#' ellipsePlot(Halo_DF |> averageResults())

ellipsePlot <- function(df, dim1="percent_difference_local", dim2="index_avg_strandDiscord", xlim = c(0, max(df[[dim1]])), ylim = c(0, max(df[[dim2]])))  {
  focalColors <- df |>
    group_by(.data$focalClade) |>
    summarize(color = unique(.data$focalColor)) |>
    pull(.data$color, name = .data$focalClade)
  ggplot(df) +
    geom_point() +
    aes( x     = .data[[dim1]]
       , y     = .data[[dim2]]
       , group = as.factor(.data$MRCA)
       , col   = .data$focalClade) +
    geom_mark_ellipse(aes(fill = .data$focalClade)) +
    labs(x = dim1, y = dim2) +
    scale_color_manual(values=focalColors) +
    scale_fill_manual( values=focalColors) +
    scale_x_continuous(limits = xlim) +
    scale_y_continuous(limits = ylim) +
    theme_bw()
}
