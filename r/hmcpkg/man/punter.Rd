\name{punter}
\alias{punter}
\docType{data}
\title{
Punter Data Set
%%   ~~ data name/kind ... ~~
}
\description{
Punter Data Set, see page 562 of Rasmussen and page 630 of HMC.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("punter")}
\format{
The response is the variable distance:  Average distance of 10 punts kicked by 13 football players.
The remaining variables are possible predictors.
  \describe{
    \item{\code{distance}}{a numeric vector}
    \item{\code{strength}}{a numeric vector}
    \item{\code{hangtime}}{a numeric vector}
    \item{\code{lf}}{a numeric vector}
    \item{\code{llstrength}}{a numeric vector}
    \item{\code{rf}}{a numeric vector}
    \item{\code{rlstrength}}{a numeric vector}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
Hogg, R.V., McKean, J.W. and Craig, A.T. (2018), \emph{Introduction to Mathematical Statistics, 8th Ed.}, Pearson: Boston.

Rasmussen, S. (1992), \emph{An Introduction to Statistics with Data Analysis}, Belmont, CA: Brroks/Cole.
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(punter)
## maybe str(punter) ; plot(punter) ...
}
\keyword{datasets}
