#' Create a phylogenetic tree using tibble data.
#'
#' @param your_tibble Tibble data containing species genome information.
#' @param value Tibble value to label on internal nodes of the tree, or name
#'        of a column in the tree object.
#' @param valueround Number of integers to round value.
#' @param outerlabelsize Size of label border.
#' @param innerlabelsize Overall size of label.
#' @param ynudge Adjust vertical position of labels.
#' @param xnudge Adjust horizontal position of labels.
#'
#' @return A phylogenetic tree showcasing phylogeny of species and additional calculated values.
#' @export
#'
#' @examples
#' visualizeTree(tibbleWithValue)
#' visualizeTree(tibbleWithValue, value = tibbleWithValue$Strand_Randomisation_Index)
#' visualizeTree(tibbleWithValue, "Strand_Randomisation_Index")

visualizeTree <- function(your_tibble, value="node", valueround = 2, outerlabelsize = 0.25, innerlabelsize = 3, ynudge = 0, xnudge = 0) {
  if (length(value == 1) && is.character(value))
    value <- your_tibble[ , value, drop = TRUE]
  ggtree::ggtree(tidytree::as.treedata(your_tibble)) +
  ggtree::geom_tiplab(as_ylab=TRUE) +
  ggtree::geom_label(ggtree::aes(label=round(value, digits = valueround), color = value), label.size = outerlabelsize,
                     size = innerlabelsize, na.rm = TRUE, label.padding = ggtree::unit(0.15, "lines"),
                     nudge_y = ynudge, nudge_x = xnudge)
}
