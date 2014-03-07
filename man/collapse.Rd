\name{collapse}
\alias{bsCollapse}
\alias{bsCollapsePanel}
\alias{updateCollapse}
\title{
Twitter Bootstrap Collapse Panels
}
\description{
Create Twitter Boostrap-style collapse panels (sometimes called accordion panels) in shiny.
}
\usage{
bsCollapse(..., id = NULL, multiple = FALSE, open = NULL)
bsCollapsePanel(title, ..., id = NULL, value = NULL)
updateCollapse(session, id, open = NULL, close = NULL, multiple = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{\dots}{
    for \code{bsCollapse} a series of \code{bsCollapsePanels} to include in the object
    for \code{bsCollapsePanel} as series of UI elements to add to the panel
}
  \item{id}{
    a name for the object. Optional
}
  \item{multiple}{
    if \code{TRUE} then opening one panel will not close other panels 
}
  \item{open}{
    The id of the panel(s) you want to open
}
  \item{close}{
    The id of the panel(s) you want to close
}
  \item{title}{
    The title to appear at the top of the panel
}
  \item{value}{
    The value that is returned by the \code{bsCollapse} object when this panel is open  
}
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}
  }
}
\details{
  \code{bsCollapse} works very similarly to \code{tabsetPanel} and may be useful in similar situations.\cr\cr
  Like \code{tabsetPanel}s, \code{bsCollapse} can return values indicating which panels are open or \code{NULL} if no panels are open.
  
}
\references{
  \href{http://getbootstrap.com/2.3.2/javascript.html}{Collapse for Twitter Bootstrap 2.3.2}
}
\author{
  Eric Bailey
}
\note{
  Run \code{bsDemo()} for a live example of collapse panels.
}
\examples{
\dontrun{

  ## This code, placed inside ui.R, creates the collapse group with 3 panels:
  bsCollapse(multiple = FALSE, open = "col1", id = "collapse1",
            bsCollapsePanel("Collapse #1", "Cell treachery spearwife night\'s watch, tower suckling ...", 
                            id="col1", value="test1"),
            bsCollapsePanel("Collapse #2", actionButton("btn123", "A Button"), textInput("txt1234", "A Text Input"), 
                            id="col2", value="test2"),
            bsCollapsePanel("Collapse #3", plotOutput("testPlot1"), 
                            id="col3", value="test3")
            ) 
  
  ## This code, placed inside server.R, will change multiple to TRUE and open the first and third panels:
  updateCollapse(session, "collapse1", multiple = TRUE, open = c("col1", "col2"))
}}
