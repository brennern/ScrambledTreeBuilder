#' Extract Strand Randomisation Indices Between Species.
#'
#' @param node Node.
#' @param tibble Tibble data from dendrogram.
#' @param matrix Matrix created from the makeMatrix function.
#' @param fun Calculates the mean strand randomisation index between nodes on a tree.
#'
#' @return Strand randomisation scores to store in a variable.
#' @export
#'
#' @examples
#' HClust <- hclust(dist(m), method = "complete")
#' Dendrogram <- as.dendrogram(HClust)
#' TD <- tidytree::as_tibble(phytools::as.phylo(dend))
#' Matrix2 <- makeMatrix(DataFrame, "index_avg_strandRand", 100, 50)
#' sRIs <- unique(TD$parent) |> sort() |> purrr::set_names() |> sapply(extractStrandRandIDs, TD, Matrix2)
#' TD$strandRand <- NA
#' TD[names(sRIs), "strandRand"] <- unname(sRIs)
extractStrandRandIDs <- function(node, tibble, matrix, fun = mean) {
  children <- tidytree::child(tibble, node)
  stopifnot(nrow(children) == 2)
  left_side_node  <- children[1, "node", drop = TRUE]
  right_side_node <- children[2, "node", drop = TRUE]
  tipLabels <- function(node, tibble) {
    tipLabel <- tibble[node,"label", drop = TRUE]
    if(!is.na(tipLabel)) return(tipLabel)
    tidytree::offspring(tibble, node)$label |> Filter(complete.cases, x=_)
  }
  left_side_species  <- tidytree::tipLabels(left_side_node,  tibble)
  right_side_species <- tidytree::tipLabels(right_side_node, tibble)
  comparison <- matrix[left_side_species, right_side_species, drop=F]
  strandRand <- fun(comparison)
  strandRand
}
