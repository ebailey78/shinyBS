library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  Alerts <- observeEvent(input$bsAlertCreate, {
    
    ui <- "bsAlert(anchorId = 'bsAlertDemo')"
    session$sendCustomMessage('displayCode', list(id = "Alerts_ui", content = ui))
    
    svr <- "createAlert(session, anchorId = 'bsAlertDemo'"
    if(input$bsAlertTitle != "") svr <- paste0(svr, ", title = '", input$bsAlertTitle, "'")
    if(input$bsAlertContent != "") svr <- paste0(svr, ", content = '", input$bsAlertContent, "'")
    svr <- paste0(svr, ", style = '", input$bsAlertStyle, "'")
    if(input$bsAlertDismiss == FALSE) svr <- paste0(svr, ", dismiss = FALSE")
    if(input$bsAlertAppend == FALSE) svr <- paste0(svr, ", append = FALSE")
    svr <- paste0(svr, ")")
    
    session$sendCustomMessage("displayCode", list(id = "Alerts_server", content = svr))
    
    eval(parse(text = svr))
    
  })
    
})