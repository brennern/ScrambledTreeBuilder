#' Children species of an ancestor
#'
#' @param tree A tree created with the `makeTidyTree()` function.
#' @param node An internal node in that tree.
#'
#' @returns A list of the label names on the left and right branch of the tree.
#'
#' @family Functions for trees
#'
#' @author Noa Brenner
#' @author Charles Plessy
#'
#' @examples
#' childSpecies(Halo_Tree, 7)
#'
#' @importFrom tidytree child offspring
#' @export

childSpecies <- function(tree, node) {
  children <- tidytree::child(tree, node)
  stopifnot(nrow(children) == 2)
  left_side_node  <- children[1, "node", drop = TRUE]
  right_side_node <- children[2, "node", drop = TRUE]
  tipLabels <- function(node, tree) {
    tipLabel <- tree[node,"label", drop = TRUE]
    if(!is.na(tipLabel)) return(tipLabel)
    tidytree::offspring(tree, node)$label |> Filter(complete.cases, x=_)
  }
  list(left  = tipLabels(left_side_node,  tree),
       right = tipLabels(right_side_node, tree))
}
