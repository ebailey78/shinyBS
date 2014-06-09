#'@rdname ProgressBar
#'@name Progress Bars
#'@title Twitter Bootstrap Progress Bars
#'  
#'@description Functions to create and update Twitter Bootstrap progress bars in
#'  shiny
#'  
#'@param inputId Id to assign to the progress bar
#'@param value The current completion value as a percent between 0  and 100
#'@param visible Logical indicating whether the progress bar should be visible
#'@param color Following Twitter Bootstrap's style scheme, one of
#'  \code{standard}, \code{warning}, \code{danger}, \code{info}, or
#'  \code{success}. \code{standard} by default
#'@param striped Logical indicating whether Twitter Bootstrap's 'striped' style
#'  should be applied
#'@param animate Logical indication whether Twitter Bootstrap's 'animate' style
#'  should be applied
#'@param session The \code{session} object passed to function given to
#'  \code{shinyServer}
#'  
#'@details Progress bars should be initialized with \code{bsProgress} in the
#'\code{ui.R} script. They can then be updated using \code{updateProgressBar}
#'from \code{server.R}.\cr\cr When using \code{updateProgressBar} only specify
#'those arguments that you want to change. If you call
#'\code{updateProgressBar(value = 25)} then only the value will be updated and
#'the other options will remain unchanged.
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/components.html}{Components of
#'  Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsProgressBar <- function(inputId, value = 0, visible=TRUE, 
                          color, striped=FALSE, animate=FALSE) {
  
  class = "progress"
  if(striped) {
    class=paste(class, "progress-striped")
  } else if(animate) {
    class=paste(class, "progress-striped active")
  }
  if(!missing(color)) {
    class=paste0(class, " progress-", color)
  }
  if(!visible) {
    class=paste(class, "hidden")
  }
  
  sbsHead(tags$div(class=class, id=inputId,
                   tags$div(class="bar", style=paste0("width: ", value, "%;"))
                   )
          )

}

#'@rdname ProgressBar
#'@export
updateProgressBar <- function(session, inputId, value=NULL, visible=NULL, color=NULL, striped=NULL, animate=NULL) {
  
  data <- dropNulls(list(id=inputId, value=value, visible=visible, 
                                 color=color, striped=striped, animate=animate))
  
  session$sendCustomMessage("updateprogress", data)
  
}