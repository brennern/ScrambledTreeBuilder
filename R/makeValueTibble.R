#' Make new tibble dataset with added value column from a matrix
#'
#' @param your_tibble Original tibble dataset to add value column to.
#' @param your_matrix Matrix containing values to add to tibble.
#'
#' @return New tibble with values added.
#' @export
#'
#' @examples
#' makeValueTibble(Tibble, valueMatrix)
makeValueTibble <- function(your_tibble, your_matrix, fun = mean) {
  labels <- unique(your_tibble$parent) |> sort() |> purrr::set_names() |> sapply(extractValues, your_tibble, your_matrix, fun)
  your_tibble$value <- NA
  your_tibble[names(labels), "value"] <- unname(labels)
  your_tibble
}
