library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  output$plot <- renderPlot({
    input$ugm3
    hist(rnorm(1000))
  })
  
  output$testing <- renderText(deparse(input$view_encode))
#  output$testing <- renderText(input$view_encode$encode_custom)
  
})