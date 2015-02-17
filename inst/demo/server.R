library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  observeEvent(input$bsAlertCreate, {
    
    createAlert(session, "bsAlertDemo", message = input$bsAlertMessage, type = input$bsAlertType)

  })
  
})