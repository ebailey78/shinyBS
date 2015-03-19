#'@export
tipify <- function(el, title, placement="bottom", trigger="hover", options = NULL) {
 
  id <- el$attribs$id
  
  if(is.null(id)) {
    id <- paste0("tipify", as.integer(runif(1, 1, 10000000)))
    el <- addAttribs(el, id = id)
  }
  
  options = buildTooltipOrPopoverOptionsList(title, placement, trigger, options)
  
  script <- createTooltipOrPopoverOnUI(id, "tooltip", options)
  
  return(tagList(el, script))  
  
}