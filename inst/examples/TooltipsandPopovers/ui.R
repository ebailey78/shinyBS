library(shiny)
library(shinyBS)
 fluidPage(
   sidebarLayout(
     sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30),
       bsTooltip("bins", "The wait times will be broken into this many equally spaced bins",
         "right", options = list(container = "body"))
     ),
     mainPanel(
       plotOutput("distPlot"),
       uiOutput("uiExample")
     )
   )
)

