\name{aresimcn}
\alias{aresimcn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Relative Efficiency Simulator
%%  ~~function to do ... ~~
}
\description{Performs a simulation for the relative efficiency between the Hodges-Lehmann one-sample estimator ad the sample mean.
See Section 10.3 of HMC, referenced below.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
aresimcn(n, nsims, eps, vc)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{Sample size.
%%     ~~Describe \code{n} here~~
}
  \item{nsims}{Number of simulations.
%%     ~~Describe \code{nsims} here~~
}
  \item{eps}{Proportion of contamination.
%%     ~~Describe \code{eps} here~~
}
  \item{vc}{Standard deviation ratio, contaminated to noncontaminated.
%%     ~~Describe \code{vc} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{Simulated Relative Efficiency (RE).
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
function (n, nsims, eps, vc) 
{
    chl <- c()
    cxbar <- c()
    for (i in 1:nsims) {
        x <- rcn(n, eps, vc)
        chl <- c(chl, wilcox.test(x, conf.int = T)$est)
        cxbar <- c(cxbar, t.test(x, conf.int = T)$est)
    }
    aresimcn <- mses(cxbar, 0)/mses(chl, 0)
    return(aresimcn)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
