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
       actionButton("tabBut", "View Table")
     ),

     mainPanel(
       plotOutput("distPlot"),
       bsModal("modalExample", "Data Table", "tabBut", size = "large",
         dataTableOutput("distTable"))
     )
   )
)

