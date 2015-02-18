shinyServer(function(input, output, session) {
  
  for(r in seq(nrow(g))) {
    id <- paste(g[r, 1], g[r, 2], g[r, 3], sep = "_")
    createAlert(session, g[r, 1], id, type = types[g[r, 2]], title = titles[g[r, 2]], message = messages[g[r, 2]], dismiss = g[r, 3])
  }
  
  observe({
    if(input$but1 > 0) {
      for(r in seq(nrow(g))) {
        id <- paste("post", g[r, 1], g[r, 2], g[r, 3], sep = "_")
        createAlert(session, g[r, 1], id, type = types[g[r, 2]], title = titles[g[r, 2]], message = messages[g[r, 2]], dismiss = g[r, 3])
      }
    }
  })
  
  observe({
    if(input$but2 > 0) {
      for(r in seq(nrow(g))) {
        id <- paste("post", g[r, 1], g[r, 2], g[r, 3], sep = "_")
        closeAlert(session, id)
      }    
    }
  })
  
  observe({
    if(input$but3 > 0) {
      createAlert(session, "alert2", "appender", "Information", "This information alert should overwrite alert anchor #2.", append = FALSE)
    }
  })
  
  observe({
    closeAlert(session, "text_test")
    x <- as.numeric(input$text1)
    if(is.na(x)) {
      createAlert(session, "textAlert", "text_test", title = "Text Test", "You must enter numeric input!", type = "info")
    } else if(x > 100) {
      createAlert(session, "textAlert", "text_test", title = "Text Test", "Congratulations! You entered a number above 100!", type = "success")
    } else {
      createAlert(session, "textAlert", "text_test", title = "Text Test", "Danger! You have entered a number less than or equal to 100!", type = "danger")
    }
    
    
  })
  
})