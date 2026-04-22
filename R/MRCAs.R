#' Most recent common ancestors
#'
#' Summarise statistics for MRCAs
#'
#' @param pairwise_data A results data frame produced by [`formatStats()`], with MRCAs
#'        annotated with [`recordAncestor()`].
#' @param clades A [`FocalCladeList`] object.
#' @param dim1,dim2 the name of the pairwise statistics to summarise.
#' @param center,dispersion Functions to compute a representation of the
#'        central tendency and the dispersion of the values for each MRCA.
#' @param mrca_label Label type to add to each MRCA row. Currently only
#'        `"representative_pair"` is supported, which adds a column
#'        showing the species pair with the highest value of `dim2` for
#'        each MRCA. Set to `NULL` to skip.
#'
#' @author Charles Plessy
#'
#' @returns A tibble ([tibble::tbl_df-class]) ready for [`MRCA_2D_plot`].
#'         When `mrca_label` is set, includes a `mrca_label` column.
#'
#' @importFrom dplyr group_by summarize sym ungroup filter transmute slice_max left_join mutate
#' @importFrom tidyselect all_of
#' @export
#'
#' @examples
#' MRCAs(Halo_DF, Halo_FocalClades)
#' MRCAs(Halo_DF, Halo_FocalClades, mrca_label = "representative_pair")

MRCAs <- function(pairwise_data, clades = NULL, dim1 = "percent_difference_local", dim2 = "index_avg_strandDiscord", center = mean, dispersion = sd, mrca_label = NULL) {

  # TODO: Use stbPairwiseData S7 class for validation (see issue #XXX)
  stopifnot("MRCA" %in% names(pairwise_data))

  tb <- pairwise_data |>
    group_by(.data$MRCA) |>
    summarize(
      x    = center(     !!sym(dim1), na.rm = TRUE),
      y    = center(     !!sym(dim2), na.rm = TRUE),
      xerr = dispersion( !!sym(dim1), na.rm = TRUE),
      yerr = dispersion( !!sym(dim2), na.rm = TRUE),
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

  if (!is.null(mrca_label)) {
    stopifnot(mrca_label == "representative_pair")
    stopifnot(dim2 %in% names(pairwise_data))
    stopifnot("species1" %in% names(pairwise_data))
    stopifnot("species2" %in% names(pairwise_data))

    rep_lut <- pairwise_data |>
      filter(!is.na(.data$MRCA),
             !is.na(.data[[dim2]]),
             !is.na(.data$species1),
             !is.na(.data$species2)) |>
      group_by(.data$MRCA) |>
      slice_max(order_by = .data[[dim2]], n = 1, with_ties = FALSE) |>
      ungroup() |>
      transmute(
        MRCA = .data$MRCA,
        mrca_label = paste0(.data$species1, " vs ", .data$species2)
      )

    tb <- tb |> left_join(rep_lut, by = "MRCA")
  }

  tb[tb$MRCA != 0,]
}

#' 2D MRCA plot
#'
#' 2D plot of the statistics extracted for each MRCA.  Can accept either a
#' tibble produced by [`MRCAs()`], or pairwise data and clades to run MRCAs()
#' internally.
#'
#' @param tb Either a tibble produced by [`MRCAs()`], or a pairwise data
#'        frame (detected by checking for the `MRCA` column).
#' @param clades A [`FocalCladeList`] object.  Required if `tb` is pairwise data.
#' @param dim1,dim2 Column names for the statistics to plot.  Only used if running MRCAs internally.
#' @param mrca_label Label type to add (passed to [`MRCAs()`]).  Only used if running
#'        MRCAs internally.
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
#' MRCA_2D_plot(Halo_DF, Halo_FocalClades, mrca_label = "representative_pair")

MRCA_2D_plot <- function(tb, clades = NULL, dim1 = "percent_difference_local", dim2 = "index_avg_strandDiscord", mrca_label = NULL, errorbars = FALSE, xlim = 40, ylim = 1) {

  # Detect whether tb is pairwise data (needs MRCAs) or output of MRCAs (has x, y columns)
  if ("x" %in% names(tb) && "y" %in% names(tb)) {
    # Already summarized - use directly
    plot_data <- tb
  } else if ("MRCA" %in% names(tb)) {
    # Pairwise data - run MRCAs internally
    plot_data <- MRCAs(tb, clades = clades, dim1 = dim1, dim2 = dim2, mrca_label = mrca_label)
  } else {
    stop("tb must be either pairwise data (with MRCA column) or output of MRCAs (with x, y columns)")
  }

  p <- ggplot(plot_data, aes(x = .data$x, y = .data$y, col = .data$clade)) +
    geom_point(size=4) +
    labs(subtitle = "Average statistics for most recent common ancestors") +
    theme_minimal() +
    scale_x_continuous(limits = c(0, xlim)) +
    scale_y_continuous(limits = c(0, ylim))
  colors.tb <- plot_data |> group_by(.data$clade) |> summarize(clade = unique(.data$clade), color = unique(.data$color))
  colors <- colors.tb$color
  names(colors) <- colors.tb$clade
  colors <- na.omit(colors)
  p <- p + scale_color_manual(values=colors)
  if(isTRUE(errorbars)) {
    p <- p + geom_errorbar (aes( ymin = .data$y - .data$yerr
                               , ymax = .data$y + .data$yerr), width  = 0) +
             geom_errorbarh(aes( xmin = .data$x - .data$xerr
                               , xmax = .data$x + .data$xerr), height = 0)
  }
  p
}

#' Interactive MRCA plot with plotly
#'
#' Convert an MRCA plot to an interactive plotly object.  If the plot was
#' created with `mrca_label` information, adds hover tooltips showing the
#' label for each MRCA point.
#'
#' @param p A ggplot produced by [`MRCA_2D_plot`].
#' @param pairwise_data Optional pairwise data to overlay as individual points.
#'        When provided, adds a second layer of points with hover text
#'        showing the species pair.
#' @param tooltip Which aesthetics to show in the hover tooltip.  Default shows
#'        MRCA, clade, x, y, and n.  Set to `"all"` to also include
#'        `mrca_label` if available.
#' @param hovermode Hover mode passed to `plotly::layout()`.
#'
#' @return A `plotly` object.
#'
#' @author Charles Plessy
#'
#' @family Plotting functions
#'
#' @importFrom plotly ggplotly layout
#' @importFrom rlang .data
#' @export
#'
#' @examples
#' MRCA_2D_plot(Halo_DF, Halo_FocalClades) |> MRCA_plotly()
#' MRCA_2D_plot(Halo_DF, Halo_FocalClades, mrca_label = "representative_pair") |>
#'   MRCA_plotly(tooltip = "all")
#' MRCA_2D_plot(Halo_DF, Halo_FocalClades) |>
#'   MRCA_plotly(pairwise_data = Halo_DF)

MRCA_plotly <- function(p, pairwise_data = NULL, tooltip = NULL, hovermode = "closest") {

  # Extract data from the plot
  plot_data <- p$data

  # Build hover text for MRCA points
  if ("mrca_label" %in% names(plot_data) && (is.null(tooltip) || tooltip == "all")) {
    plot_data <- plot_data |>
      mutate(
        hover_text = paste0(
          "MRCA: ", .data$MRCA,
          "<br>Clade: ", .data$clade,
          "<br>x: ", round(.data$x, 3),
          "<br>y: ", round(.data$y, 3),
          "<br>n: ", .data$n,
          if ("xerr" %in% names(.data)) paste0("<br>xerr: ", round(.data$xerr, 3)) else "",
          if ("yerr" %in% names(.data)) paste0("<br>yerr: ", round(.data$yerr, 3)) else "",
          if ("mrca_label" %in% names(.data)) paste0("<br>Representative: ", .data$mrca_label) else ""
        )
      )
  } else {
    plot_data <- plot_data |>
      mutate(
        hover_text = paste0(
          "MRCA: ", .data$MRCA,
          "<br>Clade: ", .data$clade,
          "<br>x: ", round(.data$x, 3),
          "<br>y: ", round(.data$y, 3),
          "<br>n: ", .data$n,
          if ("xerr" %in% names(.data)) paste0("<br>xerr: ", round(.data$xerr, 3)) else "",
          if ("yerr" %in% names(.data)) paste0("<br>yerr: ", round(.data$yerr, 3)) else ""
        )
      )
  }

  p_hover <- p + geom_point(
    data = plot_data,
    aes(x = .data$x, y = .data$y, text = .data$hover_text),
    inherit.aes = FALSE,
    alpha = 0
  )

  # Add overlay of pairwise data if provided
  if (!is.null(pairwise_data)) {
    # Get dim1 and dim2 column names from the plot data (inferred from x and y)
    # We need to find the original column names - check if dim1/dim2 were stored or guess
    overlay_data <- pairwise_data |>
      mutate(
        hover_text = paste0(
          "Pair: ", .data$species1, " vs ", .data$species2,
          "<br>x: ", round(.data$percent_difference_local, 3),
          "<br>y: ", round(.data$index_avg_strandDiscord, 3),
          if ("focalClade" %in% names(.data)) paste0("<br>Clade: ", .data$focalClade) else ""
        ),
        clade = if ("focalClade" %in% names(.data)) .data$focalClade else "Other"
      )

    p_hover <- p_hover + geom_point(
      data = overlay_data,
      aes(x = .data$percent_difference_local,
          y = .data$index_avg_strandDiscord,
          text = .data$hover_text,
          color = .data$clade),
      inherit.aes = FALSE,
      alpha = 0.3,
      size = 2
    )
  }

  plotly_obj <- ggplotly(p_hover, tooltip = "text") |>
    layout(hovermode = hovermode)

  plotly_obj
}
