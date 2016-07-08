library(shiny)
library(shinyBS)
shinyServer(
 function(input, output, session) {
   output$genericPlot <- renderPlot(plot(rnorm(100)))
   observeEvent(input$p1Button, ({
     updateCollapse(session, "collapseExample", open = "Panel 1")
   }))
   observeEvent(input$styleSelect, ({
     updateCollapse(session, "collapseExample", style = list("Panel 1" = input$styleSelect))
   }))
 }
)
