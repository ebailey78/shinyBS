library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  output$test <- renderText(deparse(input$bcm3))
  
})