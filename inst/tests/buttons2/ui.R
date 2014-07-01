library(shiny)
library(shinyBS)



shinyUI(fluidPage(
  fluidRow(tags$head(tags$title("shinyBS Buttons Update Test")),
    column(width = 4, id = "col1", tags$h3("Test Buttons"),
           bsActionButton("actionTest", "actionButton"),
           bsToggleButton("toggleTest", "toggleButton")#,
#            bsButtonGroup("bGone", label = "Checkbox Toggle", style = "warning", size = "mini", block = TRUE, disabled = FALSE,
#                          bsButton("bGone1", "dog", value = "dog"),
#                          bsButton("bGone2", "cat", value = "cat"),
#                          bsButton("bGone3", "cow", value = "cow")
#                          ),
#            bsButtonGroup("bGtwo", label = "Radio Toggle", toggle = "radio", style = "warning", size = "mini", block = TRUE, disabled = FALSE,
#                          bsButton("bGtwo1", "dog", value = "dog"),
#                          bsButton("bGtwo2", "cat", value = "cat"),
#                          bsButton("bGtwo3", "cow", value = "cow")
#                          )
           ),
          
    column(width = 4, id = "col2", tags$h3("Control Buttons"),
           actionButton("aBdis", "Disable actionButton"),
           actionButton("tBdis", "Disable toggleButton"),
           actionButton("aBstyle", "Change actionButton Style"),
           actionButton("tBstyle", "Change toggleButton Style"),
           actionButton("aBsize", "Change Action Button Size"),
           actionButton("tBsize", "Change Toggle Button Size"),
           actionButton("aBblock", "Make actionButton Block"),
           actionButton("tBblock", "Make toggleButton Block"),
           textInput("aBlabel", "actionButton Label", value = "actionButton"),
           textInput("tBlabel", "toggleButton Label", value = "toggleButton")
           ),
    column(width = 4, id = "col3", tags$h3("Button Outputs"),
           textOutput("aBvalue"),
           textOutput("tBvalue")
           )
  )
))