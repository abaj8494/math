\name{bday}
\alias{bday}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Birthday Problem
%%  ~~function to do ... ~~
}
\description{Computes the probability that at least 2 people ina room of n people have the same birthday.
See Section 1.3 of HMC, referenced below.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bday(n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{Number of people in the room.
%%     ~~Describe \code{n} here~~
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
\author{Joe McKean
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
function (n) 
{
    bday = 1
    nm1 = n - 1
    for (j in 1:nm1) {
        bday = bday * ((365 - j)/365)
    }
    bday <- 1 - bday
    return(bday)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
