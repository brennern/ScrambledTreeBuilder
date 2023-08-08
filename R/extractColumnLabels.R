#' Extract labels from a dataframe column
#'
#' @param node
#' @param dataframe Dataframe containing species data.
#' @param column The variable from the data frame you want to extract species data from.
#' @param fun Calculates mean, median, etc. between nodes on the tree (default fun is mean)
#'
#' @return Scores to store in a variable (percent identity, strand randomisation index, etc.)
#' @export
#'
#' @examples
#' Clust <- hclust(dist(exMatrix), method = "complete")
#' tibble <- tidytree::as_tibble(tidytree::as.phylo(HClust))
#' extractColumnLabel(node = 5, tibble, exDataFrame, "percent_identity_global")
extractColumnLabel <- function(node, tibble, dataframe, column, fun = mean) {
  matrix <- makeMatrix(dataframe, column)
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
  fun(comparison)
}
