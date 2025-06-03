\name{tempbygender}
\alias{tempbygender}
\docType{data}
\title{
Temperature by Gender
%%   ~~ data name/kind ... ~~
}
\description{
Verzani (2014) discusses a data set on healthy individuals, including their temperatures
by gender.
See Section 8.3 of HMC.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("tempbygender")}
\format{
  A data frame with  the following 2 variables.
  \describe{
    \item{\code{temp}}{a numeric vector}
    \item{\code{gender}}{a numeric vector}
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

Verzani, J. (2014), \emph{Usng R for Introductory Statistics, 2nd Ed.}, Bocs Raton, FL: Chapman-Hall.

%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(tempbygender)
## maybe str(tempbygender) ; plot(tempbygender) ...
}
\keyword{datasets}
