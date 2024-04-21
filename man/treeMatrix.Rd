\name{treeMatrix}
\alias{treeMatrix}
\docType{data}
\title{Tree Matrix}
\description{Matrix to build tree with.}
\usage{data("treeMatrix")}
\format{
  The format is:
 num [1:6, 1:6] 100 74.7 66.5 70 71.9 ...
 - attr(*, "dimnames")=List of 2
  ..$ : chr [1:6] "Halobacterium_noricense" "Halobacterium_salinarum" "Haloferax_mediterranei_ATCC_33500" "Haloferax_volcanii_DS2" ...
  ..$ : chr [1:6] "Halobacterium_noricense" "Halobacterium_salinarum" "Haloferax_mediterranei_ATCC_33500" "Haloferax_volcanii_DS2" ...
 - attr(*, "builtWith")= chr "percent_identity_global"
}
\examples{
data(treeMatrix)
## maybe str(treeMatrix) ; plot(treeMatrix) ...
}
\keyword{datasets}
