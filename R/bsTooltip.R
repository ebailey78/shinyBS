bsTooltip <- function(id, title, placement="bottom", trigger="hover") {
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$script(paste0("addTooltip('", id, "', '", title, "', '", placement, "', '", trigger, "');"))
  )
  
}