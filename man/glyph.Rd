\name{bsGlyph}
\alias{bsGlyph}

\title{
  Glyphicons
}
\description{
   Add glyphicons to shiny applications
}
\usage{
bsGlyph(name, white = FALSE)
}
\arguments{
  \item{name}{
    The name of the glyphicon to be used
}
  \item{white}{
    Should the white version be used. (\code{logical})
}
}
\details{
  See the references to find names of available icons
}
\references{
  \href{http://getbootstrap.com/2.3.2/base-css.html\#icons}{Glyphicons for Twitter Bootstrap 2.3.2}
  \href{http://glyphicons.com/}{Glyphicons}
}
\author{
Eric Bailey
}

\examples{
\dontrun{

  ##Add a bsNavLink with a question mark graphic
  bsNavLink("link1", label = bsGlyph("icon-question-sign"))
  }
}