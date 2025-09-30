#' Residual-resampling bootstrap tree(s) from a distance matrix (UPGMA)
#'
#' Build a reference tree from a distance matrix using UPGMA, then perform
#' residual-resampling bootstrap to obtain replicate trees and map clade
#' support onto the reference.
#'
#' @param D A square numeric distance matrix with identical row/column names, or a `dist` object.
#' @param n_bootstrap Integer number of bootstrap replicates (default 1000).
#' @param clamp_zero Logical; clamp negative distances in resampled matrices to 0 (recommended).
#'
#' @return A list with:
#' \describe{
#'   \item{tree}{Reference tree (`phylo`) built from \code{D} with UPGMA. Node labels contain bootstrap \%.}
#'   \item{bootstrap_trees}{List of replicate trees (`phylo`).}
#'   \item{support}{Numeric vector of bootstrap percentages per internal node (aligned to \code{tree$node.label}).}
#'   \item{call}{Matched call.}
#' }
#'
#' @author Anika Mittal
#'
#' @examples
#' out <- residualBootstrapTree(Halo_PercentDiff, n_bootstrap = 200)
#' plot(out$tree, show.node.label = TRUE)
#' 
#'
#' @export
#' @importFrom ape as.phylo cophenetic.phylo prop.part prop.clades
#' @importFrom stats as.dist hclust
residualBootstrapTree <- function(
    D,
    n_bootstrap = 1000L,
    clamp_zero = TRUE
) {
  # -- 1) Validate & normalise matrix
  D <- if (inherits(D, "dist")) as.matrix(D) else as.matrix(D)
  if (is.null(rownames(D)) || is.null(colnames(D)))
    stop("Distance matrix must have row and column names.")
  if (!identical(rownames(D), colnames(D)))
    stop("Row and column names must be identical and in the same order.")
  D <- (D + t(D)) / 2
  diag(D) <- 0
  if (anyNA(D)) stop("Distance matrix contains NA values; drop/impute before bootstrapping.")
  labs <- rownames(D)
  n <- nrow(D)
  
  # -- 2) Reference tree (UPGMA)
  dU <- stats::as.dist(D)
  hc <- stats::hclust(dU, method = "average")
  ref_tree <- ape::as.phylo(hc)  # rooted/ultrametric
  
  # -- 3) Predicted distances & residuals
  Dhat <- ape::cophenetic.phylo(ref_tree)
  Dhat <- Dhat[labs, labs, drop = FALSE]       # align order to D
  E <- D - Dhat
  U <- upper.tri(E)
  e_u <- E[U]                    # vector of residuals to sample from
  
  # -- 4) Residual-resampling bootstrap (unstratified)
  bootstrap_trees <- vector("list", n_bootstrap)
  for (b in seq_len(n_bootstrap)) {
    Estar <- matrix(0, n, n, dimnames = list(labs, labs))
    Estar[U] <- sample(e_u, length(e_u), replace = TRUE)
    Estar <- Estar + t(Estar)
    
    Dstar <- Dhat + Estar
    diag(Dstar) <- 0
    if (clamp_zero) Dstar[Dstar < 0] <- 0
    
    dU_star <- stats::as.dist(Dstar)
    hc_star <- stats::hclust(dU_star, method = "average")
    bootstrap_trees[[b]] <- ape::as.phylo(hc_star)
  }
  
  # -- 5) Bootstrap support on the reference tree (rooted = TRUE for UPGMA)
  pp <- ape::prop.part(bootstrap_trees, check.labels = TRUE)
  clade_counts <- ape::prop.clades(ref_tree, part = pp, rooted = TRUE)
  clade_counts[is.na(clade_counts)] <- 0
  support <- (clade_counts / n_bootstrap) * 100
  ref_tree$node.label <- as.character(round(support))
  
  structure(list(
    tree = ref_tree,
    bootstrap_trees = bootstrap_trees,
    support = support,
    call = match.call()
  ), class = "residualBootstrapTreeResult")
}
