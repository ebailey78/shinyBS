library(shiny)
library(shinyBS)
   fluidPage(
     sidebarLayout(
       sidebarPanel(
         sliderInput("bins",
                     "Move the slider to see its effect on the button below:",
                     min = 1,
                     max = 50,
                     value = 1),
         bsButton("actTwo", label = "Click me if you dare!", icon = icon("ban")),
         tags$p("Clicking the first button below changes the disabled state of the second button."),
         bsButton("togOne", label = "Toggle button disabled status",
                  block = TRUE, type = "toggle", value = TRUE),
         bsButton("actOne", label = "Block Action Button", block = TRUE)

       ),
       mainPanel(
         textOutput("exampleText")
       )
     )
)

