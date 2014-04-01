library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
#  output$test <- renderText(deparse(input$i_sm1))
  output$test <- renderText(deparse(input$bcm3))
  
})