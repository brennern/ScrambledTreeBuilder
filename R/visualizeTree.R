#' Create a phylogenetic tree using tibble data.
#'
#' @param your_tibble Tibble data containing species genome information.
#' @param value Tibble value to label on internal nodes of the tree.
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
visualizeTree <- function(your_tibble, value=your_tibble$node, valueround = 2, outerlabelsize = 0.25, innerlabelsize = 3, ynudge = 0, xnudge = 0) {
  ggtree::ggtree(tidytree::as.treedata(your_tibble)) +
  ggtree::geom_tiplab(as_ylab=TRUE) +
  ggtree::geom_label(ggtree::aes(label=round(value, digits = valueround), color = value), label.size = outerlabelsize,
                     size = innerlabelsize, na.rm = TRUE, label.padding = ggtree::unit(0.15, "lines"),
                     nudge_y = ynudge, nudge_x = xnudge)
}
