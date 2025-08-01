#' Pairwise comparison matrix
#'
#' Make a matrix from a data frame containing species data.
#'
#' @param DF Data frame containing species information, produced with [`formatStats()`]
#' @param column The variable from the data frame to extract species data from.
#' @param defaultDiagonal Maximum possible value of variable.
#' @param defaultValue Minimum possible value of variable.
#' @param impute Method to impute missing value. Defaults to `no`.
#' @param ... Other arguments passed to the imputing function.
#'
#' @note In case of missing values, the following options are available.
#'  - Leave them missing (`NA`). This is the default.
#'  - Give them a fixed value defined by the `devaultValue` option.
#'  - Impute them from the replicate (when _target_ and _query_ roles are
#'    exchanged) if available (`impute=average`), else give them the default
#'    value.
#'  - Impute them from the replicate, and then with random forests
#'    (`impute=missForest`).  Hide the diagonal values (which are extreme)
#'    when (`impute=missForest2`).
#'
#' @return A square `matrix` where rows and columns are sample identifiers and
#' values are statistics for the pairs of samples.  In addition it has an
#' attribute "builtWith" that records the value of `column`.
#'
#' @author Noa Brenner
#' @author Charles Plessy
#' @author Anika Mittal
#'
#' @export
#'
#' @examples
#' df <- Halo_DF
#' makeMatrix(df, "percent_difference_global", 0, 50)
#'
#' # Missing values get NA by default unless specified in the 4th argument.
#' df["Salarchaeum_japonicum___Haloferax_volcanii", "percent_difference_global"] <- NA
#'
#' makeMatrix(df, "percent_difference_global", 0)
#' makeMatrix(df, "percent_difference_global", 0, impute = "average")
#'
#' # NA value imputation with missForest use random numbers
#' set.seed(1664)
#' df["Haloferax_volcanii___Salarchaeum_japonicum", "percent_difference_global"] <- NA
#' makeMatrix(df, "percent_difference_global", 0, impute =    "average")
#' makeMatrix(df, "percent_difference_global", 0, impute = "missForest")
#' makeMatrix(df, "percent_difference_global", 0, impute = "missForest2")

makeMatrix <- function(DF, column, defaultDiagonal = 100, defaultValue = NA, impute = c("no", "average", "missForest", "missForest2"), ...) {
  impute <- match.arg(impute)
  all_species <- sort(unique(c(DF$species1, DF$species2)))
  m <- matrix(NA, nrow = length(all_species), ncol = length(all_species))
  colnames(m) <- rownames(m) <- all_species
  diag(m) <- defaultDiagonal
  m[cbind(DF$species1, DF$species2)] <- DF[[column]]

  fillSymmetricNA <- function(mat) {
    na_pos <- which(is.na(mat) & !is.na(t(mat)), arr.ind = TRUE)
    mat[na_pos] <- t(mat)[na_pos]
    mat
  }

  imputeDefault <- function(m, defaultValue, ...) {
    m[is.na(m)] <- defaultValue
    m
  }

  imputeAverage <- function(m, defaultValue, ...) {
    m <- fillSymmetricNA(m)
    imputeDefault(m, defaultValue, ...)
  }

  imputeForest  <- function(m, devaultValue, ...) {
    m <- fillSymmetricNA(m)
    if (!requireNamespace("missForest", quietly = TRUE))
      stop("Package 'missForest' is required for imputation. Please install it.")
    missForest::missForest(m, ...)$ximp |> suppressWarnings()
  }

  imputeForest2  <- function(m, devaultValue, ...) {
    diag.m.old <- diag(m)
    diag(m) <- NA
    m <- imputeForest(m, devaultValue, ...)
    diag(m) <- diag.m.old
    m
  }

  imputeFunction <- switch(impute,
                           no          = imputeDefault,
                           average     = imputeAverage,
                           missForest  = imputeForest,
                           missForest2 = imputeForest2)

  m <- imputeFunction(m, defaultValue)

  attr(m, "builtWith") <- column
  return(m)
}
