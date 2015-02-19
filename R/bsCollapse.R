#' Collapse Panels
#' 
#' Collapse panels allow you to reduce clutter in your Shiny app by making 
#' panels of information that open and close with a user's click. Any type of
#' content can go in a collapse panel. Standard Bootstrap styling options are
#' available.
#' 
#'@section Components:
#' \describe{
#'  \item{\code{\link{bsCollapse}}}{A container for holder the individual panels created by \code{\link{bsCollapsePanel}}.}
#'  \item{\code{\link{bsCollapsePanel}}}{Creates an individual Collapse Panel that resides within a \code{\link{bsCollapse}}.}
#'  \item{\code{\link{updateCollapse}}}{Used within your server logic to open/close collapse panels or change their style.}
#'} 
#'@family Collapses
#'@name Collapses
#'@template group_footer
NULL

#' bsCollapse
#'
#' Create a collapse that contains \code{\link{bsCollapsePanel}} elements. 
#' See \code{\link{Collapses}}
#' 
#'@param id If provided, you can use input$id in your server script to open or
#' close \code{bsCollapsePanels} within the \code{bsCollapse}. 
#'@param multiple \code{logical} indication whether multiple \code{bsCollapsePanels}
#' within this \code{bsCollapse} can be open at once.
#'@param open The \code{value} (or, if none was supplied, the title) of the 
#' \code{bsCollapsePanel} that should be open. If \code{multiple = TRUE}, then
#' this can be a vector of \code{value}s or \code{title}s.
#'@param \dots \code{\link{bsCollapsePanel}} elements to include in the \code{bsCollapse}.
#'@family Collapses
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
  
  bsTag <- tags$div(class = "panel-group sbs-panel-group", id=id, role = "tablist", panels)
  htmltools::attachDependencies(bsTag, shinyBSDep)
  
}

#' bsCollapsePanel
#' 
#' Create a collapse panel that can be included within a \code{\link{bsCollapse}}
#' See \code{\link{Collapses}}
#' 
#'@param title The title to display at the top of the \code{bsCollapsePanel}
#'@param value The value that should be returned to the server when this 
#' \code{bsCollapsePanel} is open.
#'@param \dots UI elements to include within the collapse panel
#'@inheritParams Alerts
#'@family Collapses
#'@template footer
#'@export
bsCollapsePanel <- function(title, ..., value = title, style = NULL) {
  
  content <- list(...)
  
  id <- paste0("cpanel", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  if(is.null(value)) {
    value = title
  }
  if(is.null(style)) {
    style = "default"
  }
  
  bsTag <- tags$div(class = paste0("panel panel-", style), value = value,
    tags$div(class = "panel-heading", role = "tab", id = paste0("heading_", id),
      tags$h4(class = "panel-title",
        tags$a("data-toggle" = "collapse", href = paste0("#", id), title)
      )
    ),
    tags$div(id = id, class = "panel-collapse collapse", role = "tabpanel",
      tags$div(class = "panel-body", content)         
    )
  )
  
  htmltools::attachDependencies(bsTag, shinyBSDep)
  
}

#' updateCollapse
#' 
#' Open or close collapse panels or change their styles. See \code{\link{Collapses}}
#' 
#'@param id The id of the \code{\link{bsCollapse}} object you want to change.
#'@param open A vector of \code{value} (or \code{title} if no \code{value} was provided)
#'of the \code{\link{bsCollapsePanel}} elements you want to open.
#'@param close A vector of \code{value} (or \code{title} if no \code{value} was provided)
#'of the \code{\link{bsCollapsePanel}} elements you want to close.
#'@param style A named list of Bootstrap styles (danger, info, warning, success, default).
#'The names should correspond the the \code{value} of the \code{\link{bsCollapsePanel}} you
#'want to change.
#'@inheritParams Alerts
#'@family Collapses
#'@template footer
#'@export
updateCollapse <- function(session, id, open = NULL, close = NULL, style = NULL) {
  
  data <- dropNulls(list(open = open, close = close, style = style))
  session$sendInputMessage(id, data)
  
}