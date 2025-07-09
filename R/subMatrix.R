#' Subset a matrix with a subtree
#'
#' Given a matrix of values where the rows and column names are species names
#' that are labels in a tree, subset that matrix to the species that are
#' present in the subtree starting at a given node.
#'
#' @param tree A [`ConvenientTblTree`] object.
#' @param m A matrix, typically the output of [`makeMatrix()`].
#' @param clade A [`FocalClade`] object or the ID number of the node to base the
#'        subtree.  The default is `NULL` in case the input tree is already a
#'        subtree (see examples).
#' @param simplify.names Reduce the genus name to a single letter.
#'
#' @return A subset of the `m` matrix.
#'
#' @author Charles Plessy
#' @family Functions for trees
#' @family Focal clade functions
#'
#' @examples
#' # Subset with a node
#' subMatrix(Halo_Tree, Halo_PercentDiff, 9)
#'
#' # Subset with a focal clade
#' subMatrix(Halo_Tree, Halo_PercentDiff, Halo_FocalClades$Halobacterium)
#'
#' # Simplify names for more compact display
#' subMatrix(Halo_Tree, Halo_PercentDiff, simplify.names = TRUE)
#'
#' # Pipe a subsetted tree directly to the function
#' subTree(Halo_Tree, 9) |> subMatrix(Halo_PercentDiff)
#'
#' @export

subMatrix <- function(tree, m, clade = NULL, simplify.names = FALSE) {
  if (! is.null(clade)) tree <- subTree(tree, clade)
  specNames <- tree$label |> unique() |> purrr::discard(is.na)
  m <- m[specNames,specNames]
  if (isTRUE(simplify.names)) {
    rownames(m) <- sub(rownames(m), pattern = "(.).*?_", replacement = "\\1_")
    colnames(m) <- sub(rownames(m), pattern = "(.).*?_", replacement = "\\1_")
  }
  m
}
