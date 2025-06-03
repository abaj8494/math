\name{onesampsgn}
\alias{onesampsgn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sign Analysis
%%  ~~function to do ... ~~
}
\description{
Sign Analysis of a single sample; see Chapters 4 and a0 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
onesampsgn(x, test = F, alt = 0, theta0 = 0, alpha = 0.05, maktable = T, plotb = F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{test}{
%%     ~~Describe \code{test} here~~
}
  \item{alt}{
%%     ~~Describe \code{alt} here~~
}
  \item{theta0}{
%%     ~~Describe \code{theta0} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
}
  \item{maktable}{
%%     ~~Describe \code{maktable} here~~
}
  \item{plotb}{
%%     ~~Describe \code{plotb} here~~
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
function (x, test = F, alt = 0, theta0 = 0, alpha = 0.05, maktable = T, 
    plotb = F) 
{
    n = length(x)
    ind = rep(0, n)
    ind[x == theta0] = 1
    n = n - sum(ind)
    if (test) {
        ts = sum(sign(x - theta0))
        zp = (ts - 1)/sqrt(n)
        zn = (ts + 1)/sqrt(n)
        if (alt == 1) {
            pval = 1 - pnorm(zp)
            zs = zp
        }
        if (alt == -1) {
            pval = pnorm(zn)
            zs = zn
        }
        if (alt == 0) {
            if (ts >= 0) {
                pval = 2 * (1 - pnorm(zp))
                zs = zp
            }
            else {
                pval = 2 * pnorm(zn)
                zs = zn
            }
        }
    }
    n = length(x)
    est = median(x)
    xs = sort(x)
    crit = -qnorm(alpha/2)
    cut = round((n/2) - crit * sqrt(n/4) - 0.5)
    if (cut < 0) {
        cut = 0
    }
    lci = xs[cut + 1]
    uci = xs[n - cut]
    acconf = 1 - 2 * pbinom(cut, n, 1/2)
    tau = (sqrt(n) * (uci - lci))/(2 * crit)
    if (maktable) {
        if (test) {
            cat("\n")
            cat("Results for the Sign procedure", "\n")
            if (alt == 0) {
                cat("Test of theta =", theta0, " versus theta not equal to ", 
                  theta0, "\n")
            }
            if (alt == 1) {
                cat("Test of theta =", theta0, " versus theta greater than ", 
                  theta0, "\n")
            }
            if (alt == -1) {
                cat("Test of theta =", theta0, " versus theta less than ", 
                  theta0, "\n")
            }
            cat("Test stat. S is", ts, " Standardized (z) Test-Stat.", 
                zs, "p-value", pval, "\n")
            cat("\n")
        }
        cat("Estimate ", est, " SE is ", tau/sqrt(n), "\n")
        pct = 100 * (1 - alpha)
        cat(pct, "\%", "Confidence Interval is ", "(", lci, ",", 
            uci, ")", "\n")
        cat("    Actual Confidence  is ", acconf, "\n")
        cat("Estimate of the scale parameter tau", tau, "\n")
        cat("\n", "This CI is the asymptotic form, see Hettmansperger and McKean (2011)", 
            "\n")
    }
    if (plotb) {
        boxplot(x, notch = T)
        title(main = "95\% Notched Boxplot of Data")
    }
    if (test == T) {
        list(ts = ts, zs = zs, pval = pval, est = est, lci = lci, 
            uci = uci, acconf = acconf, tau = tau)
    }
    else {
        list(est = est, lci = lci, uci = uci, acconf = acconf, 
            tau = tau)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
