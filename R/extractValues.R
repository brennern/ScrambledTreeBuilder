#' Extract values from a matrix.
#'
#' @param node Node
#' @param your_tibble Tibble data developed from tree.
#' @param your_matrix Matrix containing species data.
#' @param fun Calculates mean, median, etc. between node values to plot on the tree (default fun is mean)
#'
#' @return Values to store in a variable (percent identity, strand randomisation index, etc.)
#' @export
#'
#' @examples
#' unique(Tibble$parent) |> sort() |> purrr::set_names() |> sapply(extractValues, Tibble, valueMatrix)
extractValues <- function(node, your_tibble, your_matrix, fun = mean) {
  children <- tidytree::child(your_tibble, node)
  stopifnot(nrow(children) == 2)
  left_side_node  <- children[1, "node", drop = TRUE]
  right_side_node <- children[2, "node", drop = TRUE]
  tipLabels <- function(node, your_tibble) {
    tipLabel <- your_tibble[node,"label", drop = TRUE]
    if(!is.na(tipLabel)) return(tipLabel)
    tidytree::offspring(your_tibble, node)$label |> Filter(complete.cases, x=_)
  }
  left_side_species  <- tipLabels(left_side_node, your_tibble)
  right_side_species <- tipLabels(right_side_node, your_tibble)
  comparison <- your_matrix[left_side_species, right_side_species, drop=F]
  value <- fun(comparison)
}

