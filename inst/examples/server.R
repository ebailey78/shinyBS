library(shiny)
library(shinyBS)
lorem1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur sit amet ipsum et adipiscing. Mauris quis nunc tincidunt, tincidunt mauris et, eleifend diam. Nam eu venenatis metus, sit amet eleifend sapien. Mauris posuere ipsum ac lacus tincidunt dapibus. Donec sollicitudin at orci vel dictum. Quisque viverra ipsum vel metus malesuada, sed venenatis nibh elementum. Vestibulum tempus mauris euismod odio tincidunt commodo. Etiam a mauris erat. Etiam volutpat lacus vitae interdum sollicitudin. Pellentesque neque dui, gravida nec ullamcorper eget, malesuada vel purus. Quisque eget congue orci. Duis fermentum justo at purus ultrices viverra sagittis ac lectus. Suspendisse turpis felis, imperdiet eget dignissim at, varius nec urna. Sed vel nibh id justo pharetra mattis sed non enim. Donec faucibus, lectus quis aliquam facilisis, nibh arcu tincidunt ipsum, sagittis venenatis dolor felis a leo."
lorem2 = "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis pulvinar lorem ut sem malesuada, varius vestibulum dui ultrices. Praesent non sodales mauris, vitae mattis felis. Nulla facilisi. Nulla molestie, orci ut placerat scelerisque, nunc massa porttitor enim, id sagittis ante nulla sed quam. Morbi vulputate placerat est ut vehicula. Curabitur justo dolor, luctus quis tellus interdum, dictum feugiat nibh. Nulla eu purus porttitor metus feugiat congue. Aenean porttitor nisi urna, eu fermentum arcu cursus ac. Nam ultrices justo a enim pretium egestas. "
lorem3 = "Curabitur tempor eleifend libero, a vehicula orci pretium ut. Fusce pretium placerat faucibus. Quisque accumsan nulla dui. Integer mattis lorem id ornare convallis. Sed feugiat suscipit odio, sit amet congue urna lacinia nec. Mauris tempus magna nibh, ac varius nunc sodales nec. Vivamus vitae lectus condimentum, molestie felis vitae, cursus purus. "
lorem4 = "Donec luctus nunc non nulla hendrerit, non fermentum velit imperdiet. Morbi luctus cursus dui id tincidunt. Pellentesque interdum pulvinar felis eu vestibulum. Aliquam erat volutpat. Vestibulum mi purus, vestibulum vel sollicitudin non, interdum et dolor. Donec ut nibh massa. Integer adipiscing convallis sem, dignissim consectetur metus semper sed. Praesent sapien ipsum, dapibus in pulvinar eu, interdum hendrerit ligula. Interdum et malesuada fames ac ante ipsum primis in faucibus."
lorem5 = "Morbi ultricies quam sit amet tellus vehicula, vitae vulputate felis congue. Ut molestie blandit scelerisque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla ornare nisl at elementum vestibulum. Integer ac nulla elementum, eleifend justo vitae, rhoncus risus. Cras ullamcorper venenatis risus eget laoreet. Duis ut viverra elit. Nunc a mollis risus. Nulla aliquet nec eros nec volutpat. Proin id consequat nulla. Nulla accumsan quam arcu, sit amet luctus neque congue malesuada. Quisque viverra accumsan laoreet. Vivamus non purus eu urna tempor tempus. Etiam eget nulla eu leo tristique consectetur id et urna. "

shinyServer(function(input, output, session) {
  
  addTooltip(session, "link1", title="Click Me!")
  createAlert(session, "alert_anchor", message="This is a standard alert.")
  createAlert(session, "alert_anchor", message="This is an error alert.", type="error")
  createAlert(session, "alert_anchor", message="This is an info alert.", type="info")
  createAlert(session, "alert_anchor", message="This is a success alert.", type="success")
  createAlert(session, "alert_anchor2", alertId="dismiss_ex", message="This alert cannot be dismissed by the user.", dismiss=FALSE)
  createAlert(session, "alert_anchor3", title="This is the title", message="And this is the message.")
  createAlert(session, "alert_anchor4", title="This is the title", message=lorem1, block = TRUE)
  createAlert(session, "alert_anchor4", message=lorem2, block = TRUE)
  
  pb <- observe({
    if(input$pbradio == "none") {
      striped=FALSE
      animate=FALSE
    } else if(input$pbradio == "striped") {
      striped=TRUE
      animate=FALSE
    } else {
      striped=TRUE
      animate=TRUE
    }
    updateProgressBar(session, "pb1", value=input$pbnumb, visible=!input$pbcb, color=input$pbselect, striped=striped, animate=animate)

  })
  
  to <- observe({
    if(input$ac > 0) {
      closeAlert(session, "dismiss_ex")
    }
  })
  
  output$text1 <- renderText({
    
   # updateBSNavDropDown(session, "dd1", label="What")
    if(input$dd1=="") {
      return("What is your favorite fruit?")
    } else {    
      return(paste0("Your favorite fruit is ", input$dd1, "."))
    }
 
  })
  
  output$hist <- renderPlot({
    hist(rnorm(400))
    
    }, width=600)
  
  output$hist1 <- renderPlot({
    hist(rnorm(500))
  })
  
  output$box1 <- renderPlot({
    a <- rnorm(100, 5, 2)
    b <- rnorm(100, 2, 1)
    c <- rnorm(100, 10, 3)
    boxplot(list(a,b,c))
  })
  
  outputOptions(output, "hist1", suspendWhenHidden=FALSE)
  outputOptions(output, "box1", suspendWhenHidden=FALSE)
  
})