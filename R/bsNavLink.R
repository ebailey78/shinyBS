bsNavLink <- function(inputId, label, active=FALSE, href="#", ...) {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$li(tags$a(id = inputId, href = href, label, ...))
  )
}
