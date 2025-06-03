\name{normtab}
\alias{normtab}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Normal Table of Probabilities
%%  ~~function to do ... ~~
}
\description{
Generates Normal Table of Probabilities found in HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
normtab()
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
    za <- seq(0, 3.59, 0.01)
    pz <- t(matrix(round(pnorm(za), digits = 4), nrow = 10))
    colnames(pz) <- seq(0, 0.09, 0.01)
    rownames(pz) <- seq(0, 3.5, 0.1)
    return(pz)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
