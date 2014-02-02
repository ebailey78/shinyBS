\name{bsNavLink}
\alias{bsNavLink}
\alias{bsNavButton}

\title{
  Twitter Boostrap NavBar Links and Buttons
}
\description{
  Functions to create Twitter Bootstrap NavBar Links and Buttons
}
\usage{
bsNavLink(inputId, label, href = "#")
bsNavButton(inputId, label)
}
%- maybe also 'usage' for other objects documented here.
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
  Both work as an \link{actionButton} but \code{bsNavLink}can also be used as a regular web link.
}

\references{
\href{http://getbootstrap.com/2.3.2/components.html\#navbar}{Navbars for Twitter Bootstrap 2.3.2}
\href{http://getbootstrap.com/2.3.2/base-css.html\#buttons}{Buttons for Twitter Bootstrap 2.3.2}
}
\author{
Eric Bailey
}

\examples{
  \dontrun{Coming Soon}
}
