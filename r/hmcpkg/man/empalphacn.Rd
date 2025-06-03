\name{empalphacn}
\alias{empalphacn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Empirical Alpha for a t-test when sampling from a contaminated normal
%%  ~~function to do ... ~~
}
\description{
Empirical Alpha for a t-test when sampling from a contaminated normal; see page 298 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
empalphacn(nsims)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nsims}{
%%     ~~Describe \code{nsims} here~~
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
function (nsims) 
{
    sigmac <- 25
    eps <- 0.25
    alpha <- 0.05
    n <- 20
    tc <- qt(1 - alpha, n - 1)
    ic <- 0
    for (i in 1:nsims) {
        samp <- rcn(n, eps, sigmac)
        ttest <- (sqrt(n) * mean(samp))/var(samp)^0.5
        if (ttest > tc) {
            ic <- ic + 1
        }
    }
    empalp <- ic/nsims
    err <- 1.96 * sqrt((empalp * (1 - empalp))/nsims)
    list(empiricalalpha = empalp, error = err)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
