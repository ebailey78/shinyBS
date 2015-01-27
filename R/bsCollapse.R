#'@templateVar item_name Collapse
#'@template component
#'@details Collapse panels offer an additional way to organize information
#' within your shiny app. They can be set so that only one panel is open at a
#' time or can be set so that each panel act independently.
NULL

#'@rdname collapses
#'@param \dots \code{bsCollapsePanel} elements that will be in the collapse
#'@param id The id to assign to the collapse
#'@param multiple Logical indicating whether multiple collapse panels can be
#' open at once
#'@param open A vector \code{bsCollapsePanel} ids indicating which panels should be
#' open
#'
#'@details \code{bsCollapse} is a wrapper that links the \code{bsCollapsePanel}s
#' within it.
#'@section Options: If \code{multiple = FALSE} (the default), then opening one
#' \code{\link{bsCollapsePanel}} will close all other \code{\link{bsCollapsePanel}}s within
#' the same group. If \code{multiple = TRUE}, opening \code{bsCollapsePanel}s
#' will have no effect on other collapse panels.
#'
#' \code{open} should be the id of one of the \code{\link{bsCollapsePanel}}s within
#' the group. If \code{multiple = TRUE}, then it can be a vector of ids.
#'@return If the \code{value} argument was provided to the currently open
#' \code{\link{bsCollapsePanel}} then that value be returned to the server, otherwise
#' the \code{\link{bsCollapsePanel}}'s id will be returned.
#'
#' If \code{multiple == TRUE} then a vector of values or ids will be returned
#' representing all open \code{\link{bsCollapsePanel}}s.
#' @export
bsCollapse <- function(..., id = NULL, multiple = FALSE, open = NULL) {
  if(is.null(id)) id = paste0("collapse", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  if(!multiple & length(open) > 1) {
    open <- open[1]
  }
  
  panels <- list(...)
  for(i in seq(length(panels))) {
    if(getAttribs(panels[[i]])$id %in% open) {
      panels[[i]]$children[[2]] <- addClass(panels[[i]]$children[[2]], "in")
    }
    if(!multiple) {
      panels[[i]]$children[[1]]$children[[1]]$children[[1]] <- addAttribs(panels[[i]]$children[[1]]$children[[1]]$children[[1]], 'data-parent' = paste0("#", id))
    }
  }
  
  sbsHead(tags$div(class = "panel-group sbs-panel-group", id=id, role = "tablist", panels))
  
  
}

#'@templateVar item_name Collapse Panel
#'@templateVar component Collapse
#'@template subcomponent
#'@param title The title to appear at the top of the collapse panel
#'@param \dots Any shiny elements you wish to include within the panel
#'@param id The id of the collapse panel
#'@param value the value to return when this panel is open
#'@param type the type of panel to create (danger, warning, info, or success).
#'@details \code{bsCollapsePanel}s should be included within
#' \code{\link{bsCollapse}}. They can contain any combination of shiny inputs,
#' shiny outputs, or HTML.
#'
#'@section Options: The \code{title} will appear at the top of the collapse
#' panel and will be visible even when the panel is collapsed. The is what the
#' user clicks to open the panel.
#'
#' \code{id} and \code{value} are both optional, if \code{value} is missing
#' then the title text is assigned to the value.
#'@export
bsCollapsePanel <- function(title, ..., id = NULL, value = NULL, type = NULL) {
  
  content <- list(...)
  
  if(is.null(id)) id <- paste0("cpanel", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  if(is.null(value)) {
    value = title
  }
  if(is.null(type)) {
    type = "default"
  }
  
  tags$div(class = paste0("panel panel-", type), value = value,
    tags$div(class = "panel-heading", role = "tab", id = paste0("heading_", id),
      tags$h4(class = "panel-title",
        tags$a("data-toggle" = "collapse", href = paste0("#", id), title)
      )
    ),
    tags$div(id = id, class = "panel-collapse collapse", role = "tabpanel",
      tags$div(class = "panel-body", content)         
    )
  )
  
}

#'@rdname collapses
#'@param session The session object passed from shinyServer
#'@param close A vector of \code{bsCollapsePanel} ids that you want closed.
#'@details Use \code{updateCollapse} in server.R to open and close
#' \code{bsCollapsePanels} or change their style (danger, info, warning, success).
#'@export
updateCollapse <- function(session, id, open = NULL, close = NULL, type = NULL) {
  
  data <- dropNulls(list(open = open, close = close, type = type))
  session$sendInputMessage(id, data)
  
}