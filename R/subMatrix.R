#' Subset a matrix with a subtree
#'
#' Given a matrix of values where the rows and column names are species names
#' that are labels in a tree, subset that matrix to the species that are
#' present in the subtree starting at a given node.
#'
#' @param tree_tibble A tree in the `tbl_tree` class of the _tidytree_ package.
#' @param m A matrix, typically the output of [`makeMatrix()`].
#' @param node The ID number of the node to base the subtree.
#' @param simplify.names Reduce the genus name to a single letter.
#'
#' @return A subset of the `m` matrix.
#'
#' @examples
#' subMatrix(Halo_Tree, Halo_PercentDiff, simpl = TRUE)
#' subMatrix(Halo_Tree, Halo_PercentDiff, 9)
#' subTree(Halo_Tree, 9) |> subMatrix(Halo_PercentDiff)
#'
#' @export

subMatrix <- function(tree_tibble, m, node = NA, simplify.names = FALSE) {
  if (! is.na(node)) tree_tibble <- subTree(tree_tibble, node)
  specNames <- tree_tibble$label |> unique() |> purrr::discard(is.na)
  m <- m[specNames,specNames]
  if (isTRUE(simplify.names)) {
    rownames(m) <- sub(rownames(m), pattern = "(.).*?_", replacement = "\\1_")
    colnames(m) <- sub(rownames(m), pattern = "(.).*?_", replacement = "\\1_")
  }
  m
}
