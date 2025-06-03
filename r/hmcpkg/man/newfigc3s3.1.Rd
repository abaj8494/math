\name{newfigc3s3.1}
\alias{newfigc3s3.1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plots for Gamma Distributions
%%  ~~function to do ... ~~
}
\description{
Plots for Gamma Distributions, used in Section 3.3 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
newfigc3s3.1()
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
    postscript("nfigc3s3.1.ps", pointsize = 14)
    dumx <- runif(100, 0, 15)
    dumy <- runif(100, 0, 0.3)
    par(mfrow = c(2, 1))
    plot(dumx, dumy, axes = T, xlim = c(0, 15), ylim = c(0, 0.3), 
        pch = " ", xlab = expression(x), ylab = expression(f(x)))
    x <- seq(0, 34, 0.1)
    y <- dgamma(x, shape = 0.25, scale = 4)
    lines(x, y)
    text(2.3, 0.25, expression(paste(alpha, " = .25")), cex = 2)
    y <- dgamma(x, shape = 0.5, scale = 4)
    lines(x, y)
    text(1, 0.04, expression(paste(alpha, " = .5")), cex = 2)
    y <- dgamma(x, shape = 1, scale = 4)
    lines(x, y)
    text(6, 0.1, expression(paste(alpha, " = 1")), cex = 2)
    title(main = expression(paste(beta, " = 4")), cex = 2)
    dumx <- runif(100, 0, 34)
    dumy <- runif(100, 0, 0.13)
    plot(dumx, dumy, axes = T, xlim = c(0, 34), ylim = c(0, 0.12), 
        pch = " ", xlab = "x", ylab = "f(x)")
    title(main = expression(paste(alpha, " = 4")), cex = 2)
    y <- dgamma(x, shape = 4, scale = 2)
    lines(x, y)
    text(10, 0.1, expression(paste(beta, " = 2")), cex = 2)
    y <- dgamma(x, shape = 4, scale = 3)
    lines(x, y)
    text(14, 0.07, expression(paste(beta, " = 3")), cex = 2)
    y <- dgamma(x, shape = 4, scale = 4)
    lines(x, y)
    text(22, 0.04, expression(paste(beta, " = 4")), cex = 2)
    dev.off()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
