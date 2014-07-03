#'@templateVar item_name Tooltip
#'@template component
#'@details Tooltips are used to convey very small amounts of information about
#'  an element of your shiny app to the user. They are usually set to appear on
#'  hover and can contain text to help better explain an element of
#'  your shiny app.
NULL

#'@rdname tooltips
#'@param id The id of the element you want to attach/remove the tooltip to/from
#'@param title The content of the tooltip
#'@param placement Where the tooltip shoud appear relative to its target
#'@param trigger What action should cause the tooltip to appear
#'@details shiny and shinyBS use jQuery to select elements within the page. 
#'  shinyBS will prepend the \code{id} argument with a "#" to tell jQuery to
#'  look for an id, but additional css selectors can be included within the
#'  \code{id} argument. For example, if you wanted to attach a tooltip to the
#'  first header of a table with an id of "tableEx" you could do something like
#'  \code{id = "tableEx th:nth-child(1)"}.
#'  
#'  \code{bsTooltip} is used from within ui.R to add tooltips to elements
#'@section Options: \code{placement} can be \code{right}, \code{left}, 
#'  \code{top}, or \code{bottom}
#'  
#'  \code{trigger} can be \code{hover}, \code{click}, \code{focus}, or 
#'  \code{manual}
bsTooltip <- function(id, title, placement="bottom", trigger="hover") {
  
  if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
  
  sbsHead(tags$script(paste0("$(document).ready(function() {setTimeout(function() {addTooltip('", id, "', '", title, "', '", 
                             placement, "', '", trigger, "')}, 100)});")))
  
}

#'@rdname tooltips
#'@param session The session object passed from shinyServer
#'@details \code{addTooltip} is called from within server.R to add popovers to
#'  elements
#'@export
addTooltip <- function(session, id, title, placement = "bottom", trigger = "hover") {
  
  if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
  
  data <- list(id = id, title = title, placement = placement, trigger = trigger)
  session$sendCustomMessage(type="addtooltip", data)
  
}

#'@rdname tooltips
#'@details /code{removeTooltip} will remove any tooltips attached to the
#'  selected element.
#'@export
removeTooltip <- function(session, id) {
  
  session$sendCustomMessage(type="removetooltip", id)
  
}
