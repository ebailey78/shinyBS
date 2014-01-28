bsPopover <- function(id, title, content, placement="right", trigger="click") {
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$script(paste0("addPopover('", id, "', '", title, "', '", content, "', '", placement, "', '", trigger, "');"))
  )
  
}