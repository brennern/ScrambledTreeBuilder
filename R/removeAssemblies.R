#' Remove assemblies
#'
#' Exclude assemblies that were listed for removal for some reason.
#'
#' @param x A data frame or a matrix.
#' @param file A tab-separated file (pattern, reason) listing assemblies to remove.
#'
#' @returns The `x` object where genomes matching the patterns in `file` have
#' been removed.  For convenience, `x` is returned unmodified if `file` is
#' `NULL`.
#'
#' @author Charles Plessy
#'
#' @family Data load
#'
#' @examples
#' removeAssemblies(Halo_PercentDiff, textConnection("Halobacterium_\ttest"))
#' removeAssemblies(Halo_DF,          textConnection("Halobacterium_\ttest"))
#'
#' @export

removeAssemblies <- function(x, file=NULL) {
  if(is.null(file)) return(x)
  toRemove <- read.delim(file, header = FALSE, col.names = c("pattern", "reason"))
  keep <- ! grepl(paste(toRemove$pattern, collapse = "|"), rownames(x))
  if(is.matrix(x)) {
    return(x[keep,keep])
  } else if (is.data.frame(x)) {
    return(x[keep,])
  }
  stop("Input should be a matrix or a data frame.")
}
