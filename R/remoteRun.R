#'@export
runRemoteApp <- function(appDir = getwd(), port = NULL) {
  
  exe <- file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
  scr <- file.path(find.package("shinyBS"), "tests", "remoteShiny.R")
  if(is.null(port)) port <- "NULL"
  x <- (paste0(exe, ' "', scr, '" APPDIR=', appDir, " PORT=", port))
  cat(x)
  system(x)
  
}