#' Average results
#'
#' Most of the times we have two sets of alignment statistics for a pair of
#' genomes, where the _target_ and _query_ roles are exchanged.  Sometimes we
#' want to plot only one point per pair.  This function produces the averages.
#'
#' @param pairwise_data A results data frame produced by [`formatStats()`] (therefore)
#'        having a proper `lab` column.
#'
#' @return A tibble, even when the input is a data frame, because we use
#' _dplyr_…
#'
#' @seealso [MRCA_2D_plot()]
#'
#' @author Charles Plessy
#'
#' @importFrom dplyr across group_by summarise where
#' @export
#'
#' @examples
#' averageResults(Halo_DF)

averageResults <- function(pairwise_data) {
  p <- pairwise_data |>
    group_by(.data$lab) |>
    summarise(
      across(
        where(is.numeric),
        \(x) mean(x, na.rm = TRUE)
      ),
      MRCA       = unique(.data$MRCA),
      focalClade = unique(.data$focalClade),
      focalColor = unique(.data$focalColor),
      .groups = "drop"
  )
  p$species1 <-  sub('\n.*','', p$lab)
  p$species2 <-  sub('.*\n','', p$lab)
  p
}
