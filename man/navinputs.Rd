\name{NavBar Inputs}
\alias{bsNavDateRangeInput}
\alias{bsNavDateInput}
\alias{bsNavTextInput}
\alias{bsNavButton}
\title{
  NavBar Versions of Shiny Inputs
}
\description{
  These are stanard shiny inputs that have been slightly reworked to fit better 
  into navBars
}
\usage{
bsNavDateRangeInput(inputId, label, start = NULL, end = NULL, min = NULL, 
                    max = NULL, format = "yyyy-mm-dd", startview = "month", 
                    weekstart = 0, language = "en", width = NULL)
bsNavDateInput(inputId, label, value = NULL, min = NULL, max = NULL, 
               format = "yyyy-mm-dd", startview = "month", weekstart = 0, 
               language = "en", width = NULL)
bsNavTextInput(inputId, label, value = "", width=NULL)
bsNavButton(inputId, label)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{inputId}{
    Input variable to assign the control's value to
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
  These are identical to the regular shiny inputs with the exception of an 
  added 'width' arguement that allows the designer more control over their 
  size and removal of labels in favor of 'placeholder' text which also saves 
  room in the navbar. \cr \cr
  The update functions for the standard inputs also work for their navBar 
  versions.
}

\author{
  Eric Bailey
}

\seealso{
  \code{\link{dateInput}} \cr
  \code{\link{dateRangeInput}} \cr
  \code{\link{textInput}} \cr
  \code{\link{actionButton}} \cr
}

\note{
  Run \code{bsDemo()} for a live example of navBar elements.
}

\examples{
\dontrun{See original versions for examples}
}