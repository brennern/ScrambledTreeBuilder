#' Convenient tbl_trees
#'
#' Wrapper S7 class for the `tbl_tree` class of the `tidytree` package.
#'
#' _Convenient tbl_tree_ objects are typically constructed with the
#' [`makeTidyTree()`] function.  In addition to usual `tbl_tree` objects, they
#' also have a `isTip` column (boolean) and a `y` column that indicates the
#' order in which the nodes would be plotted.  This is needed by the
#' [`orderWithTree()`] function that helps making heatmaps sorted in the same way.
#'
#' @author Charles Plessy

ConvenientTblTree <- new_S3_class("tbl_tree")

labelOrder <- new_generic("labelOrder", "tree")

method(labelOrder, ConvenientTblTree) <- function (tree) {
  treeTips <- tidytree::as_tibble(tree)[tree$isTip,]
  treeTips <- treeTips[order(treeTips$label),]        # Is this one really needed?
  order(treeTips$y, decreasing = TRUE)
}

#' Order a comparison matrix
#'
#' Re-order a comparison matrix according to the leaves of a plotted tree,
#' to ease figure production
#'
#' @param m A matrix produced with [`makeMatrix()`].
#' @param tree A [`ConvenientTblTree`] object.
#'
#' @returns The `m` matrix, sorted like the leaves of `tree`.
#'
#' @examples
#' orderWithTree(Halo_PercentDiff, Halo_Tree)
#'
#' @author Charles Plessy
#'
#' @export

orderWithTree <- new_generic("orderWithTree", c("m", "tree"), function (m, tree) S7_dispatch()) # Needed so that `...` is not a parameter

method(orderWithTree, list(class_any, ConvenientTblTree)) <- function (m, tree) {
  o <- labelOrder(tree)
  m[o,o]
}

