% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/makeMatrix.R
\name{makeMatrix}
\alias{makeMatrix}
\title{Make a matrix from a data frame containing species data.}
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
A matrix containing species names and data for the selected variable.
}
\description{
Make a matrix from a data frame containing species data.
}
\examples{
makeMatrix(exDataFrame, "percent_identity_global", 100, 50)
}
