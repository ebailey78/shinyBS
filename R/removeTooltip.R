#'removeTooltip
#'
#'\code{removeTooltip} is used within the Server logic of an app to remove an
#'existing tooltip from a Shiny input or output.
#'
#'@param session The session object passed to function given to shinyServer.
#'@param id The id of the element to remove the tooltip from.
#'
#'@templateVar item_name removeTooltip
#'@templateVar family_name Tooltips_and_Popovers
#'@template item_details
#'@template footer
#'@export
removeTooltip <- function(session, id) {
  
  session$sendCustomMessage(type="updateTooltip", list(action = "remove", type = "tooltip", id = id))
  
}