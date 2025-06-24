#' Pairwise comparison matrix
#'
#' Make a matrix from a data frame containing species data.
#'
#' @param DF Data frame containing species information, produced with [`formatStats()`]
#' @param column The variable from the data frame to extract species data from.
#' @param defaultDiagonal Maximum possible value of variable.
#' @param defaultValue Minimum possible value of variable.
#'
#' @return A square `matrix` where rows and columns are sample identifiers and
#' values are statistics for the pairs of samples.  In addition it has an
#' attribute "builtWith" that records the value of `column`.
#'
#' @author Noa Brenner
#' @author Charles Plessy
#'
#' @export
#'
#' @examples
#' makeMatrix(Halo_DF, "percent_difference_global", 100, 50)
#'
#' # Missing values get NA by default unless specified in the 4th argument.
#' makeMatrix(Halo_DF |> tail(-1), "percent_difference_global", 100)

makeMatrix <- function(DF, column, defaultDiagonal = 100, defaultValue = NA) {
  all_species <- sort(unique(DF$species2))
  # Empty matrix
  m <- matrix(defaultValue, nrow=length(all_species), ncol=length(all_species))
  colnames(m) <- rownames(m) <- all_species
  # Diagonal values (may be absent from DF)
  for (i in 1:nrow(m)) {
    m[i,i] <- defaultDiagonal
  }
  # Other values (will be defaultValue if absent from DF)
  for (i in 1:nrow(DF)) {
    species1 <- DF[i, "species1"]
    species2 <- DF[i, "species2"]
    if(species1 %in% all_species) # Allow for sample removal
      m[species1, species2] <- DF[i, column]
  }
  attr(matrix, "builtWith") <- column
  m
}

makeMatrix.old <- function(DF, column, defaultDiagonal = 100, defaultValue = NA) {
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
