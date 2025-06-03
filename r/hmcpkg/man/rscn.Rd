\name{rscn}
\alias{rscn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates Random Variates from a Skewed Normal Distribution
%%  ~~function to do ... ~~
}
\description{
Generates Random Variates from a Skewed Normal Distribution; see page 596 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rscn(n, eps, sd, mu)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
%%     ~~Describe \code{n} here~~
}
  \item{eps}{
%%     ~~Describe \code{eps} here~~
}
  \item{sd}{
%%     ~~Describe \code{sd} here~~
}
  \item{mu}{
%%     ~~Describe \code{mu} here~~
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
function (n, eps, sd, mu) 
{
    x1 = rnorm(n)
    x2 = rnorm(n, mu, sd)
    b1 = rbinom(n, 1, eps)
    rscn = x1 * (1 - b1) + b1 * x2
    rscn
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
