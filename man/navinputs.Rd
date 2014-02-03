\name{bsNavDateRangeInput}
\alias{bsNavDateRangeInput}
\alias{bsNavDateInput}
\alias{bsNavTextInput}
\title{
  NavBar Versions of Shiny Inputs
}
\description{
  These are stanard shiny inputs that have been slightly reworked to fit better into navbar objects
}
\usage{
bsNavDateRangeInput(inputId, label, start = NULL, end = NULL, min = NULL, max = NULL, format = "yyyy-mm-dd", startview = "month", weekstart = 0, language = "en", width = NULL)
bsNavDateInput(inputId, label, value = NULL, min = NULL, max = NULL, format = "yyyy-mm-dd", startview = "month", weekstart = 0, language = "en", width = NULL)
bsNavTextInput(inputId, label, value = "", width=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{inputId}{
    The id of the shiny object
}
  \item{label}{
    Text to appear as placeholder in text object
}
  \item{start}{
    See \code{\link{dateRangeInput}}
}
  \item{end}{
    See \code{\link{dateRangeInput}}
}
  \item{value}{
    See \code{\link{dateInput}} or \code{\link{textInput}}
  }
  \item{min}{
    See \code{\link{dateRangeInput}} or \code{\link{dateInput}}
}
  \item{max}{
    See \code{\link{dateRangeInput}} or \code{\link{dateInput}}
}
  \item{format}{
    See \code{\link{dateRangeInput}} or \code{\link{dateInput}}
}
  \item{startview}{
    See \code{\link{dateRangeInput}} or \code{\link{dateInput}}
}
  \item{weekstart}{
    See \code{\link{dateRangeInput}} or \code{\link{dateInput}}
}
  \item{language}{
    See \code{\link{dateRangeInput}} or \code{\link{dateInput}}
}
  \item{width}{
  Optional width of element in pixels 
}
}
\details{
  These are identical to the regular shiny inputs with the exception of an added 'width arguement that allows the designer more control over their size and removal of labels in favor of 'placeholder' text which also saves room in the navbar.
}

\author{
  Eric Bailey
}

\seealso{
  \code{\link{dateInput}}
  \code{\link{dateRangeInput}}
  \code{\link{textInput}}
  \code{\link{actionButton}}
}

\examples{
  \dontrun{coming soon}
}
