\name{crimealk}
\alias{crimealk}
\docType{data}
\title{
Crime and Alcoholic Status
%%   ~~ data name/kind ... ~~
}
\description{
Crime and Alcoholic Status, Exercise in Section 4.7 of HMC.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("crimealk")}
\format{
  The format is:
 num [1:6, 1:2] 50 88 155 379 18 63 43 62 110 300 ...
 - attr(*, "dimnames")=List of 2
  ..$ : chr [1:6] "arson" "rape" "violence" "theft" ...
  ..$ : chr [1:2] "drinker" "nondrinker"
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
data(crimealk)
## maybe str(crimealk) ; plot(crimealk) ...
}
\keyword{datasets}
