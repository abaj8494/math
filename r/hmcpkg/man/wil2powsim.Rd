\name{wil2powsim}
\alias{wil2powsim}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Power Simulator for Two-Sample Wilcoxon Test
%%  ~~function to do ... ~~
}
\description{
Power Simulator for Two-Sample Wilcoxon Test; see Page 605 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
wil2powsim(n1, n2, nsims, eps, vc, Delta = 0, alpha = 0.05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n1}{
%%     ~~Describe \code{n1} here~~
}
  \item{n2}{
%%     ~~Describe \code{n2} here~~
}
  \item{nsims}{
%%     ~~Describe \code{nsims} here~~
}
  \item{eps}{
%%     ~~Describe \code{eps} here~~
}
  \item{vc}{
%%     ~~Describe \code{vc} here~~
}
  \item{Delta}{
%%     ~~Describe \code{Delta} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
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
function (n1, n2, nsims, eps, vc, Delta = 0, alpha = 0.05) 
{
    indwil <- 0
    indt <- 0
    for (i in 1:nsims) {
        x <- rcn(n1, eps, vc)
        y <- rcn(n2, eps, vc) + Delta
        if (wilcox.test(y, x)$p.value <= alpha) {
            indwil <- indwil + 1
        }
        if (t.test(y, x, var.equal = T)$p.value <= alpha) {
            indt <- indt + 1
        }
    }
    powwil <- sum(indwil)/nsims
    powt <- sum(indt)/nsims
    return(c(powwil, powt))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
