\name{abgame}
\alias{abgame}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Simulator of Game between A and B 
%%  ~~function to do ... ~~
}
\description{Computes on simulation of the game between A and B as described in Section 1.4 of the book cited in the reference.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
abgame()
}
%- maybe also 'usage' for other objects documented here.
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{A vector is returned.   If the first component is 1 then A won. If the second component is 1 then B won.
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
    rngA <- c(0, 1)
    rngB <- 1:6
    pA <- rep(1/2, 2)
    pB <- rep(1/6, 6)
    ic <- 0
    Awin <- 0
    Bwin <- 0
    while (ic == 0) {
        x <- sample(rngA, 1, pr = pA)
        if (x == 1) {
            ic <- 1
            Awin <- 1
        }
        else {
            y <- sample(rngB, 1, pr = pB)
            if (y <= 4) {
                ic <- 1
                Bwin <- 1
            }
        }
    }
    return(c(Awin, Bwin))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
