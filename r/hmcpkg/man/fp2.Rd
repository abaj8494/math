\name{fp2}
\alias{fp2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Computes F-Table of Probabilities
%%  ~~function to do ... ~~
}
\description{
Computes F-Table of Probabilities for HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fp2()
}
%- maybe also 'usage' for other objects documented here.
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
function () 
{
    numdf = c(10, 15, 20, 25, 30, 40, 60, 120)
    denomdf = c(1:30, 40, 60, 120)
    ic = length(denomdf)
    xmat = matrix(rep(0, 8 * ic), ncol = 8)
    for (i in 1:ic) {
        for (j in 1:8) {
            xmat[i, j] = round(100 * qf(0.95, numdf[j], denomdf[i]))/100
        }
    }
    xmat = cbind(denomdf, xmat)
    xmat = rbind(c(0, numdf), xmat)
    vec = c(0, round(100 * qchisq(0.95, numdf)/numdf)/100)
    xmat = rbind(xmat, vec)
    vec2 = c(0, round(100 * denomdf/qchisq(0.05, denomdf))/100, 
        1)
    xmat = cbind(xmat, vec2)
    xmat
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
