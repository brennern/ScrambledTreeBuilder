#' Create a phylogenetic tree using tibble data.
#'
#' @param your_tibble Tibble data containing species genome information.
#'
#' @return A phylogenetic tree showcasing phylogeny of species and additional calculated values.
#' @export
#'
#' @examples
#' Tree <- visualizeTree(your_tibble = tibbleWithValue)
visualizeTree <- function(your_tibble, value, valueround = 2, outerlabelsize = 0.25, innerlabelsize = 3, ynudge = 0, xnudge = 0) {
  ggtree::ggtree(tidytree::as.treedata(your_tibble)) +
  ggtree::geom_tiplab(as_ylab=TRUE) +
  ggtree::geom_label(ggtree::aes(label=round(value, digits = valueround), color = value), label.size = outerlabelsize,
                     size = innerlabelsize, na.rm = TRUE, label.padding = ggtree::unit(0.15, "lines"),
                     nudge_y = ynudge, nudge_x = xnudge)
}
