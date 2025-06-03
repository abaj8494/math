\name{bootstrapcis64}
\alias{bootstrapcis64}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Bootstrap Percentile Confidence Interval
%%  ~~function to do ... ~~
}
\description{
Computs a Bootstrap Percentile Confidence Interval
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bootstrapcis64(x, c, nb = 3000, alp2 = 0.025)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{c}{
%%     ~~Describe \code{c} here~~
}
  \item{nb}{
%%     ~~Describe \code{nb} here~~
}
  \item{alp2}{
%%     ~~Describe \code{alp2} here~~
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
Joe Mckean
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
function (x, c, nb = 3000, alp2 = 0.025) 
{
    n <- length(x)
    xb = mean(x)
    sb = (((n - 1)/n) * var(x))^0.5
    est <- pnorm((c - xb)/sb)
    collest <- c()
    for (i in 1:nb) {
        xr = sample(x, 50, replace = T)
        xb = mean(xr)
        sb = (((n - 1)/n) * var(xr))^0.5
        estr <- pnorm((c - xb)/sb)
        collest <- c(collest, estr)
    }
    colls <- sort(collest)
    cut <- round(nb * alp2)
    lb <- colls[cut]
    ub <- colls[nb - (cut - 1)]
    list(est, lb, ub)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
