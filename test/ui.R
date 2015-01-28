
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinyBS)

shinyUI(fluidPage(
  tags$script(src = "shinyBS.js"),
  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      actionButton("openDefault", "Open Default"),
      actionButton("closeDefault", "close Default"),
      actionButton("openDanger", "Open Danger"),
      actionButton("closeDanger", "Close Danger"),
      actionButton("openDist", "Open Distribution Plot"),
      actionButton("closeDist", "Close Distribution Plot"),
      actionButton("typeChange", "Test Type Change"),
      actionButton("openModal", "Open Modal", class = "btn-primary"),
      bsButton("testToggle", "Toggle", style = "primary", type = "toggle"),
      bsButton("testerButton", "Tester Button"),
      bsButton("testeeButton", "Testee Button", disabled = TRUE),
      icon("birthday-cake"),
      bsButtonGroup("testGroup",
                    bsButton("testGroup1", "Test 1"),
                    bsButton("testGroup2", "Test 2"),
                    bsButton("testGroup3", "Test 3"))
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      bsAlert("mainAlert"),
      bsCollapse(id = "testCollapse", open = "scatterPlotPanel", multiple = FALSE,
        bsCollapsePanel("Information", id = "info", value = "info", type = "info", "this is some information about the page."),
        bsCollapsePanel("Distribution Plot", id = "distPlotPanel", value = "distPlot", type = "danger",
                        plotOutput("distPlot")  
        ),
        bsCollapsePanel("Scatterplot", id = "scatterPlotPanel", value = "scatter", type = "success",
                        plotOutput("scatter")
        )
      ),
      bsModal(id = "testModal", title = "Test Modal", trigger = "openModal", tags$p("This is a test"), size = "large"),
      bsTooltip("openDefault", options = list(title = "This is a tooltip", placement = "top")),
      bsPopover("typeChange", title = "Change Types", content = "This button will change the styling of the collapse panels. Its pretty cool.")
    )
  )
))
