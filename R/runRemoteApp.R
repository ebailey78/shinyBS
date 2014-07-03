#'@rdname remoteapps
#'@name Remote Shiny Apps
#'@title Run shiny apps in seperate processes
#'@description Open a shiny app in a seperate R processes (probably Windows 
#'  Only)
#'  
#'@param appDir The directory of the application
#'@param launch.browser Logical indicating whether the default browser should be
#'  automatically opened.
#'@param \dots Represents other options to pass to \link{runApp}
#'@param rApp,con The object created by runRemoteApp. Used to close the app 
#'  afterwards
#'  
#'@details These functions were created to assist in testing with the testthat 
#'  and RSelenium packages. This allows the shiny test apps to be opened in a 
#'  seperate process so the main process can be used by testthat.
#'  
#'  The function opens an instance of Rscript.exe and opens a socket to that 
#'  process. Based roughly on how the snow package opens additional instances 
#'  for parallel processing.
#'  
#'  This may be useful if you need to run a shiny app but still want to be able 
#'  use R.
#'  
#'  When using \code{runRemoteApp} you should always assign the output of the
#'  function to a variable. You will need this variable to close the remote
#'  process after you are done with the app. Otherwise the app will continue
#'  running in the background even after the browser is closed.
#'@author Eric Bailey
#'@family shinyBS_utilities
#'@examples
#'\dontrun{
#'## Open an app on a seperate process
#'app <- runRemoteApp()
#'
#'## Close the remote app
#'closeRemoteApp(app)
#'}
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

#'@rdname remoteapps
#'@method close rApp
#'@export
close.rApp <- function(con, ...) {
  closeRemoteApp(con)
}

#'@rdname remoteapps
#'@export
closeRemoteApp <- function(rApp) {
  shell(paste("taskkill /F /PID", rApp$pid), wait = FALSE)
}