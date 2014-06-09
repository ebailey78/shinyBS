bsMenuBar <- function(inputId, ..., brand, rightItems, fixed = FALSE, 
                         inverse = FALSE) {

  leftItems <- list(...)
  if(length(leftItems) == 0) leftItems = list("")
  if(missing(rightItems)) rightItems = list("")
  class <- "navbar"
  if(inverse) class <- paste(class, "navbar-inverse")
  if(fixed)  class <- paste(class, "navbar-fixed-top")
  sbsHead(tags$div(id = inputId, class = class,
                   tags$div(class = "navbar-inner",
                            tags$a(class="brand", href="#", brand),
                            tags$ul(class="nav pull-left", leftItems),
                            tags$ul(class="nav pull-right", rightItems)
                            )
                   )
          )  
}

# Allows the user to change some aspects of th menu bar from the server.
updateMenuBar <- function(session, inputId, brand=NULL, fixed=NULL, inverse=NULL) {
  data <- dropNulls(list(id=inputId, brand=brand, fixed=fixed, inverse=inverse))
  session$sendCustomMessage(type="modifymenubar", data)
}