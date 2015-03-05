#'toggleModal
#'
#'\code{toggleModal} is used within your Server logic to open or close a modal
#'window.
#'
#'@param session The session object passed to function given to shinyServer.
#'@param modalId The id of the modal window you want to open/close
#'@param toggle Should the modal window \code{open}, \code{close}, or \code{toggle}?
#'
#'@templateVar item_name toggleModal
#'@templateVar family_name Modals
#'@template item_details
#'@template footer
#'@export
toggleModal <- function(session, modalId, toggle = "toggle") {
  
  session$sendInputMessage(modalId, list(toggle = toggle))
  
}