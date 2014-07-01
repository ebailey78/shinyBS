library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  output$aBvalue <- renderText(input$actionTest)
  output$tBvalue <- renderText(input$toggleTest)
  
  observe({
    if(input$aBdis > 0) {
      if(input$aBdis %% 2 == 1) {
        dis = TRUE
      } else {
        dis = FALSE
      }
      updateButton(session, "actionTest", disabled = dis)
    }
  })

  observe({
    if(input$tBdis > 0) {
      if(input$tBdis %% 2 == 1) {
        dis = TRUE
      } else {
        dis = FALSE
      }
      updateButton(session, "toggleTest", disabled = dis)
    }
  })
  
  observe({
    
    if(input$aBstyle > 0) {
      style <- c("default", "primary", "info", "success", "warning", "danger", "inverse", "link")[input$aBstyle %% 8 + 1]
      updateButton(session, "actionTest", style = style)  
    }
      
  })
 
  observe({
    
    if(input$tBstyle > 0) {
      style <- c("default", "primary", "info", "success", "warning", "danger", "inverse", "link")[input$tBstyle %% 8 + 1]
      updateButton(session, "toggleTest", style = style)  
    }
    
  })
  
  observe({
    if(input$aBsize > 0) {
      size <- c("default", "large", "mini", "small")[input$aBsize %% 4 + 1]
      updateButton(session, "actionTest", size = size)
    }
  })
  
  observe({
    if(input$tBsize > 0) {
      size <- c("default", "large", "mini", "small")[input$tBsize %% 4 + 1]
      updateButton(session, "toggleTest", size = size)
    }
  })
  
  observe({
    if(input$aBblock > 0) {
      block = c(FALSE, TRUE)[input$aBblock %% 2 + 1]
      updateButton(session, "actionTest", block = block)
    }
  })
 
  observe({
    if(input$tBblock > 0) {
      block = c(FALSE, TRUE)[input$tBblock %% 2 + 1]
      updateButton(session, "toggleTest", block = block)
    }
  })
  
  observe({
    updateButton(session, "actionTest", label = input$aBlabel)
  })
  
  observe({
    updateButton(session, "toggleTest", label = input$tBlabel)
  })
  
})