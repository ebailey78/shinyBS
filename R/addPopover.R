#'addPopover
#'
#'\code{addPopover} is used within the Server logic of an app to add a popover to a Shiny
#'input or output.
#'
#'@param session The session object passed to function given to shinyServer.
#'@param id The id of the element to attach the popover to.
#'@param title The title of the popover.
#'@param content The main content of the popover.
#'@param placement Where the popover should appear relative to its target 
#'(\code{top}, \code{bottom}, \code{left}, or \code{right}). Defaults to \code{bottom}.
#'@param trigger What action should cause the popover to appear? (\code{hover},
#'\code{focus}, \code{click}, or \code{manual}). Defaults to \code{hover}.
#'@param options A named list of additional options to be set on the popover.
#'@param treatAsJQSel if \code{TRUE}, \code{id} is treated as a general jQuery selector
#'rather than the id attribute of the element. This allows adding the popover to HTML
#'elements even if they do not have an id attribute attached to it.
#'@templateVar item_name addPopover
#'@templateVar family_name Tooltips_and_Popovers
#'@template item_details
#'@template footer
#'@export
addPopover <- function(session, id, title, content, placement = "bottom", trigger = "hover", 
                       options = NULL, treatAsJQSel  = FALSE) {
  
  options <- buildTooltipOrPopoverOptionsList(title, placement, trigger, options, content)
  createTooltipOrPopoverOnServer(session, id, "popover", options, treatAsJQSel)
  
}