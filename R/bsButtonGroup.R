#'@export
bsButtonGroup <- function(id, ..., size = "md", vertical = FALSE, type = "action") {
  
  btns <- list(...)
  
  for(i in seq(length(btns))) {
    btns[[i]] <- removeClass(btns[[i]], "action-button")
    btns[[i]] <- removeClass(btns[[i]], "sbs-toggle-button")
  }
  
  grp <- tags$div(id = id, btns, class = "btn-group sbs-btn-group", 'data-sbs-type' = type)
  
  if(size != "md") {
    grp <- addClass(grp, paste0("btn-group-", size))
  }
  
  if(vertical) {
    grp <- addClass(grp, "btn-group-vertical")
  }
  
  return(grp)
  
}