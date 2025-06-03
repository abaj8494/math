\name{boottesttwo}
\alias{boottesttwo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Bootstrap Two-Sample Test
%%  ~~function to do ... ~~
}
\description{
Bootstrap two-sample test; see page 310 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
boottesttwo(x, y, b)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
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
function (x, y, b) 
{
    n1 <- length(x)
    n2 <- length(y)
    v <- teststat(x, y)
    z <- c(x, y)
    counter <- 0
    teststatall <- rep(0, b)
    for (i in 1:b) {
        xstar <- sample(z, n1, replace = T)
        ystar <- sample(z, n2, replace = T)
        vstar <- teststat(xstar, ystar)
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
