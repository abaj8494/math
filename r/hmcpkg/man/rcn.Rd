\name{rcn}
\alias{rcn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Contaminated Normal Generator
%%  ~~function to do ... ~~
}
\description{
Contaminated Normal Generator; see Chapter 4 Section 9 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rcn(n, eps, sigmac)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
%%     ~~Describe \code{n} here~~
}
  \item{eps}{
%%     ~~Describe \code{eps} here~~
}
  \item{sigmac}{
%%     ~~Describe \code{sigmac} here~~
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
function (n, eps, sigmac) 
{
    ind <- rbinom(n, 1, eps)
    x <- rnorm(n)
    rcn <- x * (1 - ind) + sigmac * x * ind
    rcn
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
