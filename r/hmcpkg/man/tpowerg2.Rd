\name{tpowerg2}
\alias{tpowerg2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Power Function for One_Sample t-test
%%  ~~function to do ... ~~
}
\description{
Power Function for One_Sample t-test in HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
tpowerg2(mu0, mu1, sig, n, alpha = 0.05, byv = 0.1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mu0}{
%%     ~~Describe \code{mu0} here~~
}
  \item{mu1}{
%%     ~~Describe \code{mu1} here~~
}
  \item{sig}{
%%     ~~Describe \code{sig} here~~
}
  \item{n}{
%%     ~~Describe \code{n} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
}
  \item{byv}{
%%     ~~Describe \code{byv} here~~
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
function (mu0, mu1, sig, n, alpha = 0.05, byv = 0.1) 
{
    delta <- (mu1 - mu0)/(sig/sqrt(n))
    tc <- qt(1 - (alpha/2), n - 1)
    delta <- (mu1 - mu0)/(sig/sqrt(n))
    gammas <- 1 - pt(tc, n - 1, ncp = delta) + pt(-tc, n - 1, 
        ncp = delta)
    return(gammas)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
