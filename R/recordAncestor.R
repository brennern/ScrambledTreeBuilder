#' Record ancestor node ID of a pair
#'
#' Given a tree and a results data frame, add a new `MRCA` column that records
#' the node ID of the most recent common ancestor in that tree for each row.
#'
#' @param df A results data frame created with the `extractValues()` function
#' @param tree A tree created with the `makeTidyTree()` function.
#'
#' @returns The `df` data frame with a new `MRCA` column.
#'
#' @family Functions for trees
#' @family Focal clade functions
#'
#' @author Noa Brenner
#' @author Charles Plessy
#'
#' @examples
#' recordAncestor(Halo_DF, Halo_Tree)$MRCA
#'
#' @importFrom tidytree child offspring
#' @export

recordAncestor <- function (df, tree) {
  # First, lets make a lookup table associating species pairs and MRCAs
  listSpeciesPairs <- function (node, tree) {
    children <- childSpecies(tree, node)
    rbind( expand.grid(node, children$left,  children$right),
           expand.grid(node, children$right, children$left))
  }
  parent_nodes <- sort(unique(tree$parent))
  names(parent_nodes) <- parent_nodes
  x <- lapply(parent_nodes,  listSpeciesPairs, tree) |> do.call(what=rbind)
  x$speciesPair <- paste(x$Var2, x$Var3, sep = '___')
  # Then, let's transfer node IDs from the lookup table to the results dataframe.
  m <- match(rownames(df), x$speciesPair)
  df$MRCA <- x$Var1[m]
  df$MRCA[is.na(df$MRCA)] <- 0
  df
}

#' Record clade metadata in results table
#'
#' Add new `focalClade` and `focalColor` columns to a results table, for use
#' in some plots.
#'
#' @note As MRCA information is needed; the function will run [`recordAncestor()`]
#' when it did not find it.
#'
#' @param df A results data frame created with the `extractValues()` function.
#' @param clades A [`FocalCladeList`] object.
#'
#' @family Focal clade functions
#'
#' @author Charles Plessy
#'
#' @export
#'
#' @examples
#' recordClades(Halo_DF, Halo_FocalClades)

recordClades <- function(df, clades) {
  if (is.null(df$MRCA))
    df <- recordAncestor(df, clades)
  for (n in seq_along(clades)) {
    df[df$MRCA %in% clades[[n]]@nodeList, "focalClade"] <- clades[[n]]@displayName
    df[df$MRCA %in% clades[[n]]@nodeList, "focalColor"] <- clades[[n]]@color
  }
  df
}
