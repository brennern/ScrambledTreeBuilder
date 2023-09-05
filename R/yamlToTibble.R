#' Utilize ScrambledTreeBuilder functions to go straight from yaml files to a tree-buildable tibble dataframe.
#'
#' @param yamlfiles Original yaml files
#' @param valueToBuildTheTree Variable you wish to build the tree with (ex. percent identity, etc.)
#' @param valueToPlaceOnLabels Variable you wish to label on internal nodes of the tree (ex. strand randomisation, etc.)
#'
#' @return Tibble to build tree with.
#' @export
#'
#' @examples
#' yamlToTibble(yamlFileData)
yamlToTibble <- function(yamlfiles, valueToBuildTheTree = "percent_identity_global", valueToPlaceOnLabels = "index_avg_strandRand") {
  DF <- formatStats(yamlfiles)
  tree_matrix <- makeMatrix(DF, valueToBuildTheTree, 100, 50)
  value_matrix <- makeMatrix(DF, valueToPlaceOnLabels, 1, 0.5)
  HClust <- hclust(dist(tree_matrix), method = "complete")
  the_tibble <- tidytree::as_tibble(tidytree::as.phylo(HClust))
  the_tibbleWithValue <- makeValueTibble(the_tibble, value_matrix)
  the_tibbleWithValue
}
