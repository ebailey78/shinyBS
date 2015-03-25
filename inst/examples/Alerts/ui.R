library(shiny)
library(shinyBS)
   fluidPage(
     sidebarLayout(
       sidebarPanel(textInput("num1", NULL, value = 100),
         "divided by", textInput("num2", NULL, value = 20),
         "equals", textOutput("exampleOutput")),
       mainPanel(
         bsAlert("alert")
       )
     )
)

