\name{ttable}
\alias{ttable}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates t-Table of Critical Values
%%  ~~function to do ... ~~
}
\description{
Generates t-Table of Critical Values in HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ttable()
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
    ps = c(0.9, 0.925, 0.95, 0.975, 0.99, 0.995, 0.999)
    df = 1:30
    tab = c()
    for (r in df) {
        tab = rbind(tab, qt(ps, r))
    }
    df = c(df, Inf)
    nq = qnorm(ps)
    tab = rbind(tab, nq)
    tab = cbind(df, tab)
    return(tab)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
