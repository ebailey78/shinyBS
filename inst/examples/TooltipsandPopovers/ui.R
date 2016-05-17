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
       selectInput("pointlessSelect", "Pointless Select", choices = c("A", "B", "C"), selectize = FALSE),
       bsTooltip("pointlessSelect", "This is another pointless input element, its just here to look pretty."),
       bsTooltip("bins", "The wait times will be broken into this many equally spaced bins",
         "right", options = list(container = "body"))
     ),
     mainPanel(
       plotOutput("distPlot"),
       dataTableOutput("dataTable"),
       uiOutput("uiExample"),
       bsPopover("dataTable", "A popover", "This is a popover. I hope it works.", placement = "left")
     )
   )
)

