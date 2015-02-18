
library(shiny)
library(shinyBS)

shinyUI(fluidPage(
  fluidRow(tags$head(tags$title("shinyBS Alerts Test")),
    column(width = 4,
           actionButton("but1", "Add Alerts"),
           actionButton("but2", "Remove Alerts"),
           actionButton("but3", "Append = FALSE"),
           textInput("text1", "Text Input"),
           bsAlert("textAlert")
           ),
    column(width = 4,
           bsAlert("alert1")
           ),
    column(width = 4,
           bsAlert("alert2")
           )
    )
  )
)