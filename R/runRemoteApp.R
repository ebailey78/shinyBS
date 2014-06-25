#'@export
runRemoteApp <- function(appDir = getwd(), launch.browser = TRUE, ...) {
  
  port = 5167
  exe <- file.path(R.home("bin"), "Rscript.exe")
  scr <- file.path(system.file(package="shinyBS"), "tests", "remoteScript.R")
  cnt <- 1
  
  shell(paste0(exe, ' "', scr, '"'), wait = FALSE)
  
  while(class(try(pid <- read.socket(s), silent = TRUE)) == "try-error") {
    Sys.sleep(0.5)
    s <- try(make.socket(port = port), silent = TRUE)
    cnt <- cnt + 1
    if(cnt > 20) break
  }
  pid <- as.integer(strsplit(pid, ":")[[1]][2])
  
  rApp <- list(pid = pid)
  class(rApp) <- "rApp"

  s <- socketConnection(port = port)

  args <- c(appDir = appDir, launch.browser = launch.browser, list(...))
  args <- args[names(args) %in% names(formals(runApp))]

  dput(args, s)
  close(s)
  
  return(rApp)
  
}

#'@export
close.rApp <- function(con) {
  closeRemoteApp(con)
}

#'@export
closeRemoteApp <- function(rApp) {
  invisible(shell(paste("taskkill /F /PID", rApp$pid)))
}