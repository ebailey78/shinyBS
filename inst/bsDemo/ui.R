library(shiny)
library(shinyBS)

demoPanel <- function(title, intro, controls, example) {
  tabPanel(title,
    fluidRow(style = 'padding-top: 10px;',
      column(8, 
        fluidRow(
          column(12, class = "intro", HTML(intro))
        ),
        fluidRow(
          column(4, wellPanel(controls)),
          column(8, example)
        )
      ),
      column(4,
        fluidRow(
          column(12, "ui.R", tags$div(id = paste(gsub(" ", "_", title, fixed = TRUE), "ui", sep = "_"), class = "r code shiny-text-output", ""))
        ),
        fluidRow(
          column(12, "server.R", tags$div(id = paste(gsub(" ", "_", title, fixed = TRUE), "server", sep = "_"), class = "r code shiny-text-output", ""))
        )
      )   
    )
  )
}

fluidPage(style = "padding-top: 20px;",
  tags$head(
    tags$link(rel = "stylesheet", href = "styles/xcode.css"),
    tags$link(rel = "stylesheet", href = "demo.css"),
    tags$script(src = "highlight.pack.js"),
    tags$script(src = "demo.js"),
    tags$title("shinyBS Demo")
  ),
  tabsetPanel(id = "bsDemo", position = "left",
    demoPanel("Alerts", 
              intro = "<p>Alerts allow you to communicate information to the user on the fly. Begin by creating an alert anchor with the <code>bsAlert()</code> function in the iu.R script. You can then add alerts to this anchor with <code>createAlert()</code> and remove them with <code>closeAlert()</code>.</p><p>By default, new alerts are placed below any alerts already present in the alert anchor but if you set <code>append = FALSE</code> in <code>createAlert()</code> the new alert will overwrite any existing alerts. </p><p> Also by default, alerts will be dismissable by the user with a small &times; in the upper-right corner of the alert. You can override this behavior by setting <code>dismiss = FALSE</code> in <code>createAlert()</code>. The alert can then only be removed using <code>closeAlert()</code> (be sure to set <code>alertId</code> when you create the alert) or by creating a new alert with <code>append = FALSE</code> in the same anchor.</p>",
              controls = tagList(textInput("bsAlertId", "Alert ID"),
                                 textInput("bsAlertTitle", "Alert Title", value = "Alert"),
                                 textInput("bsAlertContent", "Alert Content", value = "This is an alert."),
                                 selectInput("bsAlertStyle", "Alert Style", choices = c("warning", "danger", "info", "success"), selected = "info"),
                                 checkboxInput("bsAlertDismiss", "Dismissable", value = TRUE),
                                 checkboxInput("bsAlertAppend", "Append Alert", value = TRUE),
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