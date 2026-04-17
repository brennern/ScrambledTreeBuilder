#' Record ancestor node ID of a pair
#'
#' Given a tree and a results data frame, add a new `MRCA` column that records
#' the node ID of the most recent common ancestor in that tree for each row.
#'
#' @param pairwise_data A results data frame created with the `extractValues()` function
#' @param tree A tree created with the `makeTidyTree()` function.
#'
#' @returns The `pairwise_data` data frame with a new `MRCA` column.
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

recordAncestor <- function (pairwise_data, tree) {
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
  m <- match(rownames(pairwise_data), x$speciesPair)
  pairwise_data$MRCA <- x$Var1[m]
  pairwise_data$MRCA[is.na(pairwise_data$MRCA)] <- 0
  pairwise_data
}

#' Record clade metadata in results table
#'
#' Add clade information to tables, for quality checks and use in some plots.
#'
#' @note As MRCA information is needed; the function will run [`recordAncestor()`]
#' when it did not find it.
#'
#' @param pairwise_data A results data frame created with the `extractValues()` function.
#' @param clades A [`FocalCladeList`] object.
#'
#' @return Returns the table, plus a `customClade` column if it was a taxon
#' table, or a `focalClade` and `focalColor` columns if it was a results table.
#'
#' @family Focal clade functions
#'
#' @author Charles Plessy
#'
#' @export
#'
#' @examples
#' recordClades(Halo_DF, Halo_FocalClades)

recordClades <- function(pairwise_data, clades) {
  # It is a taxon table (one genome per line) if it has a Binomial column.
  if(! is.null(pairwise_data$Binomial)) {
    for (n in seq_along(clades)) {
      pairwise_data[clades[[n]]@genomeIDs, "customClade"]          <- clades[[n]]@displayName
    }
    return(pairwise_data)
  }

  # Otherwise it is a results table (one pair per line)
  if (is.null(pairwise_data$MRCA))
    pairwise_data <- recordAncestor(pairwise_data, clades)
  for (n in seq_along(clades)) {
    pairwise_data[pairwise_data$MRCA %in% clades[[n]]@nodeList, "focalClade"] <- clades[[n]]@displayName
    pairwise_data[pairwise_data$MRCA %in% clades[[n]]@nodeList, "focalColor"] <- clades[[n]]@color
  }
  pairwise_data
}
