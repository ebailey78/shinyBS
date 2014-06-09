#'@export
bsMenuWrap <- function(input, width, form = TRUE) {
  
  if(input[[1]]$name == "label") {
    label <- input[[1]][[3]][[1]]
    input <- input[[2]]
    if(input$name == "input") input <- tagAddAttribs(input, placeholder = label)
    if(!missing(width)) input <- tagAddAttribs(input, size = width)
  }
  
  wrap <- tags$li(class = "sbs-menu-wrap")
  if(form) {
    wrap <- tagAppendChild(wrap, tags$form(class = "navbar-form", input))
  } else {
    wrap <- tagAppendChild(wrap, input)
  }
 
  return(wrap)
  
}

#input <- textInput("test", "Testing")
#input <- dateRangeInput("test", "TEsting")
