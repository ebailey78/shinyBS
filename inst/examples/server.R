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
  
})