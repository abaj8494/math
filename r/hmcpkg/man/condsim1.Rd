\name{condsim1}
\alias{condsim1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
MCMC Function 
%%  ~~function to do ... ~~
}
\description{
MCMC function for the Bayesian algorithm discussed on page 675.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
condsim1(nsims)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nsims}{
%%     ~~Describe \code{nsims} here~~
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
function (nsims) 
{
    collect <- rep(0, nsims)
    for (i in 1:nsims) {
        y <- -0.5 * log(1 - runif(1))
        collect[i] <- -log(1 - runif(1)) + y
    }
    collect
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
