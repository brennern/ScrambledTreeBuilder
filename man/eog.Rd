% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eog.R
\name{eog}
\alias{eog}
\title{Run \code{eog} on a plot for a clade}
\usage{
eog(tree, node, target = NULL)
}
\arguments{
\item{tree}{A tree created with the \code{makeTidyTree()} function.}

\item{node}{The ID number of the node to base the subtree, or a \code{FocalClade}
object.}

\item{target}{A pattern to restrict the files to share the same target genome.}
}
\description{
Prepare a shell command to run the Eye of Gnome image viewer on a subset
of alignment pairwise plots comparing genomes from the same clade.
}
\examples{
eog(Halo_Tree, 10)
eog(Halo_Tree, 10, target = "nori")
eog(Halo_Tree, Halo_FocalClades$Haloferax)

}
\seealso{
Other Focal clade functions: 
\code{\link{focalClade}()},
\code{\link{recordAncestor}()},
\code{\link{recordClades}()},
\code{\link{subMatrix}()},
\code{\link{subTree}()},
\code{\link{visualizeTree}()}
}
\author{
Charles Plessy
}
\concept{Focal clade functions}
\concept{Shell helper functions}
