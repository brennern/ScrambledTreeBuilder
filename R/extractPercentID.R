#' Extract percent identities between species.
#'
#' @param node Node.
#' @param tibble Tibble data from dendrogram.
#' @param matrix Matrix created from [`makeMatrix()`].
#' @param fun Function to reduce the collected values (default: `mean`).
#'
#' @return Percent identity scores to store in a variable.
#' @export
#'
#' @examples
#' HClust <- hclust(dist(exMatrix), method = "complete")
#' TD <- tidytree::as_tibble(tidytree::as.phylo(HClust))
#' pIDs <- unique(TD$parent) |> sort() |> purrr::set_names() |> sapply(extractPercentID, TD, exMatrix)
#' TD$percentID <- NA
#' TD[names(pIDs), "percentID"] <- unname(pIDs)
#' TD
extractPercentID <- function(node, tibble, matrix, fun = mean) {
  children <- tidytree::child(tibble, node)
  stopifnot(nrow(children) == 2)
  left_side_node  <- children[1, "node", drop = TRUE]
  right_side_node <- children[2, "node", drop = TRUE]
  tipLabels <- function(node, tibble) {
    tipLabel <- tibble[node,"label", drop = TRUE]
    if(!is.na(tipLabel)) return(tipLabel)
    tidytree::offspring(tibble, node)$label |> Filter(complete.cases, x=_)
  }
  left_side_species  <- tipLabels(left_side_node,  tibble)
  right_side_species <- tipLabels(right_side_node, tibble)
  comparison <- matrix[left_side_species, right_side_species, drop=F]
  percentID <- fun(comparison)
  percentID
}
