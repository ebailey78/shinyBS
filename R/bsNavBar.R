# Creates the shell of a navbar that can have navbar elements added to it.
bsNavBar <- function(inputId, brand, ..., rightItems, fixed=FALSE, inverse=FALSE) {
  
  class <- "navbar"
  if(inverse) class <- paste(class, "navbar-inverse")
  if(fixed)  class <- paste(class, "navbar-fixed-top")
  
  leftItems <- list(...)
  if(missing(rightItems)) rightItems = list("")
    
  sbsHead(tags$div(id = inputId, class = class,
                   tags$div(class = "navbar-inner",
                            tags$a(class="brand", href="#", brand),
                            tags$ul(class="nav pull-left", leftItems),
                            tags$ul(class="nav pull-right", rightItems)
                   )
          )
  )
  
}

# Allows the user to change some aspects of th navbar from the server.
updateNavBar <- function(session, inputId, brand=NULL, fixed=NULL, inverse=NULL) {
  
  data <- dropNulls(list(id=inputId, brand=brand, fixed=fixed, inverse=inverse))
  
  session$sendCustomMessage(type="modifynavbar", data)
  
}

# Wrapper for creating a page with a navbar
pageWithNavBar <- function(title = "", navbar, mainContent) {
  
  basicPage(tags$head(tags$title(title)),
            navbar,
            mainContent)
  
}