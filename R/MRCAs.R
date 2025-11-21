#' Most recent common ancestors
#'
#' Summarise statistics for MRCAs
#'
#' @param results A results data frame produed by [`formatStats()`], with MRCAs
#'        annotated with [`recordAncestor()`].
#' @param clades A [`FocalCladeList`] object.
#' @param dim1,dim2 the name of the pairwise statistics to summarise.
#' @param center,dispersion Functions to compute a representation of the
#'        central tendency and the dispersion of the values for each MRCA.
#'
#' @author Charles Plessy
#'
#' @returns A tibble ([tibble::tbl_df-class]) ready for [`MRCA_2D_plot`].
#'
#' @importFrom dplyr group_by summarize sym ungroup
#' @export
#'
#' @examples
#' MRCAs(Halo_DF, Halo_FocalClades)

MRCAs <- function(results, clades = NULL, dim1 = "percent_difference_local", dim2 = "index_avg_strandDiscord", center = mean, dispersion = sd) {
  tb <- results |>
    group_by(.data$MRCA) |>
    summarize(
      x    = center(     !!sym(dim1), na.rm = TRUE),   # Central tendency for x
      y    = center(     !!sym(dim2), na.rm = TRUE),   # Central tendency for y
      xerr = dispersion( !!sym(dim1), na.rm = TRUE),   # Dispersion for x
      yerr = dispersion( !!sym(dim2), na.rm = TRUE),   # Dispersion for y
      n = length(.data$MRCA)
    ) |>
    ungroup()
  tb$clade <- "Other"
  tb$color <- NA
  if (! is.null(clades)) {
    for (clade in clades) {
      tb$clade[tb$MRCA %in% clade@nodeList] <- sub(" .*", "", clade@displayName)
      tb$color[tb$MRCA %in% clade@nodeList] <- sub(" .*", "", clade@color)
    }
  }
  tb[tb$MRCA != 0,]  # There is not MRCA number zero.
}

#' 2D MRCA plot
#'
#' 2D plot of the statistics extracted for each MRCA.
#'
#' @param tb A tibble produced by [`MRCAs`].
#' @param errorbars Plot the error bars?
#' @param xlim,ylim Maximal X and Y value.
#'
#' @author Charles Plessy
#'
#' @family Plotting functions
#'
#' @importFrom ggplot2 aes ggplot geom_errorbar geom_errorbarh geom_point labs
#' @importFrom ggplot2 scale_color_manual scale_x_continuous scale_y_continuous theme_minimal
#' @importFrom rlang .data
#' @importFrom stats na.omit sd
#' @export
#'
#' @examples
#' (p <- MRCAs(Halo_DF, Halo_FocalClades) |> MRCA_2D_plot() +
#'   ggplot2::labs(x="nucl. diff", y="scrambling"))
#' p + ggplot2::geom_point(
#'   data=Halo_DF,
#'   ggplot2::aes(x = percent_difference_local,
#'                y = index_avg_strandDiscord,
#'                color = focalClade))

MRCA_2D_plot <- function(tb, errorbars = FALSE, xlim = 40, ylim = 1) {
  p <- ggplot(tb, aes(x = .data$x, y = .data$y, col = .data$clade)) +
    geom_point(size=4) +
    labs(subtitle = "Average statistics for most recent common ancestors") +
    theme_minimal() +
    scale_x_continuous(limits = c(0, xlim)) +
    scale_y_continuous(limits = c(0, ylim))
  colors.tb <- tb |> group_by(.data$clade) |> summarize(clade = unique(.data$clade), color = unique(.data$color))
  colors <- colors.tb$color
  names(colors) <- colors.tb$clade
  colors <- na.omit(colors)
  p <- p + scale_color_manual(values=colors)
  if(isTRUE(errorbars)) {
    p <- p + geom_errorbar (aes( ymin = .data$y - .data$yerr
                               , ymax = .data$y + .data$yerr), width  = 0) +  # Vertical error bars
             geom_errorbarh(aes( xmin = .data$x - .data$xerr
                               , xmax = .data$x + .data$xerr), height = 0)    # Horizontal error bars
  }
  p
}
