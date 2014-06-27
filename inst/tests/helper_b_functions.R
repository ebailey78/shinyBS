# These function build other functions that make it easier to locate elements on
# the page or find information about an element.
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

findChildren <- function(attr) {
  function(par, value) {
    return(par$findChildElements(using = attr, value = value))
  }
}

getAttribute <- function(attr) {
  function(el) {
    return(el$getElementAttribute(attr)[[1]][1])
  }
}

childBySel <- findChild("css selector")

getId <- getAttribute("id")
getClass <- getAttribute("class")
getTag <- function(el) {
  return(el$getElementTagName()[[1]][1])
}

#Test for the existence of an element with an id
elementExists <- function(remDr, id) {
  return(remDr$findElement(using = "id", value = id)$getElementAttribute("id")[[1]][1] == id)
}

# Checks if at least one child exists of 'el' with an 'attr' matching 'value'
childExists <- function(el, attr, value) {
  children <- findChildren(attr)(el, value)
  return(length(children) > 0)
}

# Test for the existence of a class in an element
hasClass <- function(el, class) {
  cl <- unlist(strsplit(getClass(el), " "))
  return(class %in% cl)
}

# Tests whether an input element has been bound by shiny
checkInputBinding <- function(el) {
  hasClass(el, "shiny-bound-input")
}