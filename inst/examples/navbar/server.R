library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  output$test <- renderText({

    input$ndd1
    
    })
  
  observe({
    
    cmd <- unlist(strsplit(input$ndd1, ":"))
    if(length(cmd) > 0) {
      session$sendCustomMessage("options", list(option = cmd[1], value = cmd[2]))
    }
    
  })
})