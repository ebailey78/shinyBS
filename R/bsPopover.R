#'@templateVar item_name Popover
#'@template component
#'@details Popovers are used to convey small amounts of information to the user
#'  of your shiny app. They are usually set to appear on click or hover and can
#'  contain text to help better explain an element of your shiny app.
NULL

#'@rdname popovers
#'@param id The id of the element you want to attach/remove the popover to/from
#'@param title The title to appear at the top of the popover.
#'@param content The main body of the popover
#'@param placement Where the popover shoud appear relative to its target
#'@param trigger What action should cause the popover to appear
#'@details shiny and shinyBS use jQuery to select elements within the page.
#'shinyBS will prepend the \code{id} argument with a "#" to tell jQuery to look
#'for an id, but additional css selectors can be included within the \code{id}
#'argument. For example, if you wanted to attach a popover to the first header
#'of a table with an id of "tableEx" you could do something like \code{id =
#'"tableEx th:nth-child(1)"}.
#'
#'\code{bsPopover} is used from within ui.R to add
#'popovers to elements
#'@section Options: \code{placement} can be \code{right}, \code{left},
#'  \code{top}, or \code{bottom}
#'  
#'  \code{trigger} can be \code{hover}, \code{click}, \code{focus}, or
#'  \code{manual}
#'@export
bsPopover <- function(id, title, content, placement="right", trigger="click") {

  sbsHead(tags$script(HTML(paste0("$(document).ready(function() {setTimeout(function() {addPopover('", id, "', '", title, "', '", content, 
                             "', '", placement, "', '", trigger, "')}, 100);})"))))
  
}

#'@rdname popovers
#'@param session The session object passed from shinyServer
#'@details \code{addPopover} is called from within server.R to add popovers to elements
#'@export
addPopover <- function(session, id, title="", content, placement="right", trigger="click") {

  data <- list(id = id, title = title, content = content, 
               placement = placement, trigger = trigger)
  
  session$sendCustomMessage(type="addpopover", data)
  
}

#'@rdname popovers
#'@details \code{removePopover} will remove any popovers attached to the selected element.
#'@export
removePopover <- function(session, id) {
  
  session$sendCustomMessage(type="removepopover", id)
  
}