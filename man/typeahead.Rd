\name{bsTypeAhead}
\alias{bsTypeAhead}
\alias{updateTypeAhead}
\alias{bsNavTypeAhead}
\title{
  Twitter Bootstrap TypeAheads
}
\description{
  Functions to add and update Twitter Bootstrap TypeAhead text inputs in shiny.
}
\usage{
bsTypeAhead(inputId, label, value = "", choices, items = 8, minLength = 1)
bsNavTypeAhead(inputId, label, value = "", choices, 
               items = 8, minLength = 1, width = NULL)
updateTypeAhead(session, inputId, label=NULL, value=NULL, choices=NULL)
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
    The value to set for the input object
  }
  \item{choices}{
    A list of choices that will appear as the user types.
}
  \item{items}{
    The maximum number of typeahead choices to show at a given time.
}
  \item{minLength}{
    The minimum number of characters the user must type before the typeahead choices appear.
}
  \item{width}{
    The width, in pixels, of the text input
  }
}
\details{
  \code{bsTypeAhead} creates a text box that will start displaying items in \code{choices} as the user types similar inputs. It looks and behaves as a \code{textInput} object otherwise.\cr\cr
  \code{bsNavTypeAhead} is meant for use inside a \code{bsNav} object. The main difference is that the value of \code{label} is placed into the \code{placeholder} attribute of the \code{input} object. This saves space in the navbar.
  \code{updateNavBar} will update a \code{bsTypeAhead} or \code{bsNavTypeAhead} object, allowing the user to change the label, value, or choices.
}
\references{
  \href{http://getbootstrap.com/2.3.2/javascript.html\#typeahead}{Typeahead for Twitter Bootstrap 2.3.2}
}
\author{
Eric Bailey
}
\note{
  Run \code{bsDemo()} for a live example of typeAheads.
}

\examples{
\dontrun{

  ## In ui.R
  ## Create a standalone typeahead that contains a predefined list of fruits
  ## as choices
  bsTypeAhead(inputId = "ta1", label = "Choose a fruit", choices = fruits)
  ## Create the same typeahead in a navbar, with a width of 100px.
  bsNavTypeAhead(inputId = "ta2", label = "Fruits", choices = fruits, width = 100)
  
  ## In server.R
  ## Update the second typeAhead to a list of vegetables, update label to reflect change
  updateTypeAhead("ta2", choices=veggies, label="Vegetables")
}

}
