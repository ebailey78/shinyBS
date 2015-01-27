#'@templateVar item_name Modal
#'@template component
#'@details Modal windows are similar to popups but are rendered within the
#' original window. They can contain any combination of shiny inputs, shiny
#' outputs, and html. Possible uses include extra controls that you don't want
#' cluttering up the main app display or help pages to explain your apps
#' operation.
NULL

#'@rdname modals
#'@param id The id of the modal window
#'@param title The title to appear at the top of the modal window
#'@param trigger The id of a button or link that will trigger the modal opening
#'@param \dots The content of the model window
#'@param size Adjust the width of the modal, accepts small or large
#'@section Options: \code{trigger} is the id of a link or button that will open
#' the modal when clicked.
#'@return \code{bsModal} will return \code{TRUE} or \code{FALSE} to the shiny
#' server, indicating whether the modal is currently open or not.
#'@export
bsModal <- function(id, title, trigger, ..., size) {
  if(!missing(size)) {
    if(size == "large") {
      size = "modal-lg"
    } else if(size == "small") {
      size = "modal-sm"
    }
    size <- paste("modal-dialog", size)
  } else {
    size <- "modal-dialog"
  }
  mo <- tags$div(class = "modal sbs-modal fade", id = id, tabindex = "-1", "data-sbs-trigger" = trigger,
                 tags$div(class = size,
                          tags$div(class = "modal-content",
                                   tags$div(class = "modal-header",
                                            tags$button(type = "button", class = "close", "data-dismiss" = "modal", tags$span(HTML("&times;"))),
                                            tags$h4(class = "modal-title", title)
                                    ),
                                   tags$div(class = "modal-body", list(...)),
                                   tags$div(class = "modal-footer",
                                            tags$button(type = "button", class = "btn btn-default", "data-dismiss" = "modal", "Close")
                                   )
                          )
                  )
        )

  return(mo)
}

#'@rdname modals
#'@param session The session object passed to shinyServer
#'@param modalId The id of the modal you want to open/close
#'@param toggle Indicate if you want to open, close, or toggle the modal
#'@details You can use /code{toggleModal} in server.R to open or close a modal
#' without the user clicking its trigger. If the modal is open, it will close.
#' If it is closed, it will open.
#'@export
toggleModal <- function(session, modalId, toggle = "toggle") {
  
  session$sendInputMessage(modalId, list(toggle = toggle))
  
}