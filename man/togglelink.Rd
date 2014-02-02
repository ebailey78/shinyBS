\name{bsNavToggleLink}
\alias{bsNavToggleLink}
\alias{updateToggleLink}
\title{
  Twitter Bootstrap NavBar Toggle Link
}
\description{
  A navbar link that works like a checkbox input, with an on and off state.
}
\usage{
bsNavToggleLink(inputId, label, value = FALSE)
updateToggleLink(session, inputId, label = NULL, value = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
The \code{session} object passed to function given to \code{shinyServer}.
}
  \item{inputId}{
The id of the input object.
}
  \item{label}{
The label that will appear on the link.
}
  \item{value}{
  Initial value of the toggle link. \code{logical}
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

\examples{
  \dontrun{Coming Soon}
}
