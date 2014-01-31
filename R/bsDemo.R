bsDemo <- function(port = NULL, launch.browser = getOption("shiny.launch.browser",
                   interactive()), host = getOption("shiny.host", "127.0.0.1")) {
  
  examplesDir <- system.file("examples", package = "shinyBS")
  dir <- shiny:::resolve(examplesDir, "demo")
  runApp(dir, port = port, host = host, launch.browser = launch.browser)
  
}

bsShowcase <- function(port = NULL, launch.browser = getOption("shiny.launch.browser",
                       interactive()), host = getOption("shiny.host", "127.0.0.1")) {
  
  examplesDir <- system.file("examples", package = "shinyBS")
  dir <- shiny:::resolve(examplesDir, "showcase")
  runApp(dir, port = port, host = host, launch.browser = launch.browser)
  
}