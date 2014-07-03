#'@templateVar item_name Button Group
#'@template component
#'@details Button Groups are used to group buttons together. When grouped they
#'  can act like radio buttons or a checkbox group.
NULL

#'@rdname buttongroups
#'@param inputId Input variable to assign the control's value to
#'@param \dots \code{\link{bsButton}} objects to add the to button group
#'@param label The text that will appear above the button group
#'@param toggle The desire behavior of the button group (checkbox or radio)
#'@param style The style to apply to the button group
#'@param size The size to apply to the button group
#'@param value The value to assign to the button group
#'@param disabled Logical indicating whether the button group should be 
#'  \emph{clickable}
#'@param block Logical indicating whether the button group should be a block 
#'  level element
#'@param vertical Logical indicating whethet the button group should be 
#'  vertically aligned
#'@section Options: You can set \code{style} and \code{size} for individual 
#'  buttons within the group from \code{\link{bsButton}}, or use 
#'  \code{bsButtonGroup}'s arugments to set the values for all buttons in the 
#'  group at once.
#'  
#'  \code{style}, \code{size}, and \code{disabled} have the same options as they
#'  do in \code{\link{bsButton}} but will affect all buttons in the group.
#'  
#'  \code{block = TRUE} will cause the button group to take up the full width of
#'  its parent element, and attempt to evenly space the buttons within it.
#'  
#'  \code{vertical = TRUE} will stack the button group vertically, rather than 
#'  horizontally. This doesn't always work well, and may not work in all
#'  browsers, so use at your own risk.
#'@details \code{bsButtonGroup} provides an alternative to 
#'  \code{\link{radioButtons}} and \code{\link{checkboxGroupInput}}. It creates 
#'  a group of buttons that return a single value based on which of the buttons 
#'  are \emph{clicked}.
#'  
#'  You build a button group in the same way you build a \code{\link{tabPanel}} 
#'  in shiny or a \code{\link{bsCollapsePanel}} in shinyBS. \code{bsButtonGroup}
#'  is a wrapper and you include \code{\link{bsButton}} elements inside it. The 
#'  button group will return a value based on which buttons within it are 
#'  currently pressed.
#'  
#'  \code{\link{bsButton}} has a \code{value} argument that you should use to 
#'  set the return value when that button is pressed. Setting the \code{value} 
#'  argument within the \code{bsButtonGroup} will determine which buttons are 
#'  initially \emph{clicked}.
#'  
#'@return When \code{toggle = 'checkbox'} the button group will return a vector 
#'  of values representing the buttons that are currently clicked. When 
#'  \code{toggle = 'radio'}, it will return a single value representing the 
#'  clicked button.
#'  
#'  If \code{value} was not set in \code{\link{bsButton}}, the button's id 
#'  will be returned instead.
#'  
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
#'@param id The inputId of the button group you wish to update
#'@details \code{updateButtonGroup} is used within server.R to change the style
#'  or state of a button group after the app has loaded.
#'@export
updateButtonGroup <- function(session, id, toggle = NULL, style = NULL, 
                              size = NULL, disabled = NULL, value = NULL) {
  
  data <- dropNulls(list(toggle = toggle, style = style, size = size, 
                         disabled = disabled, value = value))
  session$sendInputMessage(id, data)
  
}