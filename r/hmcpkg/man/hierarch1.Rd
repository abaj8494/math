\name{hierarch1}
\alias{hierarch1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Function for a Hierarchical Bayes Algorithm
%%  ~~function to do ... ~~
}
\description{
Function for a Hierarchical Bayes Algorithm; see page 682 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hierarch1(nsims, x, tau, kstart)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nsims}{
%%     ~~Describe \code{nsims} here~~
}
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{tau}{
%%     ~~Describe \code{tau} here~~
}
  \item{kstart}{
%%     ~~Describe \code{kstart} here~~
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
function (nsims, x, tau, kstart) 
{
    bold <- 1
    clambda <- rep(0, (nsims + kstart))
    cb <- rep(0, (nsims + kstart))
    for (i in 1:(nsims + kstart)) {
        clambda[i] <- rgamma(1, shape = (x + 1), scale = (bold/(bold + 
            1)))
        newy <- rgamma(1, shape = 2, scale = (tau/(clambda[i] * 
            tau + 1)))
        cb[i] <- 1/newy
        bold <- 1/newy
    }
    gibbslambda <- clambda[(kstart + 1):(nsims + kstart)]
    gibbsb <- cb[(kstart + 1):(nsims + kstart)]
    list(clambda = clambda, cb = cb, gibbslambda = gibbslambda, 
        gibbsb = gibbsb)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
