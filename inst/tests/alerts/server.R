library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  createAlert(session, "alert1", "warn1", type = "warning", "Warning", "This is the first warning test.")
  createAlert(session, "alert1", "dang1", type = "danger", "Danger", "This is the first danger test.")
  createAlert(session, "alert1", "info1", type = "info", "Information", "This is the first information test.")
  createAlert(session, "alert1", "succ1", type = "success", "Success", "This is the first success test.")
  
  createAlert(session, "alert2", "warn2", type = "warning", "Warning", "This is the second warning test.")
  createAlert(session, "alert2", "dang2", type = "danger", "Danger", "This is the second  danger test.")
  createAlert(session, "alert2", "info2", type = "info", "Information", "This is the second  information test.")
  createAlert(session, "alert2", "succ2", type = "success", "Success", "This is the second  success test.")
  
  createAlert(session, "alert1", "warn3", type = "warning", dismiss = FALSE, "Warning", "This is the third warning test.")
  createAlert(session, "alert1", "dang3", type = "danger", dismiss = FALSE, "Danger", "This is the third danger test.")
  createAlert(session, "alert1", "info3", type = "info", dismiss = FALSE, "Information", "This is the third information test.")
  createAlert(session, "alert1", "succ3", type = "success", dismiss = FALSE, "Success", "This is the third success test.")
  
  observe({
    if(input$but1 > 0) {
      createAlert(session, "alert2", "warn4", type = "warning", "Warning", "This is another warning test.")
      createAlert(session, "alert2", "dang4", type = "danger", "Danger", "This is another  danger test.")
      createAlert(session, "alert2", "info4", type = "info", "Information", "This is another  information test.")
      createAlert(session, "alert2", "succ4", type = "success", "Success", "This is another success test.")
    }
  })
  
  observe({
    if(input$but2 > 0) {
      closeAlert(session, "warn1")
      closeAlert(session, "dang2")
      closeAlert(session, "info3")
      closeAlert(session, "succ4")
    }
  })
  
  observe({
    if(input$but3 > 0) {
      createAlert(session, "alert2", "info5", "Information", "This information alert is overwriting alert anchor #2.", append = FALSE)
    }
  })
  
  observe({
    closeAlert(session, "text_test")
    x <- as.numeric(input$text1)
    if(is.na(x)) {
      createAlert(session, "alert1", "text_test", title = "Text Test", "You must enter numeric input!", type = "info")
    } else if(x > 100) {
      createAlert(session, "alert1", "text_test", title = "Text Test", "Congratulations! You entered a number above 100!", type = "success")
    } else {
      createAlert(session, "alert1", "text_test", title = "Text Test", "Danger! You have entered a number less than or equal to 100!", type = "danger")
    }
    
    
  })
  
})