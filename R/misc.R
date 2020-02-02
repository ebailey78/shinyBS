.onLoad <- function(...) {
  
  # Create link to javascript and css files for package
  shiny::addResourcePath("sbs", system.file("www", package="shinyBS"))
  
}

sbsDep <- function(scripts = NULL, styles = NULL) {
  if(!is.null(scripts)) {
    scripts <- paste0("scripts/", scripts)
  }
  if(!is.null(styles)) {
    styles <- paste0("styles/", styles)
  }
  htmltools::htmlDependency(
    "shinyBS", 
    packageVersion("shinyBS"), 
    src = c("href" = "sbs"), 
    script = scripts, 
    stylesheet = styles
  )
}

# Copy of dropNulls function for shiny to avoid using shiny:::dropNulls
dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}

addAttribs <- function(tag, ...) {
  a <- list(...)
  for(i in seq(length(a))) {
    tag$attribs[names(a)[i]] = a[[i]]
  }
  return(tag)
}

removeAttribs <- function(tag, ...) {
  a <- list(...)
  for(i in seq(length(a))) {
    tags$attribs[a[[i]]] = NULL
  }
  return(tag)
}

getAttribs <- function(tag) {
  tag$attribs
}
