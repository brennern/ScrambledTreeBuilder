#' Create a phylogenetic tree using tibble data.
#'
#' @param tibble Tibble data containing species genome information.
#'
#' @return A phylogenetic tree showcasing phylogeny of species and additional calculated values.
#' @export
#'
#' @examples
#' Tree <- visualizeTree(tibbleWithValue)
visualizeTree <- function(tibble, value) {
  ggtree::ggtree(tidytree::as.treedata(tibble)) +
    ggtree::geom_tiplab(as_ylab=TRUE) +
    ggtree::geom_label(ggtree::aes(label=round(value, digit = 2), color = value), label.size = 0.25, size = 2, na.rm = TRUE, label.padding = ggtree::unit(0.15, "lines")) +
    viridis::scale_color_viridis()
}
