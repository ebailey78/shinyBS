#'bsTooltip
#'
#'\code{bsTooltip} is used within the UI of an app to add a tooltip to a Shiny
#'input or output.
#'
#'@param id The id of the element to attach the tooltip to.
#'@param title The content of the tooltip.
#'@param placement Where the tooltip should appear relative to its target 
#'(\code{top}, \code{bottom}, \code{left}, or \code{right}). Defaults to \code{"bottom"}.
#'@param trigger What action should cause the tooltip to appear? (\code{hover},
#'\code{focus}, \code{click}, or \code{manual}. Defaults to \code{"hover"}.
#'@param options A named list of additional options to be set on the tooltip.
#'
#'@templateVar item_name bsTooltip
#'@templateVar family_name Tooltips_and_Popovers
#'@template item_details
#'@template footer
#'@export
bsTooltip <- function(id, title, placement="bottom", trigger="hover", options = NULL) {
  
  options = buildTooltipOrPopoverOptionsList(title, placement, trigger, options)
  
  createTooltipOrPopoverOnUI(id, "tooltip", options)
  
}