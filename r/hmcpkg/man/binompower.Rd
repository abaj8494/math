\name{binompower}
\alias{binompower}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Binomial Power Function
%%  ~~function to do ... ~~
}
\description{
Plots Binomial Power Function; see page 270 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
binompower()
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
    n <- 20
    k1 <- 11
    k2 <- 12
    p0 <- 0.7
    x <- seq(0.4, 1, 0.01)
    pow1 <- pbinom(k1, n, x)
    pow2 <- pbinom(k2, n, x)
    plot(x, pow2, xlab = "p", ylab = expression(gamma(p)), ylim = c(0, 
        1), xlim = c(0.35, 1), type = "l", lty = 2)
    lines(x, pow1, lty = 1)
    title("Power Functions for Binomial Tests")
    text(0.72, 0.4, "Level 0.23")
    text(0.54, 0.4, "Level 0.11")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
