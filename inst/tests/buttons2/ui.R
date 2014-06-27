library(shiny)
library(shinyBS)

shinyUI(fluidPage(
  fluidRow(
    column(width = 4, id = "col1",
           bsActionButton("actionTest", "actionButton"),
           bsToggleButton("toggleTest", "toggleButton")),
    column(width = 4, id = "col2"),
    column(width = 4, id = "col3")
  )
))