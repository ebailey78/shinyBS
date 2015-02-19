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
  
  Collapses <- observe({
    
    ui <- '
bsCollapse(id = "collapseExample", multiple = TRUE, open = c("Text", "Shiny Outputs"),
  bsCollapsePanel("Text", 
                  HTML("You may want more explanation or instructions for your Shiny app than is reasonable to display at all times. Wrap this text in a <code>bsCollapse</code> and the user can hide it when they are done with it and easily bring it back if they need to reference it again.</p>")
                 ),
  bsCollapsePanel("Shiny Outputs", 
                  tagList(tags$span("You can embed Shiny outputs into your collapses."), 
                          plotOutput("collapsePlot"))
                 )
)
'
    session$sendCustomMessage('displayCode', list(id = "Collapses_ui", content = ui))
    
  })
  
  output$collapsePlot <- renderPlot({
    plot(rnorm(100))
  })
    
})