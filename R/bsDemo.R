#'@name demos
#'@title shinyBS Demos
#'@description Open demonstrations of shinyBS functionality
#'  
#'@param example The demo you want to run, currently either 'demo' or 'menubar'.
#'@inheritParams shiny::runApp
#'  
#'@details A wrapper for shiny's \code{\link{runApp}} that makes running shinyBS
#'  demos easier. Similiar to shiny's \code{\link{runExample}}.
#'  
#'  See \code{\link{runApp}} and \code{\link{runExample}} from shiny for more
#'  details.
#'@author Eric Bailey
#'@family shinyBS_utilities
#'@export
bsDemo <- function(example = "demo", port = NULL,
                   launch.browser = getOption("shiny.launch.browser", interactive()),
                   host = getOption("shiny.host", "127.0.0.1"), 
                   display.mode = "normal") {
  
  examplesDir <- system.file("examples", package = "shinyBS")
  dir <- normalizePath(paste(examplesDir, example, sep = "/"))
  runApp(dir, port = port, host = host, launch.browser = launch.browser, 
         display.mode = display.mode)  
}

  