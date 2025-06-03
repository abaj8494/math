\name{binomci}
\alias{binomci}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Exact CI for a Binomial Proportion
%%  ~~function to do ... ~~
}
\description{
Computes an Exact CI for a Binomial Proportion; see page 250 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
binomci(s, n, theta1, theta2, value, maxstp = 100, eps = 1e-05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{s}{
%%     ~~Describe \code{s} here~~
}
  \item{n}{
%%     ~~Describe \code{n} here~~
}
  \item{theta1}{
%%     ~~Describe \code{theta1} here~~
}
  \item{theta2}{
%%     ~~Describe \code{theta2} here~~
}
  \item{value}{
%%     ~~Describe \code{value} here~~
}
  \item{maxstp}{
%%     ~~Describe \code{maxstp} here~~
}
  \item{eps}{
%%     ~~Describe \code{eps} here~~
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
function (s, n, theta1, theta2, value, maxstp = 100, eps = 1e-05) 
{
    y1 = pbinom(s, n, theta1)
    y2 = pbinom(s, n, theta2)
    ic1 = 0
    ic2 = 0
    if (y1 >= value) {
        ic1 = 1
    }
    if (y2 <= value) {
        ic2 = 1
    }
    if ((ic1 * ic2) > 0) {
        istep = 0
        while (istep < maxstp) {
            istep = istep + 1
            theta3 = (theta1 + theta2)/2
            y3 = pbinom(s, n, theta3)
            if (y3 > value) {
                theta1 = theta3
                y1 = y3
            }
            else {
                theta2 = theta3
                y2 = y3
            }
            if (abs(theta1 - theta2) < eps) {
                istep = maxstp
            }
        }
        list(solution = theta3, valatsol = y3)
    }
    else {
        list(error = "Bad Starts")
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
