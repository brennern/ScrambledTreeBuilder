#' @include FocalClade.R
#' @include ConvenientTblTree.R
NULL

#'
#' Run `eog` on a plot for a clade
#'
#' Prepare a shell command to run the Eye of Gnome image viewer on a subset
#' of alignment pairwise plots comparing genomes from the same clade.
#'
#' @param tree A tree created with the `makeTidyTree()` function.
#' @param node The ID number of the node to base the subtree, or a `FocalClade`
#'        object.
#' @param target A pattern to restrict the files to share the same target genome.
#'
#' @author Charles Plessy
#'
#' @family Shell helper functions
#' @family Focal clade functions
#'
#' @examples
#' eog(Halo_Tree, 10)
#' eog(Halo_Tree, 10, target = "nori")
#' eog(Halo_Tree, Halo_FocalClades$Haloferax)
#'
#' @export

eog <- new_generic("eog", dispatch_args = c("tree", "node"), function (tree, node, target=NULL) S7_dispatch())

method(eog, list(ConvenientTblTree, class_numeric)) <- function(tree, node, target=NULL) {
  # Collect IDs belonging to that clade.
    IDs  <- as.vector(subTree(tree, node)$label |> na.omit())
  # Create a brace expansion with these IDs.
  brace_exp <- brace_exp2 <- paste0('{',paste0(IDs, collapse=','),'}')
  # Optionally restrict to a target species matching a pattern
  if (!is.null(target)) {
    targetIDs <- tree$label |> na.omit() |> grep(pat=target, val = TRUE)
    if (length(targetIDs) == 0) stop ("Target pattern does not match")
    if (length(targetIDs) == 1) {
      brace_exp <- targetIDs
    } else {
      brace_exp <- paste0('{',paste0(targetIDs, collapse=','),'}')
    }
  }
  # Call eog with a path with brace expansions matching pairwise plots for the clade.
  paste0("eog results_",brace_exp,"/alignment/",brace_exp,"___",brace_exp2,".o2o_plt.png")
}

method(eog, list(ConvenientTblTree, FocalClade)) <- function(tree, node, target=NULL)
  eog(tree = tree, node = node@nodeID, target = target)
