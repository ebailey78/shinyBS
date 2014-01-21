bsNavBar <- function(inputId, brand, leftItems, rightItems, fixed=FALSE, bottom=FALSE, inverse=FALSE) {
  
  class <- "navbar"
  if(inverse) class <- paste(class, "navbar-inverse")
  if(bottom) {
    class <- paste(class, "navbar-fixed-bottom")
  } else if(fixed) {
    class <- paste(class, "navbar-fixed-top")
  }
  
  tags$div(id = inputId, class = class,
           tags$div(class = "navbar-inner",
                    tags$a(class="brand", href="#", brand),
                    tags$ul(class="nav pull-left", leftItems),
                    tags$ul(class="nav pull-right", rightItems)
                    )
           )
}

bsNavLink <- function(inputId, label, active=FALSE, href="#", ...) {
  
  tags$li(tags$a(id = inputId, href = href, label))
  
}

bsNavDivider <- function() {
  tags$li(class="divider-vertical")
}

bsNavText <- function(inputId, value) {
  tags$li(tags$p(class="navbar-text", value))
}