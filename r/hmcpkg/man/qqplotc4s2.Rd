\name{qqplotc4s2}
\alias{qqplotc4s2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
QQ Plots in Chapter 4
%%  ~~function to do ... ~~
}
\description{
Computes QQ Plots in Chapter 4 Section 2 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
qqplotc4s2(vec)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{vec}{
%%     ~~Describe \code{vec} here~~
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
function (vec) 
{
    n <- length(vec)
    ps <- (1:n)/(n + 1)
    normalqs <- qnorm(ps)
    y <- sort(vec)
    par(mfrow = c(2, 2))
    boxplot(y, ylab = "x")
    title(main = "Panel A")
    plot(normalqs, y, xlab = "Normal quantiles", ylab = "Sample quantiles")
    title(main = "Panel B", xlab = "Normal quantiles", ylab = "Sample quantiles")
    plot(qlaplace(ps), y, xlab = "Laplace quantiles", ylab = "Sample quantiles")
    title(main = "Panel C")
    plot(qexp(ps), y, xlab = "Exponential quantiles", ylab = "Sample quantiles")
    title(main = "Panel D")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
