#' Species trees
#'
#' Wrapper S7 class for the `tbl_tree` class of the `tidytree` package.
#'
#' _stbTree_ objects are typically constructed with the
#' [`makeTidyTree()`] function.  In addition to usual `tbl_tree` objects, they
#' also have a `isTip` column (boolean) and a `y` column that indicates the
#' order in which the nodes would be plotted.  This is needed by the
#' [`orderWithTree()`] function that helps making heatmaps sorted in the same way.
#' The tips of the tree represent species, and internal nodes store pairwise
#' information (single pairs or aggregate data).
#'
#' @author Charles Plessy

stbTree <- new_S3_class("tbl_tree")

labelOrder <- new_generic("labelOrder", "species_tree")

method(labelOrder, stbTree) <- function (species_tree) {
  treeTips <- tidytree::as_tibble(species_tree)[species_tree$isTip,]
  order(treeTips$y, decreasing = TRUE)
}

labelOrderedNames <- new_generic("labelOrderedNames", "species_tree")

method(labelOrderedNames, stbTree) <- function (species_tree) {
  o <- labelOrder(species_tree)
  species_tree$label[o]
}

#' Order a comparison matrix
#'
#' Re-order a comparison matrix according to the leaves of a plotted tree,
#' to ease figure production
#'
#' @param pairwise_matrix A matrix produced with [`makeMatrix()`].
#' @param species_tree A [`stbTree`] object.
#'
#' @returns The `pairwise_matrix` matrix, sorted like the leaves of `species_tree`.
#'
#' @examples
#' orderWithTree(Halo_PercentDiff, Halo_Tree)
#'
#' @author Charles Plessy
#'
#' @export

orderWithTree <- new_generic("orderWithTree", c("pairwise_matrix", "species_tree"), function (pairwise_matrix, species_tree) S7_dispatch())

method(orderWithTree, list(class_any, stbTree)) <- function (pairwise_matrix, species_tree) {
  o <- labelOrderedNames(species_tree)
  pairwise_matrix[o,o]
}