\name{bsNavBar}
\alias{bsNavBar}
\alias{updateNavBar}
\title{
  Twitter Bootstrap Navbar
}
\description{
  Create and modify a shell for a Twitter Bootstrap Navbar that can hold shiny input (and output) elements.
}
\usage{
bsNavBar(inputId, brand, ..., rightItems, fixed = FALSE, inverse = FALSE)
updateNavBar(session, inputId, brand=NULL, fixed=NULL, inverse=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}
  }

  \item{inputId}{
    Input variable to assign the control's value to
  }
  \item{brand}{
    A word or two that will appear at the left of the navbar
}
  \item{\dots}{
    UI elements to include within the navbar. These will align to the left
}
  \item{rightItems}{
    a \code{list} of UI elements you wish to align to the right
}
  \item{fixed}{
    Should the navbar be fixed to the top of the page \code{logical}
}
  \item{inverse}{
    Should the inverse navbar style be used \code{logical}
}

}

\references{
  \href{http://getbootstrap.com/2.3.2/components.html}{Navbars for Twitter Bootstrap 2.3.2}
}
\author{
  Eric Bailey
}
\note{
  Run \code{bsDemo()} for a live example of navBars.
}

\examples{
\dontrun{

  ## In ui.R
  ## Create a navBar with the brand "shinyBS" that is fixed to the top of the page
  bsNavBar("nb1", brand="shinyBS", fixed=TRUE, 
           leftItems = list(<misc navbar elements>),
           rightItems = list(<more navbar elements>))
           
  ## In server.R
  ## Change to the inverse style of navBar
  modifyNavBar(session, inputId="nb1", inverse=TRUE)
}
}
