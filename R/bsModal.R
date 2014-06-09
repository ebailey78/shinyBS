#'@rdname Modals
#'@name Modals
#'@title Twitter Bootstrap Modal Windows
#'@description Functions for creating, showing, and hiding Twitter Bootstrap 
#'  modal windows in shiny
#'  
#'@param id Id to assign to the modal window
#'@param modalId Id of the modal you want to open/close
#'@param title The title of the modal window
#'@param trigger The id of the button or anchor that will open the modal window
#'@param \dots{} Elements to add to the body of the modal window
#'@param href Location of an html file that will provide content of modal body
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'  
#'@details Modals can contain any combination of html, shiny inputs, or shiny 
#'  outputs.\cr\cr \code{toggleModal} will open the model if it is closed, or 
#'  close it if it is open.\cr\cr
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript 
#'  for Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsModal <- function(id, title, trigger, ..., href) {
  
  mo <- tags$div(class = "modal sbs-modal hide fade", id = id,
                 "data-trigger" = trigger,
                 tags$div(class = "modal-header",
                          tags$button(Type = "button", class = "close",
                                      "data-dismiss" = "modal", HTML("&times;")),
                          tags$h3(title)),
                 body <- tags$div(class = "modal-body"),
                 tags$div(class = "modal-footer",
                         tags$a(href = "#", class = "btn", "data-dismiss" = "modal", "Close")
                         )
                 )

  if(!missing(href)) {
    mo <- tagAddAttribs(mo, "data-remote" = href)
  } else {
    mo$children[[2]] <- tagAppendChildren(mo$children[[2]], list = list(...))
  }

  return(mo)
  
}

#'@rdname Modals
#'@export
toggleModal <- function(session, modalId) {
  
  session$sendInputMessage(modalId, list(toggle = TRUE))
  
}