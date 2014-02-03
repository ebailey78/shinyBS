library(shiny)
library(shinyBS)

shinyUI(pageWithNavBar(
  title = "shinyBS Showcase",
  navbar = bsNavBar("nb1", "shinyBS", fixed=TRUE,
                    leftItems = list(
                      bsNavDropDown("ddDist", label = "Distribution",
                                    choices=c("Normal", "Lognormal", "Gamma", "Uniform", "Exponential"),
                                    selected = "Normal"),
                      bsNavTextInput("tiSize", label = "Sample Size", value = 100))
)