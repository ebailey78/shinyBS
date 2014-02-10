\name{shinyBS Examples}
\alias{bsDemo}
\title{
  Examples of shinyBS functionality
}
\description{
  Example app that shows functionality of shinyBS. 
}
\usage{
    bsDemo(port = NULL, 
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
  bsDemo()}
}
