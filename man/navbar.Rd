\name{bsNavBar}
\alias{bsNavBar}
\alias{modifyNavBar}
\title{
  Twitter Bootstrap NavBar for Shiny
}
\description{
  Create and modify a shell for a Twitter Bootstrap navbar that can hold shiny input (and output) elements.
}
\usage{
bsNavBar(inputId, brand, leftItems, rightItems, fixed = FALSE, bottom = FALSE, inverse = FALSE)
modifyNavBar(session, inputId, brand=NULL, fixed=NULL, inverse=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}.
  }
  \item{inputId}{
    The id of the navbar object.
}
  \item{brand}{
    A word or two that will appear at the left of the navbar.
}
  \item{leftItems}{
    A list of items that will appear on the left of the navbar
}
  \item{rightItems}{
    A list of items that will appear on the right of the navbar
}
  \item{fixed}{
    Should the navbar be fixed to the top of the page? \code{logical}
}
  \item{inverse}{
    Should the inverse navbar style be used? \code{logical}
}
}
\details{
  
}
\references{
  \href{http://getbootstrap.com/2.3.2/components.html#navbar}{Navbars for Twitter Bootstrap 2.3.2}
}
\author{
  Eric Bailey
}

\examples{

}
