\name{ex158}
\alias{ex158}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Function for Exercise 1.5.9
%%  ~~function to do ... ~~
}
\description{
Function for Exercise 1.5.9 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ex158()
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
    plot(c(0, 1) ~ c(-1.25, 1.25), xlab = "x", ylab = "y", pch = " ")
    segments(-1.25, 0, -1, 0)
    segments(1, 1, 1.25, 1)
    segments(-1, 0.25, 1, 0.75)
    points(-1, 0.25, pch = 18)
    points(1, 1, pch = 18)
    points(-1, 0, pch = 21)
    points(1, 0.75, pch = 21)
    title("Exercise 1.5.8")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
