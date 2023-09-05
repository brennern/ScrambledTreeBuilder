#' Make new tibble dataset with multiple added value columns to plot
#'
#' @param your_tibble Original tibble dataset to add value columns to.
#' @param DF Dataframe containing columns to add to tibble.
#' @param colsToSelect Selected columns to add.
#' @param defaultDiagonals Maximum score of each value to be added to tibble.
#' @param defaultValues Minimum score of each value to be added to tibble.
#' @param fun Calculates mean, median, etc. between node values to plot on the tree (default fun is mean)
#'
#' @return New tibble with numerous values added.
#' @export
#'
#' @examples
#' makeMultiValueTibble(your_tibble = Tibble, DF = exDataFrame)
makeMultiValueTibble <- function(your_tibble, DF, colsToSelect = c("index_avg_strandRand", "percent_identity_global"), defaultDiagonals = c(1, 100), defaultValues = c(0.5, NA), fun = mean) {
  n_cols <- length(colsToSelect)
  what_cols <- match(colsToSelect, colnames(DF))
  # TODO: sanity check for colnames and argument lengths
  value_matrices <- lapply(1:n_cols, function(x) {
    matchingcolname <- what_cols[x]
    matchingdiagonal <- defaultDiagonals[x]
    matchingdefValue <- defaultValues[x]
    y <- makeMatrix(DF, matchingcolname, matchingdiagonal, matchingdefValue)
    y
  })
  names(value_matrices) <- colsToSelect
  value_tibbles <- lapply(1:n_cols, function(x) {
    y <- makeValueTibble(your_tibble = your_tibble, your_matrix = value_matrices[[x]], fun = fun)
    y$value
  })
  mod_tibble <- your_tibble
  mod_tibble <- cbind(mod_tibble, do.call(cbind, value_tibbles))
  colnames(mod_tibble)[5:6] <- colsToSelect[]
  mod_tibble
}
