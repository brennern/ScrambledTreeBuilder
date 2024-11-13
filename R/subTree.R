#' Extract a subtree
#'
#' Takes a tibble representing a tree, and extract a subtree at a given node.
#'
#' @param name description
#' @param node_id The ID number of the node to base the subtree.
#'
#' @importFrom tidytree as_tibble as.treedata tree_subset
#'
#' @return A subtree represented by a tibble created by the tidytree package.
#'
#' @examples
#' (subtree <- subTree(tibbleWithValue, 9))
#' visualizeTree(subtree, subtree$node.orig)
#'
#' @export

subTree <- function(tree_tibble, node) {
  tree_tibble$node.orig <- tree_tibble$node
  tree_tibble |> as.treedata() |> tree_subset(node, levels_back = 0) |> as_tibble()
}
