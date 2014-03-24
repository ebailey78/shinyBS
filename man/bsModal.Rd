\name{Modal Windows}
\alias{bsModal}
\alias{toggleModal}
\title{
  Modal Windows for Shiny Apps
}
\description{
  Create Twitter Bootstrap modal windows for shiny apps
}
\usage{
bsModal(id, title, trigger, ..., href)
toggleModal(session, modalId)
}
\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}
}
  \item{id}{
    Id to assign to the modal window
}
  \item{modalId}{
    The Id of the modal you want to open/close  
}
  \item{title}{
    The title of the modal window
}
  \item{trigger}{
    The Id of a button or anchor that will be used to open the window
}
  \item{\dots}{
    Elements to add to the body of the modal window
}
  \item{href}{
    Location of an html file that will provide contents of modal body 
}
}
\details{
  Modals can contain any combination of html, shiny inputs, or shiny outputs.\cr\cr
  \code{toggleModal} will open the model if it is closed, or close it if it is open.  
}

\references{
  \href{http://getbootstrap.com/2.3.2/javascript.html}{Modals for Twitter Bootstrap 2.3.2}
}

\author{
Eric Bailey
}

\note{
  Run \code{bsDemo()} for a live example of modals.
}

\examples{
\dontrun{

  # Create the button that will trigger the modal
  bsButton("moTrig", "Open Modal", style = "primary"),
  # Create a modal with the title 'A Remote Modal' that loads its contents from moDemo.html
  bsModal("moMod2", "A Remote Modal", trigger = "moTrig", href = "moDemo.html") 
}
}
