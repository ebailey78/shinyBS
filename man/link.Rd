\name{bsNavLink}
\alias{bsNavLink}

\title{
  Twitter Boostrap Navbar Links
}
\description{
  Functions to create Twitter Bootstrap Navbar Links
}
\usage{
bsNavLink(inputId, label, href = "#")
}
\arguments{
  \item{inputId}{
      The id of the input object.
  }
    \item{label}{
    The label that will appear on the link/button.
  }
    \item{href}{
    Optional web address for the link
  }
}
\details{
  Works as an \link{actionButton} but can also be used as a regular web link if \code{href} is provided.
}

\references{
\href{http://getbootstrap.com/2.3.2/components.html}{Navbars for Twitter Bootstrap 2.3.2}
}
\author{
Eric Bailey
}


\note{
  Run \code{bsDemo()} for a live example of navLinks.
}

\examples{
\dontrun{

  ## In ui.R
  ## Create a navLink that acts as an action button:
  bsNavLink(inputId = "link1", label="Run Example")
  ## Create a navLink that acts as a link:
  bsNavLink(inputId = "link2", label="Google", href="http://www.google.com")
}
}
