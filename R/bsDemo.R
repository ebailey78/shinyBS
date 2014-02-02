# Open the demo app that shows all current functionality of the shinyBS package.
bsDemo <- function(port = NULL, launch.browser = getOption("shiny.launch.browser",
                   interactive())) {
  
  examplesDir <- system.file("examples", package = "shinyBS")
  dir <- shiny:::resolve(examplesDir, "demo")
  runApp(dir, port = port, launch.browser = launch.browser)
  
}

# Opens an app that showcases shinyBS functions in a somewhat real-world setting.
bsShowcase <- function(port = NULL, launch.browser = getOption("shiny.launch.browser",
                       interactive())) {
  
  examplesDir <- system.file("examples", package = "shinyBS")
  dir <- shiny:::resolve(examplesDir, "showcase")
  runApp(dir, port = port, launch.browser = launch.browser)
  
}