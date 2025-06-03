\name{chistable}
\alias{chistable}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Chistable Data Set
%%  ~~function to do ... ~~
}
\description{
Chistable Data Set
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
chistable()
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
    x = c(0.01, 0.025, 0.5, 0.1, 0.9, 0.95, 0.975, 0.99)
    top = 30
    ptabs = matrix(rep(0, 240), ncol = 8)
    for (i in 1:8) {
        ptabs[, i] = qchisq(x[i], 1:top)
    }
    ptabs = round(1000 * ptabs)/1000
    chistable = cbind(1:top, ptabs)
    chistable
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
