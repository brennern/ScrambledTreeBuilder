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
  tree_matrix <- makeMatrix(exDataFrame, valueToBuildTheTree, 100, 50)
  value_matrix <- makeMatrix(exDataFrame, valueToPlaceOnLabels, 1, 0.5)
  HClust <- hclust(dist(treeMatrix), method = "complete")
  the_tibble <- tidytree::as_tibble(tidytree::as.phylo(HClust))
  the_tibbleWithValue <- makeValueTibble(Tibble, valueMatrix)
  the_tibbleWithValue
}
