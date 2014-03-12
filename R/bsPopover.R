# Add a popover from the ui.R script
bsPopover <- function(id, title, content, placement="right", trigger="click") {

  sbsHead(tags$script(HTML(paste0("$(document).ready(function() {setTimeout(function() {addPopover('", id, "', '", title, "', '", content, 
                             "', '", placement, "', '", trigger, "')}, 100);})"))))
  
}

# Used to dynamically create popovers in server.R
addPopover <- function(session, id, title="", content, placement="right", trigger="click") {

  data <- list(id = id, title = title, content = content, 
               placement = placement, trigger = trigger)
  
  session$sendCustomMessage(type="addpopover", data)
  
}

#Remove popover
removePopover <- function(session, id) {
  
  session$sendCustomMessage(type="removepopover", id)
  
}