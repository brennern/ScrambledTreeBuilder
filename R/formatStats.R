#' Format species data and calculate percent identity and strand randomisation variables as part of the dataframe.
#'
#' @param files A named character vector of paths to YAML files.  The names will
#'        become the row names of the output data frame. Compressed files are\
#'        accepted.
#'
#' @return Formatted dataframe with strand randomisation and percent identities between species calculated.
#' @export
#'
#' @examples
#' resultsDir <- system.file("extdata/PairwiseComparisons", package = "ScrambledTreeBuilder")
#' yamlFileData <- list.files(resultsDir, pattern = "*.yaml.bz2", full.names = TRUE)
#' names(yamlFileData) <- yamlFileData |> basename() |> sub(pat = ".yaml.bz2", rep="")
#' exDataFrame <- formatStats(yamlFileData)
formatStats <- function(df) {
  df <- do.call(rbind, lapply(x, getStats)) |> as.data.frame()
#' exDataFrame[1:10,1:6]
  df <- df[,colSums(df, na.rm = TRUE) !=0]
  df$species1 <- strsplit(rownames(df), "___") |> lapply(\(.) .[1]) |> unlist()
  df$species2 <- strsplit(rownames(df), "___") |> lapply(\(.) .[2]) |> unlist()
  df <- df[df$species1 != df$species2,]
  df$index_avg_strandRand <- (df$index_strandRand_target_bestpair + df$index_strandRand_query_bestpair) / 2
  df$percent_identity_global <- df$aligned_matches_bestpair_Total / df$aligned_length_bestpair_Total * 100
  df
}
