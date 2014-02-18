\name{DropDowns}
\alias{updateDropDown}
\alias{bsNavDropDown}
\title{
  Twitter Bootstrap NavBar Dropdowns
}
\description{
  Add and update Twitter Bootstrap NavBar Dropdowns in shiny.
}
\usage{
bsNavDropDown(inputId, label, choices, selected="")
updateDropDown(session, inputId, label = NULL, choices = NULL, selected = NULL)
}
%- maybe also 'usage' for other objects documented here.
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
  \item{choices}{
    A list of values to appear in the dropdown
}
  \item{selected}{
    The value to set for the input object
}
}
\details{
  Dropdowns are an alternative to \code{\link{selectInput}} objects that can appear in a navBar. The structure of the function to create and update them has been modeled after that function.\cr\cr
  A dropdown returns the value of the last dropdown element in its \code{choices} link that has been clicked.
}

\references{
\href{http://getbootstrap.com/2.3.2/components.html}{Navbars for Twitter Bootstrap 2.3.2}
\href{http://getbootstrap.com/2.3.2/components.html}{Dropdowns for Twitter Bootstrap 2.3.2}
}
\author{
  Eric Bailey
}
\note{
  Run \code{bsDemo()} for a live example of alerts.
}
\seealso{
  \code{\link{selectInput}}
}
\examples{
\dontrun{

  ## In ui.R
  ## Create a dropdown
  bsNavDropDown(inputId = "dd1", label = "Distribution", 
                choices = c("Normal", "Lognormal", "Gamma"),
                selected = "Normal")
                
  ## In server.R
  ## Add another distribution to the list
  updateDropDown("dd1" choices = c("Normal", "Lognormal", "Gamma", "Exponential"))
}


}
