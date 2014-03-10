bsButtonGroup <- function(inputId, ..., toggle, style, size, value = NULL, disabled = FALSE) {
    
  # Start the button group tag
  btngrp <- tags$div(id = inputId, class = "btn-group sbs-button-group")
  
  btns <- list(...)
  
  # If toggle is specified, add appropriate 'data-toggle' argument
  if(!missing(toggle)) {
    if(inputCheck(toggle = toggle, valid = c("checkbox", "radio"))) {
      btngrp$attribs['data-toggle'] <- paste0("buttons-", toggle)
    }
  }
  
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
    
    if(disabled) btn <- addClass(btn, "disabled")
    
    if(!missing(toggle)) {
      btn$attribs['data-toggle'] <- NULL
      btn <- removeClass(btn, "action-button toggle-button active")
    }
    
    if(!missing(size)) {
      btn <- removeClass(btn, "btn-large btn-small btn-mini")
      btn <- addClass(btn, size)
    }
    
    if(!missing(style)) {
      btn <- removeClass(btn, "btn-primary btn-info btn-success btn-warning btn-danger btn-inverse btn-link")
      btn <- addClass(btn, style)
    }
    
    btngrp <- tagAppendChild(btngrp, btn)
    
  }

  return(btngrp)

}

bsButton <- function(inputId, label, toggle = FALSE, style, size, value = NULL, state = FALSE, disabled = FALSE) {
  
  btn <- tags$button(id = inputId, type = "button", class = "btn", label)
  
  if(disabled) btn <- addClass(btn, "disabled")
  
  if(toggle) {
    btn$attribs['data-toggle'] <- "button"
    btn <- addClass(btn, "toggle-button")
    if(state) btn <- addClass(btn, "active")
  } else {
    btn <- addClass(btn, "action-button")
  }
  
  if(!missing(style)) {
    if(inputCheck(style = style, 
                  valid = c("primary", "info", "success", "warning", 
                            "danger", "inverse", "link"))) {
      btn <- addClass(btn, paste0("btn-", style))
    }
  }
  
  if(!missing(size)) {
    if(inputCheck(size = size, valid = c("large", "small", "mini"))) {
      btn <- addClass(btn, paste0("btn-", size))
    }
  }

  btn$attribs['data-value'] <- value
  
  return(btn)
    
}