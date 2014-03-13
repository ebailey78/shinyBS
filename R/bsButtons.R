# Generic button - used as base for bsToggleButton and bsActionButton and as
# contents of bsButtonGroup
bsButton <- function(inputId, label, value, style = NULL, size = NULL, block = FALSE,
                     disabled = FALSE) {
  
  btn <- tags$button(id = inputId, type = "button", class = "btn sbs-btn", label)
  
  if(disabled) btn <- addClass(btn, "disabled")
  if(block) btn <- addClass(btn, "btn-block")
  
  if(!is.null(style)) {
    inputCheck(style = style, valid = c("primary", "info", "success", "warning", 
                                        "danger", "inverse", "link"))
    btn <- addClass(btn, paste0("btn-", tolower(style)))
  }
  
  if(!is.null(size)) {
    inputCheck(size = size, valid = c("large", "small", "mini"))
    btn <- addClass(btn, paste0("btn-", tolower(size)))
  }
  
  if(!missing(value)) btn$attribs['data-value'] <- value
  
  return(sbsHead(btn))
  
}

# Creates a Toggle button that works like a checkboxinput
bsToggleButton <- function(inputId, label, value = FALSE, style = NULL, 
                           size = NULL, block = FALSE, disabled = FALSE) {
  
  btn <- bsButton(inputId, label=label, style=style, size=size, block = block, disabled=disabled)

  btn[[2]] <- removeClass(btn[[2]], "sbs-btn")
  btn[[2]] <- addClass(btn[[2]], "sbs-toggle-button")
  
  btn[[2]]$attribs['data-toggle'] <- "button"
  
  if(value) btn[[2]] <- addClass(btn[[2]], "active bs-active")
    
  return(btn)
  
}

# Creates an action button like the default action button but with more options
bsActionButton <- function(inputId, label, style = NULL, size = NULL, block = FALSE,
                           disabled = FALSE) {
  
  btn <- bsButton(inputId, label, style = style, size=size, block = block, disabled=disabled)

  btn[[2]] <- removeClass(btn[[2]], "sbs-btn")
  btn[[2]] <- addClass(btn[[2]], "sbs-action-button")
  
  return(btn)
  
}

updateButton <- function(session, id, label = NULL, value = NULL, style = NULL, 
                         size = NULL, block = NULL, disabled = NULL) {
  
  data <- dropNulls(list(label = label, value = value, style = style, 
                         size = size, block = block, disabled = disabled))
  
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
    
    btn2 <- btn[[2]]
    
    if(disabled) btn2 <- addClass(btn2, "disabled")

    btn2$attribs['data-toggle'] <- NULL
    btn2 <- removeClass(btn2, "action-button btn-block toggle-button active")
    
    if(btn2$attribs['data-value'] %in% value) {
      btn2 <- addClass(btn2, "active bs-active")
    }
    
    if(!missing(size)) {
      btn2 <- removeClass(btn2, "btn-large btn-small btn-mini")
      btn2 <- addClass(btn2, size)
    }
    
    if(!missing(style)) {
      styles <- "btn-primary btn-info btn-success btn-warning btn-danger btn-inverse btn-link"
      btn2 <- removeClass(btn2, styles)
      btn2 <- addClass(btn2, style)
    }
    
    btn[[2]] <- btn2
    
    btngrp <- tagAppendChild(btngrp, btn)
    
  }

  if(!missing(label)) {
    btngrp <- tagList(tags$label(label, 'for' = inputId), btngrp)
  }
  
  return(sbsHead(btngrp))

}

updateButtonGroup <- function(session, id, toggle = NULL, style = NULL, 
                              size = NULL, disabled = NULL, value = NULL) {
  
  data <- dropNulls(list(toggle = toggle, style = style, size = size, 
                         disabled = disabled, value = value))
  session$sendInputMessage(id, data)
  
}