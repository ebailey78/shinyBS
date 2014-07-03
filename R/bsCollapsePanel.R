#'@templateVar item_name Collapse Panel
#'@templateVar component Collapse
#'@template subcomponent
#'@param title The title to appear at the top of the collapse panel
#'@param \dots Any shiny elements you wish to include within the panel
#'@param id The id of the collapse panel
#'@param value the value to return when this panel is open
#'@details \code{bsCollapsePanel}s should be included within 
#'  \code{\link{bsCollapse}}. They can contain any combination of shiny inputs, 
#'  shiny outputs, or HTML.
#'  
#'@section Options: The \code{title} will appear at the top of the collapse 
#'  panel and will be visible even when the panel is collapsed. The is what the 
#'  user clicks to open the panel.
#'  
#'  \code{id} and \code{value} are both optional, if \code{value} is missing
#'  then the title text is assigned to the value.
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
