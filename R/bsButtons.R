# Generic button - used as base for bsToggleButton and bsActionButton and as
# contents of bsButtonGroup
bsButton <- function(inputId, label, value, style = NULL, size = NULL, 
                     disabled = FALSE) {
  
  btn <- tags$button(id = inputId, type = "button", class = "btn sbs-btn", label)
  
  if(disabled) btn <- addClass(btn, "disabled")
  
  if(!is.null(style)) btn <- addClass(btn, paste0("btn-", tolower(style)))
  
  if(!is.null(size)) btn <- addClass(btn, paste0("btn-", tolower(size)))
  
  if(!missing(value)) btn$attribs['data-value'] <- value
  
  return(btn)
  
}

# Creates a Toggle button that works like a checkboxinput
bsToggleButton <- function(inputId, label, value = FALSE, style = NULL, 
                           size = NULL, disabled = FALSE) {
  
  btn <- bsButton(inputId, label=label, style=style, size=size, disabled=disabled)
  
  btn <- removeClass(btn, "sbs-btn")
  btn <- addClass(btn, "sbs-toggle-button")
  
  btn$attribs['data-toggle'] <- "button"
  
  if(value) btn <- addClass(btn, "active bs-active")
    
  return(btn)
  
}

# Creates an action button like the default action button but with more options
bsActionButton <- function(inputId, label, style = NULL, size = NULL, 
                           disabled = FALSE) {
  
  btn <- bsButton(inputId, label, style = style, size=size, disabled=disabled)
  
  btn <- removeClass(btn, "sbs-btn")
  btn <- addClass(btn, "sbs-action-button")
  
  return(btn)
  
}

updateButton <- function(session, id, label = NULL, value = NULL, style = NULL, 
                         size = NULL, disabled = NULL) {
  
  data <- dropNulls(list(label = label, value = value, style = style, 
                         size = size, disabled = disabled))
  
  session$sendInputMessage(id, data)
  
}

# Creates a button group
bsButtonGroup <- function(inputId, ..., label, toggle = "checkbox", style, size, 
                          value = NULL, disabled = FALSE) {
    
  # Start the button group tag
  btngrp <- tags$div(id = inputId, class = "btn-group sbs-button-group")
  btns <- list(...)

  if(inputCheck(toggle = toggle, valid = c("checkbox", "radio"))) {
    btngrp$attribs['data-toggle'] <- paste0("buttons-", toggle)
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

    btn$attribs['data-toggle'] <- NULL
    btn <- removeClass(btn, "action-button toggle-button active")
    
    if(btn$attribs['data-value'] %in% value) {
      btn <- addClass(btn, "active bs-active")
    }
    
    if(!missing(size)) {
      btn <- removeClass(btn, "btn-large btn-small btn-mini")
      btn <- addClass(btn, size)
    }
    
    if(!missing(style)) {
      styles <- "btn-primary btn-info btn-success btn-warning btn-danger btn-inverse btn-link"
      btn <- removeClass(btn, styles)
      btn <- addClass(btn, style)
    }
    
    btngrp <- tagAppendChild(btngrp, btn)
    
  }

  if(!missing(label)) {
    btngrp <- tagList(tags$label(label, 'for' = inputId), btngrp)
  }
  
  return(btngrp)

}

updateButtonGroup <- function(session, id, toggle = NULL, style = NULL, 
                              size = NULL, disabled = NULL, value = NULL) {
  
  data <- dropNulls(list(toggle = toggle, style = style, size = size, 
                         disabled = disabled, value = value))
  session$sendInputMessage(id, data)
  
}