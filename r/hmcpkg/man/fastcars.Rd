\name{fastcars}
\alias{fastcars}
\docType{data}
\title{
Fast Cars
%%   ~~ data name/kind ... ~~
}
\description{
Fast Cars data set Data Set, see Chapter 9 of HMC.
Kitchens (1997) discusses an experiment concerning the speed of cars.
Five cars are considered:  Acura (1),  Ferrari (2),  Lotus (3),  Porsche (4), and  Viper (5).
For each car, 6 runs were made, 3 in each direction.
For each run, the speed recorded is the maximum speed on the run achieved without exceeding
the engine's redline.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("fastcars")}
\format{
  A data frame with two variables: speed and ind (car indicator).
  \describe{
    \item{\code{ind}}{car indicator}
    \item{\code{speed}}{a numeric vector}
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

 Kitchens, L. J. (1997),
\emph{Exploring Statistics: A Modern Introduction to Data Analysis and Inference, 2nd ed.}, 
Wadsworth.

%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(fastcars)
## maybe str(fastcars) ; plot(fastcars) ...
}
\keyword{datasets}
