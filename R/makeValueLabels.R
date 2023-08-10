makeValueLabels <- function(tibble, matrix) {
  labels <- unique(tibble$parent) |> sort() |> purrr::set_names() |> sapply(extractValues, tibble, matrix)
  tibble$value <- NA
  tibble[names(labels), "value"] <- unname(labels)
  tibble
  }
