#'bsAlert
#'
#'\code{bsAlert} creates an anchor point in your UI definition. This anchor point
#'is where alerts created in your Server logic will be displayed.
#'
#'@param anchorId A unique id the identifies the anchor.
#'
#'@templateVar item_name bsAlert
#'@templateVar family_name Alerts
#'@template item_details
#'@template footer
#'@export
bsAlert <- function(anchorId, inline = TRUE) {
  
  class <- "sbs-alert"
  if(!inline) class = paste(class, "sbs-alert-hover")
  
  bsTag <- shiny::tags$div(class = class, id = anchorId, " ")
  htmltools::attachDependencies(bsTag, shinyBSDep)
  
}
