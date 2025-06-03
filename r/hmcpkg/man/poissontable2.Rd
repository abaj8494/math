\name{poissontable2}
\alias{poissontable2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Table of Poisson Probabilities
%%  ~~function to do ... ~~
}
\description{
Table of Poisson Probabilities for various values of its mean; see Chapter 3.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
poissontable2()
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
    ptabs = matrix(rep(0, 11), ncol = 11)
    r1 = (0:10)/10
    r2 = r1 + 1
    r3 = c(0, 2.2, 2.4, 2.6, 2.8, 3, 3.2, 3.4, 3.6, 3.8, 4)
    r4 = r3 + 2
    r5 = c(0, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11)
    xmat = rbind(r1, r2, r3, r4, r5)
    top = c(6, 8, 12, 16, 23)
    for (i in 1:5) {
        ptabs = rbind(ptabs, xmat[i, ])
        ptemp = matrix(c(0:top[i]), ncol = 1)
        for (j in 1:10) {
            ptemp = cbind(ptemp, round(1000 * ppois(0:top[i], 
                xmat[i, j + 1]))/1000)
        }
        ptabs = rbind(ptabs, ptemp)
    }
    poissontable2 = ptabs
    poissontable2
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
