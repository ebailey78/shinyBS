library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
  
  output$text1 <- renderText({
    
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