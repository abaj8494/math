\name{simplegame}
\alias{simplegame}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates a Gain from a Simple Game
%%  ~~function to do ... ~~
}
\description{
Generates a Gain from a Simple Game in Section 1.8 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
simplegame(amtpaid)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{amtpaid}{
%%     ~~Describe \code{amtpaid} here~~
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
function (amtpaid) 
{
    gain <- -amtpaid
    x <- 0:2
    pace <- (choose(4, x) * choose(48, 2 - x))/choose(52, 2)
    x <- sample(1:6, 1, prob = rep(1/6, 6))
    if (x > 2) {
        y <- sample(0:1, 1, prob = rep(1/2, 2))
        if (y == 0) {
            gain <- gain + 1
        }
        else {
            z <- sample(0:2, 1, prob = pace)
            if (z == 0) {
                gain <- gain + 2
            }
            if (z == 1) {
                gain <- gain + 10
            }
            if (z == 2) {
                gain <- gain + 50
            }
        }
    }
    return(gain)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
