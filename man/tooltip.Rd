\name{addTooltip}
\alias{addTooltip}
\alias{bsTooltip}
\title{
  Twitter Bootstrap Tooltips
}
\description{
  Functions to add Twitter Bootstrap tooltips in shiny.
}
\usage{
addTooltip(session, id, title, placement = "bottom", trigger = "hover")
bsTooltip(id, title, placement = "bottom", trigger = "hover")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}
}
  \item{id}{
    The \code{inputId} of the object to add the tooltip to
}
  \item{title}{
    The text of the tooltip
}
  \item{placement}{
    Where the tooltip should appear in relation to the object. Acceptable values are \code{bottom}, \code{top}, \code{left}, and \code{right}.
}
  \item{trigger}{
    What action will make the tooltip appear. Common values are \code{hover} or \code{click}.
}
}
\details{
  \code{bsTooltip} is called from \code{ui.R} and will add a \code{<script>} element to the page that adds a tool tip on page load. \cr\cr
  \code{addTooltip} is called from \code{server.R} and uses shiny's \code{customMessageHandler} to add a tooltip after page load.
}

\references{
  \href{http://getbootstrap.com/2.3.2/javascript.html\#tooltips}{Tooltips for Twitter Bootstrap 2.3.2}
}

\author{
Eric Bailey
}

\note{
  Run \code{bsDemo()} for a live example of popovers.
}

\examples{

\dontrun{

  ## From ui.R: Adds a tooltip to element with inputId = "someInput" 
  ## with text, "This is an input.", that appears to the left on hover.
  bsTooltip(id = "someInput", title = "This is an input", 
            placement = "left", trigger = "hover")
  
  ## From server.R: Add the same tooltip as above
  addTooltip(session, id="someInput", title = "This is an input.",
             placement = "left", trigger = "hover")
}

}