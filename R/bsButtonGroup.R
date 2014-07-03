#'@templateVar item_name ButtonGroup
#'@template component
#'@details ButtonGroups are used to group buttons together. When grouped they
#'  can act collectively.
NULL

#'@rdname buttongroups
#'@export
bsButtonGroup <- function(inputId, ..., label, toggle = "checkbox", style, size, 
                          value = NULL, disabled = FALSE, block = FALSE, vertical = FALSE) {
  
  # Start the button group tag
  btngrp <- tags$div(id = inputId, class = "btn-group sbs-button-group")
  btns <- list(...)
  
  if(inputCheck(toggle = toggle, valid = c("checkbox", "radio"))) {
    btngrp <- tagAddAttribs(btngrp, 'data-toggle' = paste0("buttons-", toggle))
  }
  
  if(block) btngrp <- tagAddClass(btngrp, "btn-block")
  if(vertical) btngrp <- tagAddClass(btngrp, "btn-group-vertical")
  
  if(!missing(style)) {
    if(inputCheck(style = style, 
                  valid = c("primary", "info", "success", "warning", 
                            "danger", "inverse", "link"))) {
      style = paste0("btn-", style)
    }
  }
  
  if(!missing(size)) {
    if(inputCheck(size = size, valid = c("large", "small", "mini"))) {
      size = paste0("btn-", size)
    }
  }
  
  # Loop through the buttons for the group making neccesary changes
  for(btn in btns) {
    
    btn2 <- btn[[2]]
    
    if(disabled) btn2 <- tagAddClass(btn2, "disabled")
    
    btn2$attribs['data-toggle'] <- NULL
    btn2 <- tagRemoveClass(btn2, "action-button btn-block toggle-button active")
    
    if(btn2$attribs['data-value'] %in% value) {
      btn2 <- tagAddClass(btn2, "active bs-active")
    }
    
    if(block) btn2$name <- "span"
    
    if(!missing(size)) {
      btn2 <- tagRemoveClass(btn2, "btn-large btn-small btn-mini")
      btn2 <- tagAddClass(btn2, size)
    }
    
    if(!missing(style)) {
      styles <- "btn-primary btn-info btn-success btn-warning btn-danger btn-inverse btn-link"
      btn2 <- tagRemoveClass(btn2, styles)
      btn2 <- tagAddClass(btn2, style)
    }
    
    btn[[2]] <- btn2
    
    btngrp <- tagAppendChild(btngrp, btn)
    
  }
  
  if(!missing(label)) {
    btngrp <- tagList(tags$label(label, 'for' = inputId), btngrp)
  }
  
  return(sbsHead(btngrp))
  
}

#'@rdname buttongroups
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'@export
updateButtonGroup <- function(session, id, toggle = NULL, style = NULL, 
                              size = NULL, disabled = NULL, value = NULL) {
  
  data <- dropNulls(list(toggle = toggle, style = style, size = size, 
                         disabled = disabled, value = value))
  session$sendInputMessage(id, data)
  
}