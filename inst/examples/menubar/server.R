library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  values <- reactiveValues(test = "")
  
  test <- observe({
    if(input$test_but > 0)
      updateMenuItem(session, "rug1", checked = TRUE)
  })
  
  data <- reactive({
    input$nd1
    input$nd2
    input$new_data
    cnt <- input$sample_size
    if(!is.numeric(cnt)) cnt <- 1000
    eval(parse(text = paste0(menuGroups$dist, "(", cnt, ")")))
  })
  
  bsMenuItemGroup("dist", "dtype1", "dtype2", group = TRUE)
  bsMenuItemGroup("plot", "ptype1", "ptype2", group = TRUE)
  bsMenuItemGroup("color", "clr1", "clr2", group = TRUE)
  bsMenuItemGroup("rug", "rug1", "rug2")
  
  output$chart1 <- renderPlot({
    isolate(values$test <- paste(values$test, "1"))
    col <- "red"
    plot <- "hist"
    eval(parse(text = paste0(menuGroups$plot, "(data(), col = '", menuGroups$color, "', main = '", input$plot_title, "')")))
    if(menuGroups$rug == TRUE) rug(data())
  }, width = 700)
  
#  output$testing <- renderText({values$test})
  
})