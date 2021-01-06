#'bsCollapsePanel
#'
#'\code{bsCollapsePanel} creates individual panels within a \code{\link{bsCollapse}} object.
#'
#'@param title The title to display at the top of the panel.
#'@param \dots UI elements to include within the panel.
#'@param value \bold{Optional} HTML id.  Auto-generated if missing.
#'@param value \bold{Optional} The value to return when this panel is open. Defaults to \code{title}.
#'@param style \bold{Optional} A Bootstrap style to apply to the panel. (\code{primary}, \code{danger}, \code{warning}, \code{info}, or \code{success})
#'
#'@templateVar item_name bsCollapsePanel
#'@templateVar family_name Collapses
#'@template item_details
#'@template footer
#'@export
bsCollapsePanel <- function(title, ..., id, value = title, style = NULL) {
  
  content <- list(...)
  
  if(missing(id))
    id <- paste0("cpanel", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  if(is.null(value)) {
    value = title
  }
  if(is.null(style)) {
    style = "default"
  }
  
  bsTag <- shiny::tags$div(class = paste0("panel panel-", style), value = value,
                    shiny::tags$div(class = "panel-heading", role = "tab", id = paste0("heading_", id),
                             shiny::tags$h4(class = "panel-title",
                                     shiny::tags$a("data-toggle" = "collapse", href = paste0("#", id), title)
                             )
                    ),
                    shiny::tags$div(id = id, class = "panel-collapse collapse", role = "tabpanel",
                             shiny::tags$div(class = "panel-body", content)         
                    )
  )
  
  htmltools::attachDependencies(bsTag, shinyBSDep)
  
}


