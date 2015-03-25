#'tipify
#'
#'\code{tipify} can be wrapped around any shiny UI element to add a tooltip to the
#'wrapped element. This should be a safer way to add tooltips to elements created with
#'\code{\link{renderUI}}.
#'
#'@param el A shiny UI element.
#'@param title The content of the tooltip.
#'@param placement Where the tooltip should appear relative to its target 
#'(\code{top}, \code{bottom}, \code{left}, or \code{right}). Defaults to \code{"bottom"}.
#'@param trigger What action should cause the tooltip to appear? (\code{hover},
#'\code{focus}, \code{click}, or \code{manual}). Defaults to \code{"hover"}.
#'@param options A named list of additional options to be set on the tooltip.
#'
#'@templateVar item_name tipify
#'@templateVar family_name Tooltips_and_Popovers
#'@template item_details
#'@template footer
#'@export
tipify <- function(el, title, placement="bottom", trigger="hover", options = NULL) {
 
  id <- el$attribs$id
  
  if(is.null(id)) {
    id <- paste0("tipify", as.integer(runif(1, 1, 10000000)))
    el <- addAttribs(el, id = id)
  }
  
  options = buildTooltipOrPopoverOptionsList(title, placement, trigger, options)
  
  script <- createTooltipOrPopoverOnUI(id, "tooltip", options)
  
  return(shiny::tagList(el, script))  
  
}