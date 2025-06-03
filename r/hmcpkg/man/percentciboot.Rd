\name{percentciboot}
\alias{percentciboot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Percentile Bootstrap CI
%%  ~~function to do ... ~~
}
\description{
Computes a Percentile Bootstrap CI; see Chapter 4 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
percentciboot(x, b, alpha)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{b}{
%%     ~~Describe \code{b} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Hogg, R.V., McKean, J.W. and Craig, A.T. (2018), \emph{Introduction to Mathematical Statistics, 8th Ed.}, Pearson: Boston.
%% ~put references to the literature/web site here ~
}
\author{
Joe McKean
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, b, alpha) 
{
    theta <- mean(x)
    thetastar <- rep(0, b)
    n <- length(x)
    for (i in 1:b) {
        xstar <- sample(x, n, replace = T)
        thetastar[i] <- mean(xstar)
    }
    thetastar <- sort(thetastar)
    pick <- round((alpha/2) * (b + 1))
    lower <- thetastar[pick]
    upper <- thetastar[b - pick + 1]
    list(theta = theta, lower = lower, upper = upper, thetasta = thetastar)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
