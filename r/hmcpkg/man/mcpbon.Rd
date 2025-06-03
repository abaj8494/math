\name{mcpbon}
\alias{mcpbon}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Bonferroni Multiple Comparisons
%%  ~~function to do ... ~~
}
\description{
Bonferroni Multiple Comparisons function; see Chapter 9 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
mcpbon(y, ind, alpha = 0.05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{ind}{
%%     ~~Describe \code{ind} here~~
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
%% ~put references to the literature/web site here ~
Hogg, R.V., McKean, J.W. and Craig, A.T. (2018), \emph{Introduction to Mathematical Statistics, 8th Ed.}, Pearson: Boston.
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
function (y, ind, alpha = 0.05) 
{
    k <- max(ind)
    alphap = alpha/choose(k, 2)
    tab <- c()
    fit <- lm(y ~ factor(ind))
    sig <- summary(fit)$sigma
    df <- length(y) - k
    l <- choose(k, 2)
    tc <- abs(qt(alpha/(2 * l), df))
    for (j in 1:(k - 1)) {
        for (jp in (j + 1):k) {
            see <- t.test(y[ind == j], y[ind == jp], conf.level = (1 - 
                alphap))
            mu1 <- see$estimate[1]
            mu2 <- see$estimate[2]
            n1 <- length(ind[ind == j])
            n2 <- length(ind[ind == jp])
            est <- mu1 - mu2
            se <- sig * sqrt((1/n1) + (1/n2))
            err <- tc * se
            lb <- est - err
            ub <- est + err
            rt <- c(j, jp, mu1, mu2, est, se, err, lb, ub)
            tab <- rbind(tab, rt)
        }
    }
    colnames(tab) <- c("j", "jp", "muj", "mujp", "diff", "se", 
        "err", "lb", "ub")
    rownames(tab) <- rep(" ", l)
    return(tab)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
