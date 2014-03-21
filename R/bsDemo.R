# Open the demo app that shows all current functionality of the shinyBS package.
bsDemo <- function(port = NULL, launch.browser = getOption("shiny.launch.browser",
                   interactive())) {
  
  examplesDir <- system.file("examples", package = "shinyBS")
  dir <- normalizePath(paste(examplesDir, "demo", sep = "/"))
  runApp(dir, port = port, launch.browser = launch.browser)
  
}

bsNavDemo <- function(port = NULL, launch.browser = getOption("shiny.launch.browser",
                                                              interactive())) {
  
  examplesDir <- system.file("examples", package = "shinyBS")
  dir <- normalizePath(paste(examplesDir, "navbar", sep = "/"))
  runApp(dir, port = port, launch.browser = launch.browser)
  
}
  
  