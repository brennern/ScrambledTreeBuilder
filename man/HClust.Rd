\name{HClust}
\alias{HClust}
\docType{data}
\title{HClust}
\description{Hierarchical clustering of species genome data from a matrix input.}
\usage{data("HClust")}
\format{
  The format is:
List of 7
 $ merge      : int [1:5, 1:2] -3 -1 -2 -5 1 -4 -6 2 3 4
 $ height     : num [1:5] 27.4 30 35.9 40.3 49.5
 $ order      : int [1:6] 3 4 5 2 1 6
 $ labels     : chr [1:6] "Halobacterium_noricense" "Halobacterium_salinarum" "Haloferax_mediterranei_ATCC_33500" "Haloferax_volcanii_DS2" ...
 $ method     : chr "complete"
 $ call       : language hclust(d = dist(treeMatrix), method = "complete")
 $ dist.method: chr "euclidean"
 - attr(*, "class")= chr "hclust"
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(HClust)
## maybe str(HClust) ; plot(HClust) ...
}
\keyword{datasets}
