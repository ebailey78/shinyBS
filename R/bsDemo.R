# Open a demo app that shows current functionality of the shinyBS package.
bsDemo <- function(port = NULL, demo = "demo", 
                   launch.browser = getOption("shiny.launch.browser",
                   interactive())) {
  
  examplesDir <- system.file("examples", package = "shinyBS")
  dir <- normalizePath(paste(examplesDir, demo, sep = "/"))
  runApp(dir, port = port, launch.browser = launch.browser)
  
}

  