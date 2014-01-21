library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  session$sendInputMessage("text1", list(value = "Hello"))
})