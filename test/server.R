
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output, session) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })
  
  output$scatter <- renderPlot({plot(faithful)})
  
  observeEvent(input$openDefault, ({createAlert(session, "mainAlert", "test", "This is an alert.", "This is only an alert.")}))
  observeEvent(input$closeDefault, ({closeAlert(session, "test")}))
  observeEvent(input$openDanger, ({createAlert(session, "mainAlert", "testDanger", "This is an alert.", "This is only an alert.", type = "danger")}))
  observeEvent(input$closeDanger, ({closeAlert(session, "testDanger")}))
  
  observeEvent(input$openDist, updateCollapse(session, "testCollapse", open = "distPlotPanel"))
  observeEvent(input$closeDist, updateCollapse(session, "testCollapse", close = "distPlotPanel"))
  
  observeEvent(input$typeChange, updateCollapse(session, "testCollapse", type = list(distPlotPanel = "info", info = "warning", scatterPlotPanel = "default")))

  observe({
    print(input$testModal)
  })
  
})

