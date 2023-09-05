#' Utilize ScrambledTreeBuilder functions to go straight from yaml files to a tree-buildable tibble dataframe with multiple values to label.
#'
#' @param yamlfiles Original yaml files
#' @param valueToBuildTheTree Variable you wish to build the tree with (ex. percent identity, etc.)
#' @param valueToPlaceOnLabels Variable you wish to label on internal nodes of the tree (ex. strand randomisation, etc.)
#' @param colsToSelect Selected columns to add.
#'
#' @return Tibble with multiple added values to build tree with.
#' @export
#'
#' @examples
yamlToMultiTibble <- function(yamlfiles, valueToBuildTheTree = "percent_identity_global", valueToPlaceOnLabels = "index_avg_strandRand", colsToSelect = c("index_avg_strandRand", "percent_identity_global")) {
  DF <- formatStats(yamlfiles)
  tree_matrix <- makeMatrix(DF, valueToBuildTheTree, 100, 50)
  value_matrix <- makeMatrix(DF, valueToPlaceOnLabels, 1, 0.5)
  HClust <- hclust(dist(tree_matrix), method = "complete")
  the_tibble <- tidytree::as_tibble(tidytree::as.phylo(HClust))
  aTibbleWithMultipleValues <- makeMultiValueTibble(the_tibble, DF, colsToSelect = c("index_avg_strandRand", "percent_identity_global"))
  aTibbleWithMultipleValues
}
