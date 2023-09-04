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
#' exDataFrame[1:10,1:6]
formatStats <- function(files) {
  DF <- do.call(rbind, lapply(files, getStats)) |> as.data.frame()
  DF <- DF[,colSums(DF, na.rm = TRUE) !=0]
  DF$species1 <- strsplit(rownames(DF), "___") |> lapply(\(.) .[1]) |> unlist()
  DF$species2 <- strsplit(rownames(DF), "___") |> lapply(\(.) .[2]) |> unlist()
  DF <- DF[DF$species1 != DF$species2,]
  DF$index_avg_strandRand <- (DF$index_strandRand_target_bestpair + DF$index_strandRand_query_bestpair) / 2
  DF$percent_identity_global <- DF$aligned_matches_bestpair_Total / DF$aligned_length_bestpair_Total * 100
  DF
}
