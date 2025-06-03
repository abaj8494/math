\name{hcplot}
\alias{hcplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Bar Plot for Hair Color of Scottish Children
%%  ~~function to do ... ~~
}
\description{
Bar Plot for Hair Color of Scottish Children; see Chapter 4 of HMC.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hcplot()
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
    load("scotteyehair.rda")
    vec = apply(scottish, 2, sum)
    n = sum(vec)
    vecs = sort(vec, decreasing = T)
    vecs = vecs/n
    nms = c("Medium", "Fair", "Dark", "Red", "Black")
    postscript("c4s1egs1.ps")
    barplot(vecs, beside = TRUE, names.arg = nms, ylab = "", 
        xlab = "Haircolor", cex.lab = 1.8)
    title("Bar Chart of Haircolor of Scottish Schoolchildren", 
        cex.main = 1.25)
    dev.off()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
