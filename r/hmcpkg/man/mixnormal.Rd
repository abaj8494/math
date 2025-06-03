\name{mixnormal}
\alias{mixnormal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Exercise 6.6.8
%%  ~~function to do ... ~~
}
\description{
See Exercise 6.6.8 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
mixnormal(x, theta0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{theta0}{
%%     ~~Describe \code{theta0} here~~
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
function (x, theta0) 
{
    part1 = (1 - theta0[5]) * dnorm(x, theta0[1], theta0[3])
    part2 = theta0[5] * dnorm(x, theta0[2], theta0[4])
    gam = part2/(part1 + part2)
    denom1 = sum(1 - gam)
    denom2 = sum(gam)
    mu1 = sum((1 - gam) * x)/denom1
    sig1 = sqrt(sum((1 - gam) * ((x - mu1)^2))/denom1)
    mu2 = sum(gam * x)/denom2
    sig2 = sqrt(sum(gam * ((x - mu2)^2))/denom2)
    p = mean(gam)
    mixnormal = c(mu1, mu2, sig1, sig2, p)
    mixnormal
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
