library(shiny)
library(shinyBS)
 fluidPage(
   sidebarLayout(
     sidebarPanel(HTML("This button will open Panel 1 using <code>updateCollapse</code>."),
                  actionButton("p1Button", "Push Me!"),
                  selectInput("styleSelect", "Select style for Panel 1",
                   c("default", "primary", "danger", "warning", "info", "success"))
     ),
     mainPanel(
       bsCollapse(id = "collapseExample", open = "Panel 2",
                  bsCollapsePanel("Panel 1", "This is a panel with just text ",
                   "and has the default style. You can change the style in ",
                   "the sidebar.", style = "info"),
                  bsCollapsePanel("Panel 2", "This panel has a generic plot. ",
                   "and a 'success' style.", plotOutput("genericPlot"), style = "success")
       )
     )
   )
)

