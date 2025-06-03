\name{cipi}
\alias{cipi}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Confidence Interval and Predictive Interval for Regression
%%  ~~function to do ... ~~
}
\description{
Computes a confidence interval and predictive interval for regression; see Section 9.4 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
cipi(fit, hmat, alpha = 0.05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fit}{
%%     ~~Describe \code{fit} here~~
}
  \item{hmat}{
%%     ~~Describe \code{hmat} here~~
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
function (fit, hmat, alpha = 0.05) 
{
    hmat <- as.matrix(hmat)
    k <- length(hmat[, 1])
    n <- length(fit$resid)
    p <- length(fit$coef)
    df <- n - p
    sfit <- summary(fit)
    sig <- sfit$sigma
    vc <- sfit$cov.unscaled
    beta <- fit$coef
    tc <- abs(qt(alpha/2, df))
    matci <- matrix(rep(0, 4 * k), ncol = 4)
    matpi <- matrix(rep(0, 4 * k), ncol = 4)
    for (i in 1:k) {
        h <- hmat[i, ]
        theta <- t(h) \%*\% beta
        seci <- sig * sqrt(t(h) \%*\% vc \%*\% h)
        lci <- theta - tc * seci
        uci <- theta + tc * seci
        matci[i, ] <- c(theta, seci, lci, uci)
        sepi <- sig * sqrt(1 + t(h) \%*\% vc \%*\% h)
        lpi <- theta - tc * sepi
        upi <- theta + tc * sepi
        matpi[i, ] <- c(theta, sepi, lpi, upi)
    }
    matcipi <- cbind(matci, matpi)
    colnames(matcipi) <- c("Pred", "SECI", "LCI", "UCI", "Pred", 
        "SEPI", "LPI", "UPI")
    return(matcipi)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
