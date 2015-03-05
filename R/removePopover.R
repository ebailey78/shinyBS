#'removePopover
#'
#'\code{removePopover} is used within the Server logic of an app to remove an
#'existing popover from a Shiny input or output.
#'
#'@param session The session object passed to function given to shinyServer.
#'@param id The id of the element to remove the popover from.
#'
#'@templateVar item_name removePopover
#'@templateVar family_name Tooltips_and_Popovers
#'@template item_details
#'@template footer
#'@export
removePopover <- function(session, id) {
  
  session$sendCustomMessage(type="updateTooltip", list(action = "remove", type = "popover", id = id))
  
}