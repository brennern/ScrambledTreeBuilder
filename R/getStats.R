#' Get statistical information from .yaml files.
#'
#' @param file .yaml file containing species information.
#'
#' @return Unpacked .yaml file data.
#' @export
#'
#' @examples
#' yamlFileData <- getStats(yamlFileData)
getStats <- function(file) {
  y <- yaml::read_yaml(file) |> yaml::yaml.load()
  unlist(y)
}
