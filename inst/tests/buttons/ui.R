library(shiny)
library(shinyBS)

shinyUI({fluidPage(
  fluidRow(tags$head(tags$title("shinyBS Buttons Test")),
    column(width = 4, id = "actionButs", h2("Action Buttons"), actBtns),
    column(width = 4, id = "toggleButs", h2("Toggle Buttons"), togBtns),
    column(width = 2, h2("ActionButton Outputs"), actText),
    column(width = 2, h2("ToggleButton Outputs"), togText)
  )
)
  
})