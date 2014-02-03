\name{bsNavToggleLink}
\alias{bsNavToggleLink}
\alias{updateToggleLink}
\title{
  Twitter Bootstrap Navbar Toggle Link
}
\description{
  A Navbar link that works like a checkbox input, with an on and off state.
}
\usage{
bsNavToggleLink(inputId, label, value = FALSE)
updateToggleLink(session, inputId, label = NULL, value = NULL)
}

\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}
  }

  \item{inputId}{
    Input variable to assign the control's value to
  }

  \item{label}{
    The label that will appear on the object
  }

  \item{value}{
    The value to set for the input object \code{logical}
  }
}

\details{
  The toggle link is meant as an alternative to checkboxes in a navbar. It will toggle between \code{TRUE} and \code{FALSE} when clicked.
}

\references{
\href{http://getbootstrap.com/2.3.2/components.html\#navbar}{Navbars for Twitter Bootstrap 2.3.2}
}

\author{
Eric Bailey
}

\note{
  Run \code{bsDemo()} for a live example of alerts.
}

\examples{
\dontrun{
  ## In ui.R
  ## Add a toggleLink to a navbar
  bsNavToggleLink(inputId="tl1", label="Log Scale", value = FALSE)
  
  ## In server.R
  ## Change the value of the created toggleLink to TRUE
  updateToggleLink(session, inputId="tl1", value = TRUE)
}
}
