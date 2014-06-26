library(shiny)
library(shinyBS)
library(parallel)

cl <- makeCluster(1)

y <- function() {
  library(shiny)
  library(shinyBS)
  shinyApp(
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
}

clusterCall(cl, y)
