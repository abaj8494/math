\name{betaplts}
\alias{betaplts}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Plot of Beta pdfs
%%  ~~function to do ... ~~
}
\description{
Gives a Plot of Beta pdfs
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
betaplts()
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
    par(mfrow = c(4, 4))
    r1 = 2:5
    r2 = 2:5
    x = seq(0.01, 0.99, 0.01)
    for (a in r1) {
        for (b in r2) {
            plot(dbeta(x, a, b) ~ x)
            title(paste("alpha = ", a, "beta = ", b))
        }
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
