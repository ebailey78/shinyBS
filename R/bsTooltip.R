# Used to create a tooltip from ui.R
bsTooltip <- function(id, title, placement="bottom", trigger="hover") {
  
  sbsHead(tags$script(paste0("addTooltip('", id, "', '", title, "', '", 
                             placement, "', '", trigger, "');")))
  
}

# Remove Tooltip from object
removeTooltip <- function(session, id) {
  
  session$sendCustomMessage(type="removetooltip", id)
  
}

# Used to dynamically create tooltips in server.R
addTooltip <- function(session, id, title, placement = "bottom", trigger = "hover") {
  
  data <- list(id = id, title = title, placement = placement, trigger = trigger)
  session$sendCustomMessage(type="addtooltip", data)
  
}

