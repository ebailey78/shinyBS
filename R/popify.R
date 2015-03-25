#'popify
#'
#'\code{popify} can be wrapped around any shiny UI element to add a popover to the
#'wrapped element. This should be a safer way to add popovers to elements created with
#'\code{\link{renderUI}}.
#'
#'@param el A shiny UI element.
#'@param title The title of the popover.
#'@param content The main content of the popover.
#'@param placement Where the popover should appear relative to its target 
#'(\code{top}, \code{bottom}, \code{left}, or \code{right}). Defaults to \code{"bottom"}.
#'@param trigger What action should cause the popover to appear? (\code{hover},
#'\code{focus}, \code{click}, or \code{manual}). Defaults to \code{"hover"}.
#'@param options A named list of additional options to be set on the popover.
#'
#'@templateVar item_name popify
#'@templateVar family_name Tooltips_and_Popovers
#'@template item_details
#'@template footer
#'@export
popify <- function(el, title, content, placement="bottom", trigger="hover", options = NULL) {
  
  id <- el$attribs$id
  
  if(is.null(id)) {
    id <- paste0("tipify", as.integer(runif(1, 1, 10000000)))
    el <- addAttribs(el, id = id)
  }
  
  options = buildTooltipOrPopoverOptionsList(title, placement, trigger, options, content)
  
  script <- createTooltipOrPopoverOnUI(id, "popover", options)
  
  return(shiny::tagList(el, script))  
  
}