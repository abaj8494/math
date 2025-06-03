\name{poisrand}
\alias{poisrand}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Poisson Generator.
%%  ~~function to do ... ~~
}
\description{
Poisson Generator; see Page 295 0f HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
poisrand(n, lambda)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
%%     ~~Describe \code{n} here~~
}
  \item{lambda}{
%%     ~~Describe \code{lambda} here~~
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
function (n, lambda) 
{
    poisrand = rep(0, n)
    for (i in 1:n) {
        xt = 0
        t = 0
        while (t < 1) {
            x = xt
            y = -(1/lambda) * log(1 - runif(1))
            t = t + y
            xt = xt + 1
        }
        poisrand[i] = x
    }
    poisrand
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
