\name{bsDemo}
\alias{bsDemo}
\alias{bsShowcase}
\title{
  Examples of shinyBS functionality
}
\description{
  Example apps that show functionality of shinyBS. \code{bsDemo} has an example of every function with some explanation. \code{bsShowcase} is an example app that shows possible real-world usage of shinyBS functions.
}
\usage{
    bsDemo(port = NULL, 
           launch.browser = getOption("shiny.launch.browser", interactive()))
bsShowcase(port = NULL, 
           launch.browser = getOption("shiny.launch.browser", interactive()))
}
\arguments{
  \item{port}{
    The TCP port that the application should listen on. Defaults to choosing a random port.
}
  \item{launch.browser}{
    If true, the system's default web browser will be launched automatically after the app is started. Defaults to true in interactive sessions only. This value of this parameter can also be a function to call with the application's URL.
}
}
\author{
  Eric Bailey
}
\note{
  Just a wrapper for shiny's \code{runApp} to make demoing easier
}

\seealso{
  \code{\link{runApp}}
  \cr
  \code{\link{runExample}}
}
\examples{

\dontrun{
  bsDemo()
  bsShowcase()}
}
