.onAttach <- function(...) {
  
  # Create link to javascript and css files for package
  shiny::addResourcePath("sbs", system.file("www", package="shinyBS"))
  
}

# Wrapper to add the appropriate singletons to the head of the shiny app
sbsHead <- function(...) {
  
  tagList(singleton(tags$head(tags$script(src = "sbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "sbs/shinyBS.css"))),
          ...
          )
  
}