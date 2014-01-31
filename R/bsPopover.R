# Add a popover from the ui.R script
bsPopover <- function(id, title, content, placement="right", trigger="click") {
  
  sbsHead(tags$script(paste0("addPopover('", id, "', '", title, "', '", content, 
                             "', '", placement, "', '", trigger, "');")))
  
}

# Used to dynamically create popovers in server.R
addPopover <- function(session, id, title="", content, placement="bottom", trigger="click") {
  
  data <- list(id = id, title = title, content = content, 
               placement = placement, trigger = trigger)
  
  session$sendCustomMessage(type="addpopover", data)
  
}