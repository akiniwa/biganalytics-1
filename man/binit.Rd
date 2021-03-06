\name{binit}
\alias{binit}
\title{Count elements appearing in bins of one or two variables.}
\description{
This provides preliminary counting functionality to eventually
support graphical exploration or as an alternative to \code{table}.
Note the availability of \pkg{bigtabulate}.
}
\usage{
binit(x, cols, breaks=10)
}
\arguments{
  \item{x}{a \code{\link[bigmemory]{big.matrix}} or a \code{\link{matrix}}.}
  \item{cols}{a vector of column indices or names of length 1 or 2.}
  \item{breaks}{a number of bins to span the range from the maximum to the minimum, or a vector (1-variable case) or list of two vectors (2-variable case) where each vector is a triplet of min, max, and number of bins.}
}
\details{
The user may specify the number of bins to be used, of equal widths, spanning the
range of the data (the default is 10 bins).  The user may also specify the
range to be spanned along with the number of bins, in case a summary of a subrange
of the data is desired.  Either univariate or bivariate counting is supported.

The function uses left-closed intervals [a,b) except in the right-most bin,
where the interval is entirely closed.
}
\value{
a list containing (a) a vector (1-variable case) or a matrix (2-variable case)
of counts of the numbers of cases appearing in each of the bins,
(b) description(s) of bin centers, and (c) description(s) of breaks between
the bins.
}
\author{John W. Emerson and Michael J. Kane}
\seealso{
\code{\link[bigmemory]{big.matrix}}
}
\examples{
y <- matrix(rnorm(40), 20, 2)
y[1,1] <- NA
x <- as.big.matrix(y, type="double")
x[,]
binit(y, 1:2, list(c(-1,1,5), c(-1,1,2)))
binit(x, 1:2, list(c(-1,1,5), c(-1,1,2)))

binit(y, 1:2)
binit(x, 1:2)

binit(y, 1:2, 5)
binit(x, 1:2, 5)

binit(y, 1)
binit(x, 1)

x <- as.big.matrix(matrix(rnorm(400), 200, 2), type="double")
x[,1] <- x[,1] + 3
x.binit <- binit(x, 1:2)
filled.contour(round(x.binit$rowcenters,2), round(x.binit$colcenters,2),
               x.binit$counts, xlab="Variable 1",
               ylab="Variable 2")
}
\keyword{methods}
