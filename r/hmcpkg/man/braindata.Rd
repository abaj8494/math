\name{braindata}
\alias{braindata}
\docType{data}
\title{
Data on the Brain MRI Count
%%   ~~ data name/kind ... ~~
}
\description{
Data on the brain MRI count; see page 237 of HMC.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("braindata")}
\format{
  A data frame with 40 observations on the following 7 variables.
  \describe{
    \item{\code{Gender}}{a factor with levels \code{Female} \code{Male}}
    \item{\code{FSIQ}}{a numeric vector}
    \item{\code{VIQ}}{a numeric vector}
    \item{\code{PIQ}}{a numeric vector}
    \item{\code{Weight}}{a numeric vector}
    \item{\code{Height}}{a numeric vector}
    \item{\code{MRI_Count}}{a numeric vector}
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

%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(braindata)
## maybe str(braindata) ; plot(braindata) ...
}
\keyword{datasets}
