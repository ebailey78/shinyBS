library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  data <- reactive({eval(parse(text = paste0(input$dtype, "(1000)")))})
  output$chart1 <- renderPlot({eval(parse(text = paste0(input$ptype, "(data(), col = '", input$clr, "')")))
                               if(input$rug == TRUE) rug(data())}, width = 700)
})