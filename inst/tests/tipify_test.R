library(shiny)
library(shinyBS)

shinyApp(
  ui =
    fluidPage(
      tabsetPanel(
        tabPanel("Tab #1",
          plotOutput("genericPlot")
        ),
        tabPanel("Tab #2",
          checkboxInput("showOptions", "Show Options"),
          uiOutput("ui_multiview_customize"),
          plotOutput("multiview_plot")
        )
      )
    ),  
  server =
    function(input, output, session) {
      output$genericPlot <- renderPlot(plot(rnorm(1000)))
      output$multiview_plot <- renderPlot(plot(runif(1000)))
      output$ui_multiview_customize <- renderUI({
        if(input$showOptions) {
          bsCollapse(
            bsCollapsePanel(title = "View Options",
                            checkboxInput("multiview_checkbox", label = "Include warmup", value = FALSE),
                            hr(),
                            tipify(downloadButton("download_multiview", "Save as ggplot2 objects"), 
                                   title = "Save ggplot2 object in .RData file.", placement="right")
            )
          )
        }
      })
    }
)
