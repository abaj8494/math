\name{tpower2g2}
\alias{tpower2g2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Power Function for Two-Sample t-test
%%  ~~function to do ... ~~
}
\description{
Power Function for Two-Sample t-test; see Page 449 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
tpower2g2(n, m, Delta, sig, alpha)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
%%     ~~Describe \code{n} here~~
}
  \item{m}{
%%     ~~Describe \code{m} here~~
}
  \item{Delta}{
%%     ~~Describe \code{Delta} here~~
}
  \item{sig}{
%%     ~~Describe \code{sig} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
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
function (n, m, Delta, sig, alpha) 
{
    delta <- sqrt(n * m/(m + n)) * (Delta/sig)
    df = n + m - 2
    tc <- qt(1 - alpha, df)
    gammas <- 1 - pt(tc, df, ncp = delta)
    return(gammas)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
