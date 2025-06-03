\name{getcis}
\alias{getcis}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Computes t Confidence intervals for the rows of a matrix
%%  ~~function to do ... ~~
}
\description{
Computes t Confidence intervals for the rows of a matrix; see Chapter 4 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
getcis(mat, cc = 0.9)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mat}{
%%     ~~Describe \code{mat} here~~
}
  \item{cc}{
%%     ~~Describe \code{cc} here~~
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
function (mat, cc = 0.9) 
{
    numb <- length(mat[, 1])
    ci <- c()
    for (j in 1:numb) {
        ci <- rbind(ci, t.test(mat[j, ], conf.level = cc)$conf.int)
    }
    return(ci)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
