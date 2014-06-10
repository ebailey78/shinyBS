library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  values <- reactiveValues()
  
  observe({
    val <- input$dtype
    isolate(values$dist <- val)
  })
  
  observe({
    val <- input$sdtype
    isolate(values$dist <- val)
  })
  
  data <- reactive({input$new_data
                    eval(parse(text = paste0(values$dist, "(1000)")))})
  output$chart1 <- renderPlot({
    eval(parse(text = paste0(input$ptype, "(data(), col = '", input$clr, "', main = '", input$plot_title, "')")))
    if(input$rug == TRUE) rug(data())}
  
    , width = 700)
  output$testing <- renderText({input$Test})
})