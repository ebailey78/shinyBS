bsNavTextInput <- function(inputId, label="", value="") {
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$li(tags$form(label, class="navbar-form", tags$input(id = inputId, type="text", value = value)))
  )
  
}