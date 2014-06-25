local({
  
  library(shiny)
  library(methods)
  
  args <- commandArgs()
  for(a in args) {
    pos <- regexpr("=", a)
    name <- substr(a, 1, pos - 1)
    value <- substr(a,pos + 1, nchar(a))
    switch(name,
          APPDIR = appDir <- value,
          PORT = port <- value)
  }
  
  if(port == "NULL") port = NULL
  
  runApp(appDir, port, launch.browser = TRUE)
  
})

