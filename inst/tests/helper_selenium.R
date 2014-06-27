
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

findElement <- function(remDr, attr) {
  function(value) {
    return(remDr$findElement(using = attr, value = value))
  }
}

findChild <- function(attr) {
  function(par, value) {
    return(par$findChildElement(using = attr, value = value))
  }
}

childBySel <- findChild("css selector")

getAttribute <- function(attr) {
  function(el) {
    return(el$getElementAttribute(attr)[[1]][1])
  }
}

getId <- getAttribute("id")
getClass <- getAttribute("class")
getTag <- function(el) {
  return(el$getElementTagName()[[1]][1])
}

elementExists <- function(remDr, id) {
  return(remDr$findElement(using = "id", value = id)$getElementAttribute("id")[[1]][1] == id)
}

hasClass <- function(remDr, id, class) {
  el <- remDr$findElement(using = "id", value = id)
  cl <- unlist(strsplit(getClass(el), " "))
  return(class %in% cl)
}