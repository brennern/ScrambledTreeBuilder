#' Clustered heatmap
#'
#' Takes a matrix, a tree, and optionally some focal clades to plot a heatmap
#' clustered with that tree. Obviously, the tree and the matrix need to be
#' related.
#'
#' @param mat a matrix with numerical values.
#' @param tree A [`ConvenientTblTree`] object.
#' @param clades A [`FocalCladeList`] object.
#'
#' @param ... Extra arguments passed to [`pheatmap::pheatmap()`]
#'
#' @return A `pheatmap` object.
#'
#' @family Plotting functions
#'
#' @author Charles Plessy
#'
#' @importFrom pheatmap pheatmap
#'
#' @examples
#' treeHeatMap(Halo_PercentDiff)
#' treeHeatMap(Halo_PercentDiff, Halo_Tree)
#' treeHeatMap(Halo_PercentDiff, Halo_Tree, Halo_FocalClades)
#'
#' @export

treeHeatMap <- function(mat, tree=NULL, clades=NULL, ...) {

  if(!is.null(tree)) mat <- orderWithTree(mat, tree)

  if(!is.null(clades)) {
    # Prepare an annotation data frame for pheatmap()
    annot <- data.frame(row.names = rownames(mat))
    for (clade in names(clades)) {
      annot[clades[[clade]]@genomeIDs, "clade"] <- clades[[clade]]@displayName
      annot[clades[[clade]]@genomeIDs, "color"] <- clades[[clade]]@color
    }
    annot <- annot[order(annot$clade), ]

    # Prepare color list for pheatmap()
    color_annot <- unique(annot[, c("clade", "color")]) |> na.omit()
    color_list <- list(clade = color_annot$color)
    names(color_list$clade) <- color_annot$clade
  } else {
    return(
      pheatmap( mat,
        cluster_rows = FALSE,
        cluster_cols = FALSE,
        show_colnames = FALSE,
        ...
      )
    )
  }

  # Plot the heatmap
  pheatmap(
    mat,
    cluster_rows = FALSE,
    cluster_cols = FALSE,
    annotation_row    = annot[,"clade", drop = FALSE],
    annotation_colors = color_list,
    show_colnames = FALSE,
    ...
  )
}
