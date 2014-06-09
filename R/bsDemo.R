#'@name Demos
#'@title shinyBS Demos
#'@description Open demonstrations of shinyBS functionality
#'
#'@param example The demo you want to run, currently either 'demo' or 'menubar'.
#'@param port See \link{runApp}
#'@param launch.browser See \link{runApp}
#'@param host See \link{runApp}
#'@param display.mode See \link{runApp}
#'
#'@details See /link{runApp} and /link{runExample} from shiny for more details.
#'@author Eric Bailey
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

  