#' Get statistical information from .yaml files.
#'
#' @param file .yaml file containing species information.
#'
#' @return Unpacked .yaml file data.
#' @export
#'
#' @examples
#' resultsDir <- system.file("extdata/yaml", package = "ScrambledTreeBuilder")
#' yamlFileData <- list.files(resultsDir, pattern = "*.yaml.bz2", full.names = TRUE)
#' getStats(yamlFileData[1])
getStats <- function(file) {
  y <- yaml::read_yaml(file) |> yaml::yaml.load()
  unlist(y)
}
