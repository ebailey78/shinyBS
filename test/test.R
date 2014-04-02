x <- textInput(inputId = "textTest", "Text Test", "Testing")
z <- numericInput(inputId = "numTest", "Numeric Test", value = 5, min = -10, max = 10, step = 1)
inputObject<- dateInput(inputId = "dateTest", "Date Test", value = "2014-01-01", min = "2012-01-01", max = "2014-12-31")
inputObject <- dateRangeInput(inputId = "dateRangeTest", "Date Range Test", start = "2013-12-01", end = "2013-12-31", min = "2013-01-01", max = "2014-12-31")
inputObject <- sliderInput(inputId = "sliderTest", "Slider Test", min = 0, max = 1000, value = 435, step = 5)
inputObject <- bsTypeAhead(inputId = "typeAheadTest", "TypeAhead Test", value = "benzene", choices = c("benzene", "toluene", "ethylbenzene", "xylenes"))

bsControlInput <- function(id, inputObject, icon) {
  
  single <- NULL
  
  if(inherits(inputObject[[1]], "shiny.singleton")) {
    single <- inputObject[[1]]
    inputObject <- inputObject[[2]]
  }
  if(inherits(inputObject, "shiny.tag")) {
    if(length(inputObject[[2]]) == 0) {
      iO <- inputObject[[3]]
      inputObject <- unlist(inputObject[[3]], FALSE)
    }
  }
  if(inherits(inputObject, "shiny.tag")) {
    label <- inputObject[[3]][[1]]
    inputObject[[3]][[1]] <- NULL
    inObj <- inputObject
  } else {
    label <- inputObject[[1]]
    inObj <- inputObject[[2]]
  }
  
  label <- unlist(label[[3]])

  
  
}
