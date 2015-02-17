library(shiny)
library(shinyBS)

demoPanel <- function(title, controls, example) {
  tabPanel(title,
    fluidRow(
      column(3, wellPanel(controls)),
      column(9, example)
    )
  )
}

fluidPage(
  titlePanel("shinyBS Demo"),
  tabsetPanel(id = "bsDemo",
    demoPanel("Alerts", 
              controls = tagList(textInput("bsAlertTitle", "Alert Title", value = ""),
                                 textInput("bsAlertMessage", "Alert Message", value = "This is an alert."),
                                 selectInput("bsAlertType", "Alert Type", choices = c("warning", "danger", "info", "success"), selected = "info"),
                                 checkboxInput("bsAlertDismiss", "Dismissable", value = TRUE),
                                 checkboxInput("bsAlertAppend", "Append Alerts", value = TRUE),
                                 actionButton("bsAlertCreate", "Create Alert")),
              example = bsAlert("bsAlertDemo")
    ),
    tabPanel("Tab 2",
      fluidRow(
        column(12,
          "This is the end."
        )
      )
    )
  )
)