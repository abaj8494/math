\name{ftableb}
\alias{ftableb}
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
ftableb()
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
    top = 1:16
    c1 = rep(c(0.95, 0.975, 0.99), 16)
    c2 = rep(1, 3)
    c2s = c2
    for (j in 2:16) {
        c2 = c2 + 1
        c2s = c(c2s, c2)
    }
    is = length(c1)
    js = length(top)
    ptabs = matrix(rep(0, 768), ncol = 16)
    for (i in 1:is) {
        for (j in 1:js) {
            ptabs[i, j] = qf(c1[i], top[j], c2s[i])
        }
    }
    ptabs = round(100 * ptabs)/100
    ftableb = cbind(c1, c2s, ptabs)
    ftableb
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
