\name{pageWithNavBar}
\alias{pageWithNavBar}
\title{
Create a page with a NavBar
}
\description{
Create a shiny UI that contains a navbar for input controls and a main area for outputs.
}
\usage{
pageWithNavBar(title = "", navbar, mainContent)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{title}{
    The title to appear in the browsers application bar.
}
  \item{navbar}{
    A navbar created with \code{\link{bsNavBar}}
}
  \item{mainContent}{
    Outputs for the application
}
}
\author{
  Eric Bailey
}
