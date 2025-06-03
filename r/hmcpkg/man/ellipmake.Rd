\name{ellipmake}
\alias{ellipmake}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Ellipmake
%%  ~~function to do ... ~~
}
\description{
Ellipmake
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ellipmake(p = 0.95, b = matrix(c(1, 0.75, 0.75, 1), nrow = 2), mu = c(5, 2))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p}{
%%     ~~Describe \code{p} here~~
}
  \item{b}{
%%     ~~Describe \code{b} here~~
}
  \item{mu}{
%%     ~~Describe \code{mu} here~~
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
%% ~put references to the literature/web site here ~
}
\author{
Part of this code was obtained from an annonymous author at the site
   http://stats.stackexchange.com/questions/9898/.
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
function (p = 0.95, b = matrix(c(1, 0.75, 0.75, 1), nrow = 2), 
    mu = c(5, 2)) 
{
    csq <- qchisq(p, 2)
    B = csq * b
    A = solve(B)
    eig <- eigen(A)
    gam <- eig$vectors
    lam2 <- sqrt(diag(eig$values))
    theta <- seq(0, 2 * pi, length.out = 200)
    y1 <- cos(theta)
    y2 <- sin(theta)
    ym <- cbind(y1, y2)
    xm <- ym \%*\% solve(lam2) \%*\% t(gam)
    xm[, 1] = xm[, 1] + mu[1]
    xm[, 2] = xm[, 2] + mu[2]
    plot(xm[, 2] ~ xm[, 1], pch = " ")
    lines(xm[, 2] ~ xm[, 1])
    title(main = paste("Chi-sq Probability ", p))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
