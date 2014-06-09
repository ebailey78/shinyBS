#'@rdname Popovers
#'@name Popovers
#'@title Twitter Bootstrap Popovers
#'  
#'@description Functions to add and manipulate Twitter Bootstrap Tooltips in 
#'  shiny
#'  
#'@param id The \code{inputId} of the object to add the popover to
#'@param title The title of the popover
#'@param content The main content of the popover
#'@param placement Where the popover should appear in relation to the object. 
#'  Acceptable values are \code{bottom}, \code{top}, \code{left}, and 
#'  \code{right}
#'@param trigger The action that will make the popover appear. Common values are
#'  \code{hover} or \code{click}
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'  
#'@details \code{bsPopover} is called from \code{ui.R} and will add a 
#'  \code{<script>} element to the page that adds a popover on page load. \cr\cr
#'  \code{addPopover} is called from \code{server.R} and uses shiny's 
#'  \code{customMessageHandler} to add a popover after page load. \cr\cr When 
#'  the popover is added to the app, a "#" is prepended to the \code{id} 
#'  provided. If you have knowledge of CSS/jQuery you can add additional 
#'  selectors after the id to give finer control over the placement of the 
#'  popover.
#'  
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript 
#'  for Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsPopover <- function(id, title, content, placement="right", trigger="click") {

  sbsHead(tags$script(HTML(paste0("$(document).ready(function() {setTimeout(function() {addPopover('", id, "', '", title, "', '", content, 
                             "', '", placement, "', '", trigger, "')}, 100);})"))))
  
}

#'@rdname Popovers
#'@export
addPopover <- function(session, id, title="", content, placement="right", trigger="click") {

  data <- list(id = id, title = title, content = content, 
               placement = placement, trigger = trigger)
  
  session$sendCustomMessage(type="addpopover", data)
  
}

#'@rdname Popovers
#'@export
removePopover <- function(session, id) {
  
  session$sendCustomMessage(type="removepopover", id)
  
}