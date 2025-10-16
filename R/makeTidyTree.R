#' @include ConvenientTblTree.R
NULL

#' Make a tidy tree
#'
#' Given a distance matrix, computes a cladogram with the [`stats::hclust`]
#' function, and returns it as a [`tibble::tibble`] formatted for the `tidytree`
#' package.
#'
#' @param distMat a distance matrix
#' @param n_bootstrap Integer number of bootstrap replicates (default 0, no bootstrap).
#'
#' @return A `tbl_tree` object.  Bootstrap values will be `NA` if no boostrap is
#' done.
#'
#' @importFrom stats hclust as.dist
#'
#' @examples
#' makeTidyTree((Halo_PercentDiff/2 + t(Halo_PercentDiff)/2))
#'
#' @export

makeTidyTree <- function(distMat, n_bootstrap = 0) {
  if (! all(distMat == t(distMat)))
    warning("Input matrix is not symmetric!")
  if (n_bootstrap == 0) {
    HClust <- hclust(as.dist(distMat), method = "average")
    tree <- tidytree::as_tibble(tidytree::as.phylo(HClust))
  } else {
    bt <- residualBootstrapTree(distMat, n_bootstrap = n_bootstrap)
    tree <- tidytree::as_tibble(tidytree::as.phylo(bt$tree))
  }
  plotted_tree <- visualizeTree(tree)$data # where tree gains isTip, x, y, branch and angle columns
  tree$isTip <- plotted_tree$isTip
  tree$y     <- plotted_tree$y
  tree$bootstrap <- tree$label |> as.numeric() |> suppressWarnings() # I know I discard character values
  tree$label[!tree$isTip] <- NA
  tree
}
