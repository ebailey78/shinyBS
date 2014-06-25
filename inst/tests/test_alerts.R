library(shiny)
library(shinyBS)
library(snow)

cl <- makeSOCKcluster(3, outfile = "test.txt")
cl <- makePVMcluster(1)
y <- shinyApp(
    ui = fluidPage(
        fluidRow(
          column(width = 2,
                 bsActionButton("addAlerts", "Add Alerts"),
                 bsActionButton("removeAlerts", "Remove Alerts")
          ),
          column(width = 5,
                 bsAlert("alert")
          ),
          column(width = 5,
                 bsAlert("alert")
          )
        )
    ),
    server = function(input, output, session) {
      observe({
  
      })
    },
    options = list(port = 8080)
  
)
clusterEvalQ(cl, library(shiny))
clusterEvalQ(cl, library(shinyBS))
clusterEvalQ(cl, shinyApp(
  ui = fluidPage(
    fluidRow(
      column(width = 2,
             bsActionButton("addAlerts", "Add Alerts"),
             bsActionButton("removeAlerts", "Remove Alerts")
      ),
      column(width = 5,
             bsAlert("alert")
      ),
      column(width = 5,
             bsAlert("alert")
      )
    )
  ),
  server = function(input, output, session) {
    observe({
      
    })
  },
  options = list(port = 8080)
 
)
             
             
             )
