.onAttach <- function(...) {
  
  require(shiny)
  
  addResourcePath("tbs", system.file("www", package="shinyBS"))
  
}