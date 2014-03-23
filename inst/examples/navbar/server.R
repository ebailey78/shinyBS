library(shiny)
library(shinyBS)

ch <- list("Font Color" = list("White" = "txt:white", "Black" = "txt:black", "Red" = "txt:red", "Blue" = "txt:blue", "Green" = "txt:green", "Yellow" = "txt:yellow", "Orange" = "txt:orange", "Purple" = "txt:purple"), 
                "Background Color" = list("White" = "bg:white", "Black" = "bg:black", "Red" = "bg:red", "Blue" = "bg:blue", "Green" = "bg:green", "Yellow" = "bg:yellow", "Orange" = "bg:orange", "Purple" = "bg:purple"))


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
  
  observe({
    
    if(input$test > 0) {
      
      updateDropDown(session, "ndd1", choices = ch)
      
    }
    
  })
  
})