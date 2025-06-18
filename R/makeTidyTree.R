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
#' @export

makeTidyTree <- function(distMat) {
  if (! identical(distMat, t(distMat)))
    warning("Input matrix is not symmetric!")
  HClust <- hclust(as.dist(distMat), method = "average")
  tidytree::as_tibble(tidytree::as.phylo(HClust))
}

ScrambledTree <- new_S3_class("tbl_tree")
