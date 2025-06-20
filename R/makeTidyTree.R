#' @include ConvenientTblTree.R
NULL

#' Make a tidy tree
#'
#' Given a distance matrix, computes a cladogram with the [`stats::hclust`]
#' function, and returns it as a [`tibble::tibble`] formatted for the `tidytree`
#' package.
#'
#' @param distMat a distance matrix
#'
#' @return A `tbl_tree` object
#'
#' @importFrom stats hclust as.dist
#'
#' @examples
#' makeTidyTree((Halo_PercentDiff/2 + t(Halo_PercentDiff)/2))
#'
#' @export

makeTidyTree <- function(distMat) {
  if (! identical(distMat, t(distMat)))
    warning("Input matrix is not symmetric!")
  HClust <- hclust(as.dist(distMat), method = "average")
  tree <- tidytree::as_tibble(tidytree::as.phylo(HClust))
  plotted_tree <- visualizeTree(tree)$data # where tree gains isTip, x, y, branch and angle columns
  tree$isTip <- plotted_tree$isTip
  tree$y     <- plotted_tree$y
  tree
}
