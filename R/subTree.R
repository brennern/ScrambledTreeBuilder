#' Extract a subtree
#'
#' Takes a tibble representing a tree, and extracts a subtree at a given node.
#'
#' @param name A tree in the `tbl_tree` class of the _tidytree_ package.
#' @param node The ID number of the node to base the subtree.
#'
#' @importFrom tidytree as_tibble as.treedata tree_subset
#'
#' @return A subtree represented in the `tbl_tree` class of the _tidytree_
#' package.  This tibble has an extra `node.orig` column providing the old node
#' IDs, because the node IDs in the object are renamed during the extraction
#' of the subtree.
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
