\name{mlelogistic}
\alias{mlelogistic}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
mle for a  logistic distribution
%%  ~~function to do ... ~~
}
\description{
mle for a  logistic distribution; see Section 6.1 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
mlelogistic(x, theta0 = mean(x), numstp = 100, eps = 1e-04)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{theta0}{
%%     ~~Describe \code{theta0} here~~
}
  \item{numstp}{
%%     ~~Describe \code{numstp} here~~
}
  \item{eps}{
%%     ~~Describe \code{eps} here~~
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
function (x, theta0 = mean(x), numstp = 100, eps = 1e-04) 
{
    n = length(x)
    numfin = numstp
    small = 1 * 10^(-8)
    ic = 0
    istop = 0
    while (istop == 0) {
        ic = ic + 1
        expx = exp(-(x - theta0))
        lprime = n - 2 * sum(expx/(1 + expx))
        ldprime = -2 * sum(expx/(1 + expx)^2)
        theta1 = theta0 - (lprime/ldprime)
        check = abs(theta0 - theta1)/abs(theta0 + small)
        if (check < eps) {
            istop = 1
        }
        theta0 = theta1
    }
    list(theta1 = theta1, check = check, realnumstps = ic)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
