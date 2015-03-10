#'bsCollapse
#'
#'\code{bsCollapse} is used in your UI to create a collapse panel group. Use
#'\code{\link{bsCollapsePanel}} to populate this object with panels.
#'
#'@param \dots \code{\link{bsCollapsePanel}} elements to include in the Collapse.
#'@param id \bold{Optional} You can use \code{input$id} in your Server logic to 
#'determine which panels are open, and \code{\link{updateCollapse}} to open/close
#'panels.
#'@param multiple Can more than one panel be open at a time? Defaults to \code{FALSE}.
#'@param open The \code{value}, (or if none was supplied, the \code{title}) of 
#'the panel(s) you want open on load.
#'
#'@templateVar item_name bsCollapse
#'@templateVar family_name Collapses
#'@template item_details
#'@template footer
#'@export
bsCollapse <- function(..., id = NULL, multiple = FALSE, open = NULL) {
  
  if(is.null(id)) id = paste0("collapse", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  if(!multiple & length(open) > 1) {
    open <- open[1]
  }
  
  panels <- list(...)
  panels <<- panels
  for(i in seq(length(panels))) {
    if(getAttribs(panels[[i]])$value %in% open) {
      panels[[i]]$children[[2]] <- addClass(panels[[i]]$children[[2]], "in")
    }
    if(!multiple) {
      panels[[i]]$children[[1]]$children[[1]]$children[[1]] <- addAttribs(panels[[i]]$children[[1]]$children[[1]]$children[[1]], 'data-parent' = paste0("#", id))
    }
  }
  
  bsTag <- shiny::tags$div(class = "panel-group sbs-panel-group", "data-sbs-multi" = multiple, id=id, role = "tablist", panels)
  
  htmltools::attachDependencies(bsTag, shinyBSDep)
  
}
