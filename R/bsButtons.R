#'@rdname buttons
#'@name Buttons
#'@title Twitter Bootstrap Buttons
#'  
#'@templateVar item_name button
#'@template component_desc
#'  
#'@param inputId Id to assign to the button or button group
#'@param id The id of the button/button group you want to update
#'@param \dots \code{bsButton()} objects to be added to the button group
#'@param label For buttons, the text to appear inside the button. For button 
#'  groups, an optional label that will appear above the button group
#'@param toggle The type of toggle behavior the button group should have (See 
#'  Details)
#'@param style The bootstrap style the button(s) should take (See Details)
#'@param size The bootstrap size the button(s) should take (See Details)
#'@param block Logical indicating whether the button or button group should be a
#'  block level element (i.e., should it span the width of its parent element)
#'@param vertical Logical indicating whether the button group should have a 
#'  vertical orientation
#'@param value The value of the button/button group (See Details)
#'@param disabled Logical indicating whether the button(s) should be disabled
#'  
#'@details \code{bsActionButton()} creates an action button that behaves just as
#'a standard shiny action button does. It has the added functionality of being
#'able to changed its style and size. It can also be disabled/enabled.\cr\cr 
#'\code{toggle} can take a value of either \code{radio} or \code{checkbox}.
#'\code{radio} will allow only one button in the button group to be selected at
#'a time. \code{checkbox} will allow any number of buttons to be selected at a
#'time. \cr\cr \code{style} can be any of the styles described in the Twitter
#'Bootstrap 2.3.2 documentation. Acceptable values are currently: primary, info,
#'success, warning, danger, inverse, or link. Additionally, when calling one of
#'the update functions, style can be set to \code{default} to return to the
#'default button style.\cr\cr \code{size} can be any of the sizes described in
#'the Twitter Bootstrap 2.3.2 documentation. Accepatble values are currently:
#'large, small, or mini. Additionally, when calling one of the update functions,
#'style can be set to \code{default} to return to the default size.\cr\cr For
#'toggle buttons, \code{value} can be \code{TRUE} or \code{FALSE} and
#'corresponds to whether the button is currently 'clicked.' For \code{bsButton},
#'\code{value} is used to set the value that will be returned by containing
#'\code{bsButtonGroup} object when the button is clicked. For button groups,
#'\code{value} is used to set the current value to be returned by the group and
#'should correspond to values assigned to buttons contained in the button
#'group.\cr\cr \code{vertical} and \code{block} for button groups are
#'experimental. They do not work well together and may not work under all
#'browsers.
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/components.html}{Components of
#'  Twitter Bootstrap 2.3.2}
#'@references \href{http://getbootstrap.com/2.3.2/base-css.html}{Base CSS for
#'  Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsButton <- function(inputId, label, value, style = NULL, size = NULL, 
                     block = FALSE, disabled = FALSE) {
  
  btn <- tags$button(id = inputId, type = "button", class = "btn sbs-btn", 
                     label)
  
  if(disabled) btn <- tagAddClass(btn, "disabled")
  if(block) btn <- tagAddClass(btn, "btn-block")
  
  if(!is.null(style)) {
    inputCheck(style = style, valid = c("primary", "info", "success", "warning", 
                                        "danger", "inverse", "link"))
    btn <- tagAddClass(btn, paste0("btn-", tolower(style)))
  }
  
  if(!is.null(size)) {
    inputCheck(size = size, valid = c("large", "small", "mini"))
    btn <- tagAddClass(btn, paste0("btn-", tolower(size)))
  }
  
  if(!missing(value)) btn <- tagAddAttribs(btn, 'data-value' = value)
  
  return(sbsHead(btn))
  
}

#'@rdname buttons
#'@export
bsToggleButton <- function(inputId, label, value = FALSE, style = NULL, 
                           size = NULL, block = FALSE, disabled = FALSE) {
  
  btn <- bsButton(inputId, label=label, style=style, size=size, block = block, disabled=disabled)

  btn[[2]] <- tagRemoveClass(btn[[2]], "sbs-btn")
  btn[[2]] <- tagAddClass(btn[[2]], "sbs-toggle-button")
  
  btn[[2]] <- tagAddAttribs(btn[[2]], 'data-toggle' = "button")
  
  if(value) btn[[2]] <- tagAddClass(btn[[2]], "active bs-active")
    
  return(btn)
  
}

#'@rdname buttons
#'@export
bsActionButton <- function(inputId, label, style = NULL, size = NULL, block = FALSE,
                           disabled = FALSE) {
  
  btn <- bsButton(inputId, label, style = style, size=size, block = block, disabled=disabled)

  btn[[2]] <- tagRemoveClass(btn[[2]], "sbs-btn")
  btn[[2]] <- tagAddClass(btn[[2]], "sbs-action-button")
  
  return(btn)
  
}

#'@rdname buttons
#'@export
updateButton <- function(session, id, label = NULL, value = NULL, style = NULL, 
                         size = NULL, block = NULL, disabled = NULL) {
  
  data <- dropNulls(list(label = label, value = value, style = style, 
                         size = size, block = block, disabled = disabled))
  
  session$sendInputMessage(id, data)
  
}

#'@rdname buttons
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

#'@rdname buttons
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'@export
updateButtonGroup <- function(session, id, toggle = NULL, style = NULL, 
                              size = NULL, disabled = NULL, value = NULL) {
  
  data <- dropNulls(list(toggle = toggle, style = style, size = size, 
                         disabled = disabled, value = value))
  session$sendInputMessage(id, data)
  
}