\name{collapse}
\alias{bsCollapse}
\alias{bsCollapsePanel}
\title{
Twitter Bootstrap Collapse Panels
}
\description{
Create Twitter Boostrap-style collapse panels (sometimes called accordion panels) in shiny.
}
\usage{
bsCollapse(..., id = NULL, multiple = FALSE, open = NULL)
bsCollapsePanel(title, ..., id = NULL, value = NULL)
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
    The id of the panel you want open initially
}
  \item{title}{
    The title to appear at the top of the panel
}
  \item{value}{
    The value that is returned by the \code{bsCollapse} object when this panel is open  
}
}
\details{
  \code{bsCollapse} works very similarly to \code{tabsetPanel} and may be useful in similare situations.
  
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
}}
