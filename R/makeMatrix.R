#' Make a matrix from a data frame containing species data.
#'
#' @param DF Data frame containing species information.
#' @param column The variable from the data frame you want to extract species data from.
#' @param defaultDiagonal defaultDiagonal
#' @param defaultValue defaultValue
#'
#' @return A matrix containing species names and data for the selected variable.
#' @export
#'
#' @examples
#' makeMatrix(exDataFrame, "percent_identity_global", 100, 50)
makeMatrix <- function(DF, column, defaultDiagonal = 100, defaultValue = NA) {
  all_species <- unique(DF$species2)
  your_matrix <- matrix(defaultValue, nrow=length(all_species), ncol=length(all_species))
  colnames(your_matrix) <- rownames(your_matrix) <- all_species
  for (i in 1:length(all_species)) {
    your_matrix[i,i] <- defaultDiagonal
  }
  for (i in 1:nrow(DF)) {
    species1 <- DF[i, "species1"]
    species2 <- DF[i, "species2"]
    if(species1 %in% all_species)
      your_matrix[species1, species2] <- DF[i, column]
  }
  attr(matrix, "builtWith") <- column
  your_matrix
}
