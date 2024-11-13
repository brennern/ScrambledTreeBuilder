#' Extract a subtree
#'
#' Takes a tibble representing a tree, and extract a subtree at a given node.
#'
#' @param name description
#' @param node_id The ID number of the node to base the subtree.
#'
#' @importFrom tidytree offspring as_tibble as.treedata
#' @importFrom dplyr bind_rows
#'
#' @return A subtree represented by a tibble created by the tidytree package.
#'
#' @examples
#' subTree(tibbleWithValue, 9)
#'
#' @export

subTree <- function(tree_tibble, node_id) {
  tree_tibble$node.orig <- tree_tibble$node
  descendants <- tidytree::offspring(tree_tibble, .node = node_id)
  descendants_with_node <- dplyr::bind_rows(
    filter(tree_tibble, node == node_id),
    descendants) |> as.treedata() |> as_tibble() |> suppressMessages()
  descendants_with_node$label <- descendants_with_node$label.y
  descendants_with_node$label.y <-NULL
  descendants_with_node
}
