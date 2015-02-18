library(shiny)
library(shinyBS)

demoPanel <- function(title, intro, controls, example) {
  tabPanel(title,
    fluidRow(style = 'padding-top: 10px;',
      column(8, 
        fluidRow(
          column(12, intro)
        ),
        fluidRow(
          column(4, wellPanel(controls)),
          column(8, example)
        )
      ),
      column(4,
        fluidRow(
          column(12, "ui.R", tags$pre(style = "background: none;", tags$code(id = paste(gsub(" ", "_", title, fixed = TRUE), "ui", sep = "_"), clas = "r", "library(shiny)
library(shinyBS)")))
        ),
        fluidRow(
          column(12, "server.R", tags$pre(style = "background: none;", tags$code(id = paste(gsub(" ", "_", title, fixed = TRUE), "ui", sep = "_"), clas = "r", "library(shiny)
library(shinyBS)

shinyServer(function(input, output, session) {
                                                                                 

}")))
        )
      )   
    )
  )
}

fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", href = "styles/xcode.css"),
    tags$script(src = "highlight.pack.js"),
    tags$script("hljs.initHighlightingOnLoad();")
  ),
  titlePanel("shinyBS Demo"),
  tabsetPanel(id = "bsDemo", type = "pills",
    demoPanel("Alerts", 
              intro = "Alerts offer a way to convey information to the user about what is happening behind the scenes or how their selections are affecting the shiny app.",
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