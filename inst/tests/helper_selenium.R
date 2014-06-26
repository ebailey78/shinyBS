
if(!require(RSelenium)) {
  install.packages("RSelenium")
  library(RSelenium)
}

library(shiny)
library(testthat)
library(shinyBS)

#Install the server if it isn't already present
RSelenium::checkForServer()

# Starts the selenium server
RSelenium::startServer()