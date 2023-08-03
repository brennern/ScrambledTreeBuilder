#' Get statistics information from .yaml files.
#'
#' @param file .yaml file containing species information.
#'
#' @return Data.
#' @export
#'
#' @examples
#' yamlFileData <- getStats(yamlFileData)
getStats <- function(file) {
  y <- yaml::read_yaml(file) |> yaml::yaml.load()
  unlist(y)
}
