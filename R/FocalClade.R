#' @include subTree.R
#' @include ConvenientTblTree.R

FocalClade <- S7::new_class("FocalClade", properties = list(
  nodeID      = class_numeric,
  nodeList    = class_numeric,
  genomeIDs   = class_character,
  displayName = class_character,
  color       = class_character
))

method(print, FocalClade) <- function(x, ...) {
  cat(paste0(x@displayName, ", node ID: ", x@nodeID, ", number of genomes: ", length(x@genomeIDs), "\n"))
}

#' List of focal clades
#'
#' Class wrapping the base `list` class and containing `FocalClade` objects.
#' Used for highlighting clades in tree plots.
#'
#' @param ... List elements passed to the constructor.
#'
#' @author Charles Plessy
#'
#' @import S7
#'
#' @export

FocalCladeList <- new_class("FocalCladeList", parent = class_list, constructor = \(...) new_object(list(...)))

method(print, FocalCladeList) <- function(x, ...) {
  for (i in x)
    print(i)
}

#' Focal clades (焦点系統群)
#'
#' Clades of interest to be plotted in color
#'
#' @param Tibble A [`ConvenientTblTree`] object.
#' @param left,right Leaf labels whose most common recent ancestor will define
#'        the clade
#' @param color Color of the clade in plots
#' @param displayName Display name of the clade (can contain spaces)
#'
#' @importFrom treeio MRCA
#'
#' @family Focal clade functions
#'
#' @author Charles Plessy
#'
#' @aliases FocalClade
#'
#' @export
#'
#' @examples
#' (Halobacterium <- focalClade(Halo_Tree,
#'   "Halobacterium_noricense", "Halobacterium_salinarum", "blue", "Halobacterium genus"))
#' (Haloferax <- focalClade(Halo_Tree,
#'   "Haloferax_mediterranei", "Haloferax_volcanii", "green3", "Haloferax genus"))
#' (clades <- FocalCladeList(Halobacterium, Haloferax))
#' visualizeTree(Halo_Tree) + clades

focalClade <- function(Tibble, left, right, color, displayName) {
  left   <- grep(left,  Tibble$label)
  right  <- grep(right, Tibble$label)
  nodeID <- MRCA(Tibble, c(left, right))$node
  FocalClade(
    nodeID       = nodeID,
    color       = color,
    displayName = displayName,
    genomeIDs   = subTree(Tibble, nodeID) $ label     |> purrr::discard(is.na) |> suppressMessages(),
    nodeList    = subTree(Tibble, nodeID) $ node.orig |> purrr::discard(is.na) |> suppressMessages()
  )
}

method(subTree, list(ConvenientTblTree, FocalClade)) <- function(tree_tibble, node)
  subTree(tree_tibble, node@nodeID)

PlottedTree <- new_S3_class("ggtree")

highlight <- new_generic("highlight", c("ggtree", "clade"))

method(highlight, list(PlottedTree, FocalClade)) <- function(ggtree, clade) {
  ggtree + ggtree::geom_hilight(node = clade@nodeID, fill = clade@color, alpha = .4, type = "gradient", gradient.direction = 'tr', to.bottom = TRUE)
}

# Highlight all clades of a list.
method(highlight, list(PlottedTree, FocalCladeList)) <- function(ggtree, clade) {
  Reduce(\(g, cl) highlight(g, cl), clade, init = ggtree)
}

method(`+`, list(PlottedTree, FocalClade))     <- function(e1, e2) highlight(e1, e2)
method(`+`, list(PlottedTree, FocalCladeList)) <- function(e1, e2) highlight(e1, e2)
