#' Get statistics information from .yaml files.
#'
#' @param file .yaml file containing species information.
#'
#' @return Data.
#' @export
#'
#' @examples
getStats <- function(file) {
  y <- yaml::read_yaml(file) |> yaml::yaml.load()
  unlist(y)
}
