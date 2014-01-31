\name{addPopover}
\alias{addPopover}
\alias{bsPopover}
\title{
  Twitter Bootstrap Popovers
}
\description{
  Functions to add Twitter Bootstrap popovers in Shiny.
}
\usage{
  addPopover(session, id, title, placement = "bottom", trigger = "hover")
  bsPopover(id, title, placement = "bottom", trigger = "hover")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}.
}
  \item{id}{
    The \code{inputId} of the object to add the popover to
}
  \item{title}{
    The title of the popover
}
  \item{content}{
    The main content of the popover
  }
  \item{placement}{
    Where the popover should appear in relation to the object. Acceptable values are \code{bottom}, \code{top}, \code{left}, and \code{right}.
}
  \item{trigger}{
    What action will make the popover appear. Common values are \code{hover} or \code{click}.
}
}
\details{
  \code{bsPopover} is called from \code{ui.R} and will add a \code{<script>} element to the page that adds a popover on page load. \cr\cr
  \code{addPopover} is called from \code{server.R} and uses shiny's \code{customMessageHandler} to add a popover after page load.
}

\references{
  \href{http://getbootstrap.com/2.3.2/javascript.html#popovers}{Popovers for Twitter Bootstrap 2.3.2}
}

\author{
Eric Bailey
}

\examples{

\dontrun{
  ## From ui.R: Adds a popover to element with inputId = "someInput" 
  ## with title, "Popover", and text, "This is an input.", that appears to the left on click.
  bsPopover(id = "someInput", title="Popover", content = "This is an input", 
            placement = "left", trigger = "click")
  
  ## From server.R: Add the same popover as above
  addPopover(session, id="someInput", title="popover", content = "This is an input.",
             placement = "left", trigger = "click")}

}