# Used to create a tooltip from ui.R
bsTooltip <- function(id, title, placement="bottom", trigger="hover") {
  
  if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
  
  sbsHead(tags$script(paste0("addTooltip('", id, "', '", title, "', '", 
                             placement, "', '", trigger, "');")))
  
}

# Remove Tooltip from object
removeTooltip <- function(session, id) {
  
  session$sendCustomMessage(type="removetooltip", id)
  
}

# Used to dynamically create tooltips in server.R
addTooltip <- function(session, id, title, placement = "bottom", trigger = "hover") {
  
<<<<<<< HEAD
  if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
  
=======
>>>>>>> b073a2915f99151d45940c6b9f10cc5791eb1ae9
  data <- list(id = id, title = title, placement = placement, trigger = trigger)
  session$sendCustomMessage(type="addtooltip", data)
  
}

