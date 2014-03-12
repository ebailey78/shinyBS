# Used to create a tooltip from ui.R
bsTooltip <- function(id, title, placement="bottom", trigger="hover") {
  
  if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
  
  sbsHead(tags$script(paste0("$(document).ready(function() {setTimeout(function() {addTooltip('", id, "', '", title, "', '", 
                             placement, "', '", trigger, "')}, 100)});")))
  
}

# Remove Tooltip from object
removeTooltip <- function(session, id) {
  
  session$sendCustomMessage(type="removetooltip", id)
  
}

# Used to dynamically create tooltips in server.R
addTooltip <- function(session, id, title, placement = "bottom", trigger = "hover") {
  
  if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
  
  data <- list(id = id, title = title, placement = placement, trigger = trigger)
  session$sendCustomMessage(type="addtooltip", data)
  
}

