library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  output$plot <- renderPlot({
    input$ugm3
    hist(rnorm(1000))
  })
  
})