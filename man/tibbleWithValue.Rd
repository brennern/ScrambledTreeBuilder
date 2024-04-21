\name{tibbleWithValue}
\alias{tibbleWithValue}
\docType{data}
\title{Tibble with Added Value}
\description{Tibble to be utilized for phylogenetic tree construction.}
\usage{data("tibbleWithValue")}
\format{
  A data frame with 11 observations on the following 5 variables.
  \describe{
    \item{\code{parent}}{a numeric vector}
    \item{\code{node}}{a numeric vector}
    \item{\code{branch.length}}{a numeric vector}
    \item{\code{label}}{a character vector}
    \item{\code{value}}{a numeric vector}
  }
}
\details{This tibble dataset is the output from the makeValueTibble.R. This tibble will then be plotted using visualizeTree.R.}
\examples{
data(tibbleWithValue)
## maybe str(tibbleWithValue) ; plot(tibbleWithValue) ...
}
\keyword{datasets}
