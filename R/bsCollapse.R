#'@templateVar item_name Collapse
#'@template component
#'@details Collapse panels offer an additional way to organize information
#'  within your shiny app. They can be set so that only one panel is open at a
#'  time or can be set so that each panel act independently.
NULL

#'@rdname collapses
#'@param \dots \code{bsCollapsePanel} elements that will be in the collapse
#'@param id The id to assign to the collapse
#'@param multiple Logical indicating whether multiple collapse panels can be 
#'  open at once
#'@param open A vector \code{bsCollapsePanel} ids indicating which panels should be 
#'  open
#'  
#'@details \code{bsCollapse} is a wrapper that links the \code{bsCollapsePanel}s
#'  within it.
#'@section Options: If \code{multiple = FALSE} (the default), then opening one 
#'  \code{\link{bsCollapsePanel}} will close all other \code{\link{bsCollapsePanel}}s within 
#'  the same group. If \code{multiple = TRUE}, opening \code{bsCollapsePanel}s 
#'  will have no effect on other collapse panels.
#'  
#'  \code{open} should be the id of one of the \code{\link{bsCollapsePanel}}s within
#'  the group. If \code{multiple = TRUE}, then it can be a vector of ids.
#'@return If the \code{value} argument was provided to the currently open 
#'  \code{\link{bsCollapsePanel}} then that value be returned to the server, otherwise 
#'  the \code{\link{bsCollapsePanel}}'s id will be returned.
#'  
#'  If \code{multiple == TRUE} then a vector of values or ids will be returned 
#'  representing all open \code{\link{bsCollapsePanel}}s.
bsCollapse <- function(..., id = NULL, multiple = FALSE, open = NULL) {

  if(is.null(id)) id = paste0("accordion", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  if(!multiple & length(open) > 1) {
    open <- open[1]
  }
  
  panels <- list(...)
  for(i in seq(length(panels))) {
    if(panels[[i]]$children[[2]]$attribs$id %in% open) {
      panels[[i]]$children[[2]] <- tagAddClass(panels[[i]]$children[[2]], 
                                               paste(panels[[i]]$children[[2]]$attribs$class, "in"))
    }
  }

  sbsHead(tags$div(class="accordion", id = id, "data-multiple" = multiple, panels))
  
}


#'@rdname collapses
#'@param session The session object passed from shinyServer
#'@param close A vector of \code{bsCollapsePanel} ids that you want closed.
#'@details Use \code{updateCollapse} in server.R to open and close
#'  \code{bsCollapsePanels} or swith \code{multiple} behavior on or off.
#'@export
updateCollapse <- function(session, id, open = NULL, close = NULL, multiple = NULL) {
  
  data <- dropNulls(list(open = open, close = close, multiple = multiple))
  session$sendInputMessage(id, data)
  
}