\name{waldpois}
\alias{waldpois}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Asymptotic Test for Poisson
%%  ~~function to do ... ~~
}
\description{
Asymptotic Test for Poisson; see Chapter 5 of HMC for theory.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
waldpois(x, theta0)
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
    n = length(x)
    th = mean(x)
    tst = (sqrt(n/th) * (th - theta0))^2
    tst
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
