library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  values <- reactiveValues()
  
  observe({
    if(input$dis %% 2 == 0) {
      updateMenuItem(session, "cmd1", disabled = FALSE)
    } else {
      updateMenuItem(session, "cmd1", disabled = TRUE)
    }
    if(input$dis > 0) {
      updateMenuItem(session, "cmd1", icon = "globe", label = "I'm a globe!")
      clickMenuItem(session, "rad3")
    }
  })
  
  observe({
    val <- input$dtype
    isolate(values$dist <- val)
  })
  
  observe({
    val <- input$sdtype
    isolate(values$dist <- val)
  })
  
  data <- reactive({
    input$cmd2
    input$po_nd
    eval(parse(text = paste0(values$dist, "(1000)")))
  })
  
  output$chart1 <- renderPlot({
    print(input$ptype)
    eval(parse(text = paste0(input$ptype, "(data(), col = '", input$clr, "', main = '", input$plot_title, "')")))
    if(input$rug == TRUE) rug(data())}, width = 700)
  
  output$testing <- renderText({input$items})
})