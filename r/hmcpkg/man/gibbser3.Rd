\name{gibbser3}
\alias{gibbser3}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Gibbs Sampler
%%  ~~function to do ... ~~
}
\description{
Gibbs Sampler; see page 677 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
gibbser3(alpha, beta, nt, m, n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
}
  \item{beta}{
%%     ~~Describe \code{beta} here~~
}
  \item{nt}{
%%     ~~Describe \code{nt} here~~
}
  \item{m}{
%%     ~~Describe \code{m} here~~
}
  \item{n}{
%%     ~~Describe \code{n} here~~
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
function (alpha, beta, nt, m, n) 
{
    x0 = 1
    yc = rep(0, m + n)
    xc = c(x0, rep(0, m - 1 + n))
    for (i in 2:(m + n)) {
        yc[i] = rbeta(1, xc[i - 1] + alpha, nt - xc[i - 1] + 
            beta)
        xc[i] = rbinom(1, nt, yc[i])
    }
    y1 = yc[1:m]
    y2 = yc[(m + 1):(m + n)]
    x1 = xc[1:m]
    x2 = xc[(m + 1):(m + n)]
    list(y1 = y1, y2 = y2, x1 = x1, x2 = x2)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
