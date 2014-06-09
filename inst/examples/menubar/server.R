library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  print(1)
  data <- reactive({eval(parse(text = paste0(input$dtype, "(1000)")))})
  observe({print(paste0(input$ptype,"(data(), col = '", input$clr, "')"))})
  output$chart1 <- renderPlot({eval(parse(text = paste0("plot","(data(), col = '", "red", "')")))
                               #if(input$rug == TRUE) rug(data())}, width = 700)
})