\name{valueMatrix}
\alias{valueMatrix}
\docType{data}
\title{Value Matrix}
\description{Matrix to extract value to add to tibble dataset.}
\usage{data("valueMatrix")}
\format{
  The format is:
 num [1:6, 1:6] 1 0.2387 0.0488 0.0278 0.1148 ...
 - attr(*, "dimnames")=List of 2
  ..$ : chr [1:6] "Halobacterium_noricense" "Halobacterium_salinarum" "Haloferax_mediterranei_ATCC_33500" "Haloferax_volcanii_DS2" ...
  ..$ : chr [1:6] "Halobacterium_noricense" "Halobacterium_salinarum" "Haloferax_mediterranei_ATCC_33500" "Haloferax_volcanii_DS2" ...
 - attr(*, "builtWith")= chr "index_avg_strandRand"
}
\examples{
data(valueMatrix)
## maybe str(valueMatrix) ; plot(valueMatrix) ...
}
\keyword{datasets}
