#'@rdname Collapse
#'@name Collapse Panels
#'@title Twitter Bootstrap Collapse Panels
#'  
#'@description Functions for creating and manipulating Collapse (Accordion)
#'  Panels in shiny
#'@param \dots For \code{bsCollapse} a series of \code{bsCollapsePanels} to
#'  include in the object for \code{bsCollapsePanel} as series of UI elements to
#'  add to the panel
#'@param id A name for the object (Optional)
#'@param multiple Logical indicating whether multiple panels in a group can be
#'  open at one time
#'@param open The id of the panel(s) you want to open
#'@param close The id of the panel(s) you want to close
#'@param title The title to appear at the top of the panel
#'@param value The value to return to bsCollapse when this panel is open
#'@param session The \code{session} object passed to function given to
#'  \code{shinyServer}
#'  
#'@details \code{bsCollapse} works very similarly to \code{tabsetPanel} and may 
#'  be useful in similar situations.\cr\cr Like \code{tabsetPanel}s, 
#'  \code{bsCollapse} can return values indicating which panels are open or 
#'  \code{NULL} if no panels are open.
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript
#'  for Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
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

#'@rdname Collapse
#'@export
bsCollapsePanel <- function(title, ..., id = NULL, value = NULL) {
  
  content <- list(...)
  
  if(is.null(id)) id <- paste0("cpanel", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  if(is.null(value)) {
      value = title
  }
  
  tags$div(class = "accordion-group",
           tags$div(class = "accordion-heading",
                    tags$a(class = "accordion-toggle", 'data-toggle' = "collapse", href = paste0("#", id), title)
                    ),
           tags$div(class = "accordion-body collapse", id = id, "data-value" = value,
                    tags$div(class = "accordion-inner", content)
                    )
           )
  
  
  
}

#'@rdname Collapse
#'@export
updateCollapse <- function(session, id, open = NULL, close = NULL, multiple = NULL) {
  
  data <- dropNulls(list(open = open, close = close, multiple = multiple))
  session$sendInputMessage(id, data)
  
}