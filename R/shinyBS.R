.onAttach <- function(...) {
  
  # Create link to javascript and css files for package
  shiny::addResourcePath("sbs", system.file("www", package="shinyBS"))
  
}

# Create a dependency for shinyBS components
shinyBSDep <- htmltools::htmlDependency("shinyBS", packageVersion("shinyBS"), src = c("href" = "sbs"), script = "shinyBS.js", stylesheet = "shinyBS.css")

# Copy of dropNulls function from shiny to avoid using shiny:::dropNulls
dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}
