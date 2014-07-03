#'@templateVar item_name Progress Bar
#'@template component
#'@details Progress Bars can be used to give the user feedback on their progress
#'  through a multistep process or the progress of some long-running background 
#'  process running on the server.
#'  
#'  To use a progress bar effectively you need to know the endpoint that you are
#'  working towards. That can be difficult unless you are updating based on the
#'  progress of a loop or *apply function.
NULL

#'@rdname progressbars
#'@param inputId The id to assign to the progress bar
#'@param value numeric value between 0 and 100. Indicated percentage filled
#'@param visible Logical indicating whether the progress bar should be visible
#'@param color The color of the progress bar
#'@param striped Logical indicating whether the progress bar shoudl be striped
#'@param animate Logical indicating whether the progress bar's stripes should 
#'  move
#'  
#'@section Options: \code{value} should be a numeric value between 0 and 100 
#'  where 0 indicates the bar is empty and 100 indicates the bar is completely 
#'  full.
#'  
#'  \code{visible} makes it easy to hide the progress bar when it isn't in use.
#'  
#'  \code{color} is one of Twitter Bootstrap's predefined color schemes: 
#'  \code{danger}, \code{warning}, \code{success}, or \code{info}. If missing, 
#'  the progress bar will be the default blue color scheme.
#'  
#'  \code{striped = TRUE} will cause the progress bar to have diagonal stripes.
#'  
#'  \code{animate = TRUE} will cause the progress bar to have animated diagonal
#'  stripes.
#'  
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

#'@rdname progressbars
#'@param session The session object passed from shinyServer
#'@details \code{updateProgressBar} is called from server.R to change the style
#'  of the progres bar or change its value.
#'@export
updateProgressBar <- function(session, inputId, value=NULL, visible=NULL, color=NULL, striped=NULL, animate=NULL) {
  
  data <- dropNulls(list(id=inputId, value=value, visible=visible, 
                                 color=color, striped=striped, animate=animate))
  
  session$sendCustomMessage("updateprogress", data)
  
}