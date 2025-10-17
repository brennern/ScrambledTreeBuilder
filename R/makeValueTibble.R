#' Project a matrix onto a tree
#'
#' Adds a new node column data in a tree, summarising a square matrix
#' representing all the pairs between that tree's leaves by applying a function
#' to all the matrix values that relate pairs through the same node.
#'
#' @param your_tibble A [`ConvenientTblTree`] object.
#' @param your_matrix Matrix containing values to summarise in the tibble.
#' @param fun function to apply to the values
#' @param colname New column name for value being added to tibble.
#'
#' @author Noa Brenner
#' @author Charles Plessy
#'
#' @return The `your_tibble` object in which a new `colname` column was added
#' where the `your_matrix` values summarised on the tree with the `fun`
#' function, or the original `your_tibble` object if the `your_matrix` argument
#' was NULL
#'
#' @export
#'
#' @examples
#' makeValueTibble(Halo_Tree, Halo_PercentDiff, colname = "Strand_Randomisation_Index")

makeValueTibble <- function(your_tibble, your_matrix=NULL, fun = mean, colname = "value") {
  if (is.null(your_matrix)) return(your_tibble)
  labels <- unique(your_tibble$parent) |> sort() |> purrr::set_names() |> sapply(extractValues, your_tibble, your_matrix, fun)
  your_tibble[, colname] <- NA
  your_tibble[names(labels), colname] <- unname(labels)
  your_tibble
}
