#' Thin a matrix by a minimum pairwise distance
#'
#' Greedily select labels so that all pairwise distances among the kept labels
#' are >= `min_dist`
#'
#'
#' @param D A square distance matrix (numeric) with identical row/column names.
#' @param min_dist Numeric scalar: minimum allowed pairwise distance.
#'
#' @return A symmetric numeric matrix: the **thinned distance matrix** restricted
#'   to the kept labels (rows/columns in the order they were added).
#'
#' @author Anika Mittal
#' @examples
#' D <- matrix(c(
#'   0, 3, 8, 6,
#'   3, 0, 7, 4,
#'   8, 7, 0, 5,
#'   6, 4, 5, 0
#' ), nrow = 4, byrow = TRUE,
#' dimnames = list(LETTERS[1:4], LETTERS[1:4]))
#' thin_by_min_distance_matrix(D, min_dist = 6)
#'
#' @export

thinByMin <- function(D, min_dist) {

  D <- as.matrix(D)
  stopifnot(identical(rownames(D), colnames(D)))
  D <- (D + t(D)) / 2
  diag(D) <- 0
  if (any(is.na(D))) stop("Distance matrix has NAs; impute first.")

  labs <- rownames(D)
  remaining <- labs

  F <- which(D == max(D), arr.ind = TRUE)[1, ]
  keep <- unique(labs[F])
  remaining <- setdiff(remaining, keep)

  while (length(remaining)) {
    dmin <- apply(D[remaining, keep, drop = FALSE], 1, min)
    cand <- remaining[which.max(dmin)]
    if (dmin[which.max(dmin)] >= min_dist) {
      keep <- c(keep, cand)
      remaining <- setdiff(remaining, cand)
    } else {
      too_close <- names(which(dmin < min_dist))
      remaining <- setdiff(remaining, too_close)
    }
  }
  D[keep, keep, drop = FALSE]
}
