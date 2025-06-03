\name{boottestonemed}
\alias{boottestonemed}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Median Bootstrap Test
%%  ~~function to do ... ~~
}
\description{
Computation of the median bootstrap test; see Page 311 of the text (HMC).
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
boottestonemed(x, theta0, b)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{theta0}{
%%     ~~Describe \code{theta0} here~~
}
  \item{b}{
%%     ~~Describe \code{b} here~~
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
function (x, theta0, b) 
{
    n <- length(x)
    v <- median(x)
    z <- x - median(x) + theta0
    counter <- 0
    teststatall <- rep(0, b)
    for (i in 1:b) {
        xstar <- sample(z, n, replace = T)
        vstar <- median(xstar)
        if (vstar >= v) {
            counter <- counter + 1
        }
        teststatall[i] <- vstar
    }
    pvalue <- counter/b
    list(origtest = v, pvalue = pvalue, teststatall = teststatall)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
