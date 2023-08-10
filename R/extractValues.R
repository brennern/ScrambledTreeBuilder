#' Extract values from a matrix
#'
#' @param node
#' @param tibble Tibble data developed from tree.
#' @param matrix Matrix containing species data.
#' @param fun Calculates mean, median, etc. between node values to plot on the tree (default fun is mean)
#'
#' @return Values to store in a variable (percent identity, strand randomisation index, etc.)
#' @export
#'
#' @examples
#'
#' extractValues(node = 5, tibble, exMatrix)
extractValues <- function(node, tibble, matrix, fun = mean) {
  children <- tidytree::child(tibble, node)
  stopifnot(nrow(children) == 2)
  left_side_node  <- children[1, "node", drop = TRUE]
  right_side_node <- children[2, "node", drop = TRUE]
  tipLabels <- function(node, tibble) {
    tipLabel <- tibble[node,"label", drop = TRUE]
    if(!is.na(tipLabel)) return(tipLabel)
    tidytree::offspring(tibble, node)$label |> Filter(complete.cases, x=_)
  }
  left_side_species  <- tipLabels(left_side_node,  tibble)
  right_side_species <- tipLabels(right_side_node, tibble)
  comparison <- matrix[left_side_species, right_side_species, drop=F]
  value <- fun(comparison)
}

