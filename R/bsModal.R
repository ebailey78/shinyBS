#'@templateVar item_name Modal
#'@template component
#'@details Modal windows are similar to popups but are rendered within the 
#'  original window. They can contain any combination of shiny inputs, shiny 
#'  outputs, and html. Possible uses include extra controls that you don't want
#'  cluttering up the main app display or help pages to explain your apps
#'  operation.
NULL

#'@rdname modals
#'@param id The id of the modal window
#'@param title The title to appear at the top of the modal window
#'@param trigger The id of a button or link that will trigger the modal opening
#'@param \dots The content of the model window
#'@param href A optional web address that you want loaded into the modal window
#'@section Options: \code{trigger} is the id of a link or button that will open 
#'  the modal when clicked.
#'  
#'  \code{href} is optional. If provided, it will override any elements added to
#'  the modal and replace them with the contents of the webpage indicated.
#'@return \code{bsModal} will return \code{TRUE} or \code{FALSE} to the shiny
#'  server, indicating whether the modal is currently open or not.
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

#'@rdname modals
#'@param session The session object passed to shinyServer
#'@param modalId The id of the modal you want to open/close
#'@details You can use /code{toggleModal} in server.R to open or close a modal
#'  without the user clicking its trigger. If the modal is open, it will close.
#'  If it is closed, it will open.
#'@export
toggleModal <- function(session, modalId) {
  
  session$sendInputMessage(modalId, list(toggle = TRUE))
  
}