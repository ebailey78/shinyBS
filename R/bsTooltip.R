#'@rdname Tooltips
#'@name Tooltips
#'@title Twitter Bootstrap Tooltips
#'  
#'@description Functions to add and manipulate Twitter Bootstrap Tooltips in 
#'  shiny
#'  
#'@param id The \code{inputId} of the object to add the tooltip to
#'@param title The text of the tooltip
#'@param placement Where the tooltip should appear in relation to the object. 
#'  Acceptable values are \code{bottom}, \code{top}, \code{left}, and 
#'  \code{right}
#'@param trigger The action that will make the tooltip appear. Common values are
#'  \code{hover} or \code{click}
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'  
#'@details \code{bsTooltip} is called from \code{ui.R} and will add a 
#'  \code{<script>} element to the page that adds a tooltip on page load. \cr\cr
#'  \code{addTooltip} is called from \code{server.R} and uses shiny's 
#'  \code{customMessageHandler} to add a tooltip after page load. \cr\cr When 
#'  the tooltip is added to the app, a "#" is prepended to the \code{id} 
#'  provided. If you have knowledge of CSS/jQuery you can add additional 
#'  selectors after the id to give finer control over the placement of the 
#'  tooltip.
#'  
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript 
#'  for Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsTooltip <- function(id, title, placement="bottom", trigger="hover") {
  
  if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
  
  sbsHead(tags$script(paste0("$(document).ready(function() {setTimeout(function() {addTooltip('", id, "', '", title, "', '", 
                             placement, "', '", trigger, "')}, 100)});")))
  
}

#'@rdname Tooltips
#'@export
removeTooltip <- function(session, id) {
  
  session$sendCustomMessage(type="removetooltip", id)
  
}

#'@rdname Tooltips
#'@export
addTooltip <- function(session, id, title, placement = "bottom", trigger = "hover") {
  
  if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
  
  data <- list(id = id, title = title, placement = placement, trigger = trigger)
  session$sendCustomMessage(type="addtooltip", data)
  
}

