\name{conductivity}
\alias{conductivity}
\docType{data}
\title{
Thermal Conductivity of an Asphalt Mix
%%   ~~ data name/kind ... ~~
}
\description{
A study concerning the effects to the thermal conductivity of an asphalt mix  due to two factors: Binder Grade at 
three different levels (PG58, PG64, and PG70) and Coarse Aggregrate Content at three levels (38, 41, and 44). 
The response is Conductivity.  See Section 9.5 of HMC and page of Devore (2012).
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("conductivity")}
\format{
  \describe{
    \item{\code{Conductivity}}{a numeric vector}
    \item{\code{Binder}}{a factor with levels \code{PG58} \code{PG64} \code{PG70}}
    \item{\code{Aggregrate}}{a factor with levels \code{38} \code{41} \code{44}}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
Devore, J. L. (2012), \emph{Probability and  Statistics, 8th Ed.},
Boston: Brooks/Cole.

Hogg, R.V., McKean, J.W. and Craig, A.T. (2018), \emph{Introduction to Mathematical Statistics, 8th Ed.}, Pearson: Boston.
%%  ~~ possibly secondary sources and usages ~~
}

\examples{
data(conductivity)
## maybe str(conductivity) ; plot(conductivity) ...
}
\keyword{datasets}
