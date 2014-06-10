#'@export
bsMenuWrap <- function(input, width = 10, form = "auto") {
  
  parts <- inputParser(input)
  class <- "sbs-menu-wrap"
  if(!is.null(parts$class)) class <- paste(class, parts$class)  
  
  if(form == "auto") {
    if(inherits(parts$body, "list") || parts$body$name != "button") {
      form = TRUE
    } else {
      form = FALSE
    }
  }
#   for(i in seq(length(parts$body))) {
#     print((parts$body[[i]]))
#     if(parts$body[[i]]$name == "input") {
#       parts$body[[i]] <- tagAddAttribs(parts$body[[i]], size = width, 
#                                        placeholder = parts$label)
#     }
#   }
  
  wrap <- tags$li(class = class)
  if(form) {
    wrap <- tagAppendChild(wrap, tags$form(class = "navbar-form", parts$body))
  } else {
    wrap <- tagAppendChild(wrap, parts$body)
  }
 
  if(!is.null(parts$head)) wrap <- tagList(parts$head, wrap)
  
  return(wrap)
  
}

# Recursively searches through an input tag and pulls out the important bits.
inputParser <- function(input, parts = list(head = NULL, label = NULL, 
                                            body = NULL, class = NULL)) {
  
  if(inherits(input, "list")) {
    for(l in input) {
      parts <- inputParser(l, parts)
    }
  } else {
    if(input$name == "head") {
      parts$head <- input
    } else if(input$name == "label") {
      parts$label <- input$children[[1]]
    } else if(input$name == "input" || input$name == "button") {
      parts$body <- tagList(input)
    } else if(input$children[[1]]$name == "label") {
      parts$label <- input$children[[1]]$children[[1]]
      parts$body <- tagList(input$children[seq(2, length(input$children))])
      parts$class <- input$attribs$class
    }
  }
  
  return(parts)
  
}

# input <- textInput("test", "Testing")
# x <- inputParser(input)
# x
# class(input)
# 
# input <- dateInput("test", "Test Date Input")
# x <- inputParser(input)
# class(input)
# 
# input <- dateRangeInput("test", "Test Date Range Input")
# x <- inputParser(input)
# # class(input)
#  input <- actionButton("test", "Test Button")
# # class(input)
# # input <- fileInput("test", "Test File Input")
# # class(input)
# # input <- numericInput("test", "Test Numeric Input", value = 4)
# # class(input)
#  input <- sliderInput("test", "Test Slider Input", value = 4, min=0, max= 5)
# class(input)
