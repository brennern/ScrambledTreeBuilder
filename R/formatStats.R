#' Consolidate YAML reports in one data frame
#'
#' Read YAML files, one per pair of genomes, and consolidate the information in
#' one data frame where each row is one pair and each column is one statistic.
#'
#' The format of the YAML files changed over time and this function has some
#' commands that aim at supporting legacy formats, converting column names,
#' etc.
#'
#' @param files A named character vector of paths to YAML files.  The names will
#'        become the row names of the output data frame. Compressed files are
#'        accepted.
#'
#' @return Formatted `data.frame` with alignment statistics such as alignment
#' length, strand randomisation index or percent identity. Its `lab` column
#' contains a 2-line text item to allow some plots to display the `species1` and
#' `species2` identifiers in a way that is easily centered on the data point.
#'
#' @author Noah Brenner
#' @author Charles Plessy
#' 
#'
#' @family Data load functions
#'
#' @export
#'
#' @examples
#' yamlFileData <-
#'   system.file("extdata/yaml", package = "ScrambledTreeBuilder") |> resultFiles()
#' exDataFrame <- formatStats(yamlFileData)
#' exDataFrame[1:10,1:6]

formatStats <- function(files) {
  DF <- do.call(rbind, lapply(files, getStats)) |> as.data.frame()
  DF <- DF[,colSums(DF, na.rm = TRUE) !=0]
  rownames(DF) <- sub("_samplesheet", "", rownames(DF)) # legacy data support; to be removed later
  DF$species1 <- strsplit(rownames(DF), "___") |> lapply(\(.) .[1]) |> unlist()
  DF$species2 <- strsplit(rownames(DF), "___") |> lapply(\(.) .[2]) |> unlist()
  DF <- DF[DF$species1 != DF$species2,]
  DF$index_avg_strandRand             <- ( DF$index_strandRand_target          + DF$index_strandRand_query          ) /   2
  DF$index_avg_synteny                <- ( DF$index_synteny_target             + DF$index_synteny_query             ) /   2
  DF$avg_chr_num                      <- ( DF$guessed_target_length_N          + DF$guessed_query_length_N          ) /   2
  if (is.null(DF$percent_identity_global)) {
    DF$percent_identity_global <- DF$PercentIdentity
    DF$percent_identity_local  <- DF$PercentIdentityNoGaps
  }
  if (is.null(DF$percent_identity_global)) {
    DF$percent_identity_global <- DF$PercentSimilarity
    DF$percent_identity_local  <- DF$PercentSimilarityNogaps
  }
  if (is.null(DF$percent_identity_global)) {
    DF$percent_identity_local  <- DF$aligned_matches_Total / (DF$aligned_matches_Total + DF$aligned_mismatches_Total) * 100
    DF$percent_identity_global <- DF$aligned_matches_Total / (DF$aligned_matches_Total + DF$aligned_gaps_target_Total + DF$aligned_gaps_query_Total + DF$aligned_mismatches_Total) * 100
  }
  DF$percent_difference_local  <- 100 - DF$percent_identity_local
  DF$percent_difference_global <- 100 - DF$percent_identity_global
  DF$index_avg_strandDiscord   <-   1 - DF$index_avg_strandRand

  DF$percent_aligned <- 100* round(digits = 3, DF$aligned_width_target_Total / DF$guessed_target_length_Total)

  DF$lab <- ifelse( DF$species1 > DF$species2,
                    paste(DF$species1, DF$species2, sep = "\n"),
                    paste(DF$species2, DF$species1, sep = "\n"))
  DF
}
