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
  ggtree(as.treedata(tibble)) +
    geom_tiplab(as_ylab=TRUE) +
    geom_label(aes(label=round(value, digit = 2), color = value), label.size = 0.25, size = 2, na.rm = TRUE, label.padding = unit(0.15, "lines")) +
    scale_color_viridis()
}
