\name{pltlogF}
\alias{pltlogF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plots for Log F Distribution
%%  ~~function to do ... ~~
}
\description{
Computes Plots for Log F Distribution; see Chapter 4 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pltlogF()
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
    postscript("newfig8sect17.ps")
    x <- seq(-8, 22, 0.01)
    y <- dlogF(x)
    plot(x, y, axes = F, xlab = " ", ylab = " ", type = "l")
    q1 <- qlogF(0.25)
    q2 <- qlogF(0.5)
    q3 <- qlogF(0.75)
    d1 <- dlogF(q1)
    d2 <- dlogF(q2)
    d3 <- dlogF(q3)
    axis(2, at = c(0, d2, d3), labels = c(" ", "0.10", "0.05"), 
        pos = -8)
    axis(1, at = c(-8, q1, q2, q3), labels = c("-8", expression(italic(bold(q[1]))), 
        expression(italic(bold(q[2]))), expression(italic(bold(q[3])))), 
        pos = 0, cex = 2)
    segments(q1, 0, q1, d1, cex = 2)
    segments(q2, 0, q2, d2, cex = 2)
    segments(q3, 0, q3, d3, cex = 2)
    arrows(q3, 0, 22, 0)
    arrows(-8, d2, -8, 0.113)
    text(23, -5e-04, expression(italic(x)), cex = 1.2)
    text(-8, 0.116, expression(italic(f(x))), cex = 1.2)
    dev.off()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
