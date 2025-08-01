#' Make new tibble dataset with added value column from a matrix
#'
#' @param your_tibble Original tibble dataset to add value column to.
#' @param your_matrix Matrix containing values to add to tibble.
#' @param fun Default set to mean.
#' @param colname New column name for value being added to tibble (defaut set to "value").
#'
#' @return New tibble with values added.
#' @export
#'
#' @examples
#' makeValueTibble(Halo_Tree, Halo_PercentDiff, colname = "Strand_Randomisation_Index")
makeValueTibble <- function(your_tibble, your_matrix, fun = mean, colname = "value") {
  labels <- unique(your_tibble$parent) |> sort() |> purrr::set_names() |> sapply(extractValues, your_tibble, your_matrix, fun)
  your_tibble[, colname] <- NA
  your_tibble[names(labels), colname] <- unname(labels)
  your_tibble
}
