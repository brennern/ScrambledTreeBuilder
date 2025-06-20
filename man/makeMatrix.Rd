% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/makeMatrix.R
\name{makeMatrix}
\alias{makeMatrix}
\title{Pairwise comparison matrix}
\usage{
makeMatrix(DF, column, defaultDiagonal = 100, defaultValue = NA)
}
\arguments{
\item{DF}{Data frame containing species information.}

\item{column}{The variable from the data frame you want to extract species data from.}

\item{defaultDiagonal}{Maximum possible value of variable.}

\item{defaultValue}{Minimum possible value of variable.}
}
\value{
A square \code{matrix} where rows and columns are sample identifiers and
values are statistics for the pairs of samples.  In addition it has an
attribute "builtWith" that records the value of \code{column}.
}
\description{
Make a matrix from a data frame containing species data.
}
\examples{
makeMatrix(Halo_DF, "percent_identity_global", 100, 50)
}
\author{
Noa Brenner

Charles Plessy
}
