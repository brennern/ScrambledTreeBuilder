#' Create a phylogenetic tree using tibble data.
#'
#' @param your_tibble Tibble data containing species genome information.
#'
#' @return A phylogenetic tree showcasing phylogeny of species and additional calculated values.
#' @export
#'
#' @examples
#' Tree <- visualizeTree(your_tibble = tibbleWithValue)
visualizeTree <- function(your_tibble, value) {
  ggtree::ggtree(tidytree::as.treedata(your_tibble)) +
    ggtree::geom_tiplab(as_ylab=TRUE) +
    ggtree::geom_label(ggtree::aes(label=round(value, digits = 2), color = value), label.size = 0.25, size = 3.5, na.rm = TRUE, label.padding = ggtree::unit(0.15, "lines"))
}
