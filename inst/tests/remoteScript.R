local({
  
  port = 5167
  
  library(shiny)
  
  s <- make.socket(port = port, server = TRUE)
  
  write.socket(s, paste("connected: ", Sys.getpid()))
    
  close.socket(s)
  
  s <- socketConnection(port = port, server = TRUE)
  args <- dget(s)
  args <- paste(lapply(seq(length(args)), function(i) {
    paste(names(args)[i], deparse(args[[i]]), sep = '=')
  }), collapse = ', ')
  eval(parse(text = paste0("runApp(", args, ")")))
  
})