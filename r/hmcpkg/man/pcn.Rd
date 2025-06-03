\name{pcn}
\alias{pcn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
CDF of a Contaminated Normal Distribution
%%  ~~function to do ... ~~
}
\description{
CDF of a Contaminated Normal Distribution; see Chapter 3 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pcn(x, eps, sigc)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{eps}{
%%     ~~Describe \code{eps} here~~
}
  \item{sigc}{
%%     ~~Describe \code{sigc} here~~
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
function (x, eps, sigc) 
{
    pcn <- (1 - eps) * pnorm(x) + eps * pnorm(x/sigc)
    return(pcn)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
