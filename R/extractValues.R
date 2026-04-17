#' Extract values from a matrix.
#'
#' @param node Node
#' @param your_tibble Tibble data developed from tree.
#' @param pairwise_matrix Matrix containing species data.
#' @param fun Calculates mean, median, etc. between node values to plot on the tree (default fun is mean)
#'
#' @return Values to store in a variable (percent difference, scrambling index, etc.)
#'
#' @family Functions for trees
#'
#' @importFrom stats complete.cases
#'
#' @export
#'
#' @examples
#' unique(Halo_Tree$parent) |> sort() |>
#'   purrr::set_names() |> sapply(extractValues, Halo_Tree, Halo_PercentDiff)

extractValues <- function(node, your_tibble, pairwise_matrix, fun = mean) {
  children <- childSpecies(your_tibble, node)
  comparison <- pairwise_matrix[children$left, children$right, drop=F]
  value <- fun(comparison)
}
