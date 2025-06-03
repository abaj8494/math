\name{plotsulfur}
\alias{plotsulfur}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plots for Sulfurdioxide Data
%%  ~~function to do ... ~~
}
\description{
Computes Plots for Sulfurdioxide Data; see Chapter 4 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plotsulfur()
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
    load("sulfurdio.rda")
    postscript("histsulfur.ps")
    hist(sulfurdioxide, xlab = "Sulfurdioxide", ylab = " ", pr = T, 
        ylim = c(0, 0.04), cex.main = 1.25)
    lines(density(sulfurdioxide))
    y = dnorm(sulfurdioxide, 53.91667, 10.07371)
    lines(y ~ sulfurdioxide, lty = 2)
    dev.off()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
