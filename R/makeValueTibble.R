#' Make new tibble dataset with added value column from a matrix
#'
#' @param tibble Original tibble dataset to add value column to.
#' @param matrix Matrix containing values to add to tibble.
#'
#' @return New tibble with values added.
#' @export
#'
#' @examples
#' tibbleWithValue <- makeValueTibble(Tibble, valueMatrix)
makeValueTibble <- function(tibble, matrix) {
  labels <- unique(tibble$parent) |> sort() |> purrr::set_names() |> sapply(extractValues, tibble, matrix)
  tibble$value <- NA
  tibble[names(labels), "value"] <- unname(labels)
  tibble
  }
