bsNavBar <- function(inputId, brand, leftItems, rightItems, fixed=FALSE, bottom=FALSE, inverse=FALSE) {
  
  class <- "navbar"
  if(inverse) class <- paste(class, "navbar-inverse")
  if(bottom) {
    class <- paste(class, "navbar-fixed-bottom")
  } else if(fixed) {
    class <- paste(class, "navbar-fixed-top")
  }
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$div(id = inputId, class = class,
                   tags$div(class = "navbar-inner",
                            tags$a(class="brand", href="#", brand),
                            tags$ul(class="nav pull-left", leftItems),
                            tags$ul(class="nav pull-right", rightItems)
                   )
          )
  )
  
}