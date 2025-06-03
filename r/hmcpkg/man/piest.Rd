\name{piest}
\alias{piest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimation of pi
%%  ~~function to do ... ~~
}
\description{
Estimation of pi by a simulation; see page 293 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
piest(n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
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
function (n) 
{
    u1 <- runif(n)
    u2 <- runif(n)
    cnt <- rep(0, n)
    chk <- u1^2 + u2^2 - 1
    cnt[chk < 0] <- 1
    est <- mean(cnt)
    se <- 4 * sqrt(est * (1 - est)/n)
    est <- 4 * est
    list(estimate = est, standard = se)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
