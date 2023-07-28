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
#' sRIs <- unique(td$parent) |> sort() |> purrr::set_names() |> sapply(extractStrandRandIDs, td, m1)
#' td$strandRand <- NA
#' td[names(sRIs), "strandRand"] <- unname(sRIs)
extractStrandRandIDs <- function(node, tibble, matrix, fun = mean) {
  children <- child(tibble, node)
  stopifnot(nrow(children) == 2)
  left_side_node  <- children[1, "node", drop = TRUE]
  right_side_node <- children[2, "node", drop = TRUE]
  tipLabels <- function(node, tibble) {
    tipLabel <- tibble[node,"label", drop = TRUE]
    if(!is.na(tipLabel)) return(tipLabel)
    offspring(tibble, node)$label |> Filter(complete.cases, x=_)
  }
  left_side_species  <- tipLabels(left_side_node,  tibble)
  right_side_species <- tipLabels(right_side_node, tibble)
  comparison <- matrix[left_side_species, right_side_species, drop=F]
  strandRand <- fun(comparison)
  strandRand
}
