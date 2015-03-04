library(shiny)
library(shinyBS)

demoPanel <- function(title, intro, controls, example) {
  tabPanel(title,
    fluidRow(style = 'padding-top: 10px;',
      column(8, 
        fluidRow(
          column(12, class = "intro", 
            bsCollapse(id = paste(gsub(" ", "_", title, fixed = TRUE), "intro", sep = "_"), open = "Introduction",
              bsCollapsePanel("Introduction", HTML(intro))
            )
          )
        ),
        fluidRow(
          column(4, 
            bsCollapse(id = paste(gsub(" ", "_", title, fixed = TRUE), "controls", sep = "_"), open = "Controls",
              bsCollapsePanel("Controls", controls)
            )
          ),
          column(8, 
             bsCollapse(id = paste(gsub(" ", "_", title, fixed = TRUE), "example", sep = "_"), open = "Example",
                        bsCollapsePanel("Example", example)
             )
          )
        )
      ),
      column(4,
        fluidRow(
          column(12, 
            bsCollapse(id = paste(gsub(" ", "_", title, fixed = TRUE), "code", sep = "_"), open = c("UI", "Server"), multiple = TRUE,
              bsCollapsePanel("UI", tags$pre(id = paste(gsub(" ", "_", title, fixed = TRUE), "ui", sep = "_"), class = "r code shiny-text-output", "")),
              bsCollapsePanel("Server", tags$pre(tags$div(id = paste(gsub(" ", "_", title, fixed = TRUE), "server", sep = "_"), class = "r code shiny-text-output", "")))
            )
          )
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
    demoPanel("Collapses",
              intro = "<p>Collapses are a way to reduce clutter in your Shiny app by allowing users to decide which elements they want visible at any given time. This demo makes extensive use of collapses. Each section is wrapped in a collapse element so that it can be hidden or shown with a click.</p>",
              controls = tagList(checkboxInput("bsCollapseMultiple", "Multiple", value = TRUE),
                                 selectInput("bsCollapseTextStyle", "'Text' Style", choices = c("default", "warning", "danger", "info", "success"), selected = "default"),
                                 selectInput("bsCollapseOutputStyle", "'Shiny Outputs' Style", choices = c("default", "warning", "danger", "info", "success"), selected = "default")),
              example = bsCollapse(id = "collapseExample", multiple = TRUE, open = c("Text", "Shiny Outputs"),
                          bsCollapsePanel("Text", HTML("You may want more explanation or instructions for your Shiny app than is reasonable to display at all times. Wrap this text in a <code>bsCollapse</code> and the user can hide it when they are done with it and easily bring it back if they need to reference it again.</p>")),
                          bsCollapsePanel("Shiny Outputs", tagList(tags$span("You can embed Shiny outputs into your collapses."), plotOutput("collapsePlot")))
                        )
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