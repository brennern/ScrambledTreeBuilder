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
#' m <- makeMatrix(df, "percent_identity_global", 100, 50)
makeMatrix <- function(df, column, defaultDiagonal = 100, defaultValue = NA) {
  species <- unique(df$species2)
  m <- matrix(defaultValue, nrow=length(species), ncol=length(species))
  colnames(m) <- rownames(m) <- species
  for (i in 1:length(species)) {
    m[i,i] <- defaultDiagonal
  }
  for (i in 1:nrow(df)) {
    s1 <- df[i, "species1"]
    s2 <- df[i, "species2"]
    if(s1 %in% species)
      m[s1, s2] <- df[i, column]
  }
  m
}
