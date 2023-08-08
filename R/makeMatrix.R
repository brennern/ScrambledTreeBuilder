#' Make a matrix from a data frame containing species data.
#'
#' @param df Data frame containing species information.
#' @param column The variable from the data frame you want to extract species data from.
#' @param defaultDiagonal defaultDiagonal
#' @param defaultValue defaultValue
#'
#' @return A matrix containing species names and data for the selected variable.
#' @export
#'
#' @examples
#' makeMatrix(exDataFrame, "percent_identity_global", 100, 50)
makeMatrix <- function(df, column, defaultDiagonal = 100, defaultValue = NA) {
  species <- unique(df$species2)
  matrix <- matrix(defaultValue, nrow=length(species), ncol=length(species))
  colnames(matrix) <- rownames(matrix) <- species
  for (i in 1:length(species)) {
    matrix[i,i] <- defaultDiagonal
  }
  for (i in 1:nrow(df)) {
    species1 <- df[i, "species1"]
    species2 <- df[i, "species2"]
    if(species1 %in% species)
      matrix[species1, species2] <- df[i, column]
  }
  matrix
}
