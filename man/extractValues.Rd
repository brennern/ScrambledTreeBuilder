% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extractValues.R
\name{extractValues}
\alias{extractValues}
\title{Extract values from a matrix.}
\usage{
extractValues(node, your_tibble, your_matrix, fun = mean)
}
\arguments{
\item{node}{Node}

\item{your_tibble}{Tibble data developed from tree.}

\item{your_matrix}{Matrix containing species data.}

\item{fun}{Calculates mean, median, etc. between node values to plot on the tree (default fun is mean)}
}
\value{
Values to store in a variable (percent identity, strand randomisation index, etc.)
}
\description{
Extract values from a matrix.
}
\examples{
unique(Tibble$parent) |> sort() |> purrr::set_names() |> sapply(extractValues, Tibble, valueMatrix)
}
