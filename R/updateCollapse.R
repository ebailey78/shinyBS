#'updateCollapse
#'
#'\code{updateCollapse} is used within the Server logic of your Shiny app to
#'modify a Collapse after load.
#'
#'@param session The session object passed to function given to shinyServer.
#'@param id The id of the Collapse object you want to change.
#'@param open A vector of \code{value} (or \code{title} if no \code{value} was 
#'provided) values identifying the panels you want to open.
#'@param close A vector of \code{value} (or \code{title} if no \code{value} was 
#'provided) values identifying the panels you want to close. 
#'@param style A named list of Bootstrap styles (\code{primary}, \code{danger}, \code{info},
#'\code{warning}, \code{success}, or \code{default}). The names should correspond
#'to the \code{value} (or \code{title} if no \code{value} was provided) of the 
#'\code{\link{bsCollapsePanel}} you want to change.
#'
#'@templateVar item_name updateCollapse
#'@templateVar family_name Collapses
#'@template item_details
#'@template footer
#'@export
updateCollapse <- function(session, id, open = NULL, close = NULL, style = NULL) {

  data <- dropNulls(list(open = open, close = close, style = style))
  session$sendInputMessage(id, data)
  
}