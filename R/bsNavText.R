bsNavText <- function(inputId, value=NULL) {
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$li(tags$p(id = inputId, class="navbar-text shiny-text-output", value))
  )
}
