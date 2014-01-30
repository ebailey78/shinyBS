\name{bsTypeAhead}
\alias{bsTypeAhead}
\alias{updateTypeAhead}
\title{
  Twitter Bootstrap TypeAhead
}
\description{
  Functions to add and update Twitter Bootstrap TypeAhead text inputs in shiny.
}
\usage{
bsTypeAhead(inputId, label, value = "", choices, items = 4, minLength = 1)
bsNavTypeAhead(inputId, label, value = "", choices, items = 4, minLength = 1)
updateTypeAhead(session, inputId, label=NULL, value=NULL, choices=NULL)
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
    The label for the \code{bsTypeAhead} object.
}
  \item{value}{
    The current value of the \code{bsTypeAhead} object
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
}
\details{
  \code{bsTypeAhead} creates a text box that will start displaying items in \code{choices} as the user types similar inputs. It looks and behaves as a \code{textInput} object otherwise.\cr\cr
  \code{bsNavTypeAhead} is meant for use inside a \code{bsNav} object. The main difference is that the value of \code{label} is placed into the \code{placeholder} attribute of the \code{input} object. This saves space in the navbar.
  \code{updateNavBar} will update a \code{bsTypeAhead} or \code{bsNavTypeAhead} object, allowing the user to change the label, value, or choices.
}
\references{
  \href{http://getbootstrap.com/2.3.2/javascript.html#typeahead}{Typeahead for Twitter Bootstrap 2.3.2}
}
\author{
Eric Bailey
}

\examples{

  \dontrun{bsTypeAhead("ta1", label="Favorite Breakfast:", choices = c("Waffles", "Eggs", "Bacon", "Cereal", "Oatmeal"), items=3, minLength=2)}

}
