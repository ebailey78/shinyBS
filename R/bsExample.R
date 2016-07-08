#'bsExample
#'
#'A function to view examples of shinyBS functionality. Will run the examples
#'found in the examples sections of shinyBS documentation. Use this instead of 
#'\code{example}. 
#'
#'@param family A shinyBS family name
#'@param display.mode The display mode to use when running the example. See
#'\code{\link{runApp}}.
#'@param \dots Other parameters to pass to \code{\link{runApp}}.
#'
#'@details
#'This function is just a wrapper for \code{\link{runApp}} that runs copies of the
#'examples found in the family documention pages of \code{shinyBS}. By default,
#'\code{display.mode} is set to \code{showcase} so you can see the code while 
#'the app is running.
#'
#'@examples
#'\dontrun{
#'    bsExample("Alerts")}
#'@export
bsExample <- function(family, display.mode = "showcase", ...) {
 
  exp <- system.file("examples", package="shinyBS")
  fams <- list.dirs(exp, full.names = FALSE, recursive = FALSE)
  
  appname <- gsub(" ", "", family, fixed = TRUE)
  appname <- gsub("_", "", appname, fixed = TRUE)
  
  if(appname %in% fams) {
    
    appname <- normalizePath(paste0(exp, "/", appname))
    shiny::runApp(appname, display.mode = display.mode, ...)
  
  } else {
   
    stop("Could not find shinyBS family: ", family, "\nAvailable families are: ", paste0(fams, collapse = ", "))
    
  }
  
}