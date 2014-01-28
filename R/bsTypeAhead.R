bsTypeAhead <- function(inputId, data.source, items=4, minLength=1) {
  
  data.source <- paste0("[\"", paste0(data.source, collapse="\", \"") , "\"]")
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$input(id=inputId, type="text", "data-provide"="typeahead", "data-source" = data.source)  
  )
  
}