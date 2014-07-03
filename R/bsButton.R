#'@templateVar item_name Button
#'@template component
#'@details shinyBS adds additional styling options to the 
#'  \code{\link{actionButton}} and introduces two new types of buttons to the
#'  shiny interface.
NULL

#'@rdname buttons
#'@param inputId Input variable to assign the control's value to
#'@param label The text that will appear within the button
#'@param value See details
#'@param style The style to apply to the button
#'@param size The desired size of the button
#'@param block Logical indicating whether the button should be a block level 
#'  control.
#'@param disabled Logical indicating whether the button should be clickable
#'@details \code{bsButton} is a generic button that doesn't have any default 
#'  behavior. They are used as inputs when creating a 
#'  \code{\link{bsButtonGroup}}. They can also be used as triggers for other 
#'  elements like \code{\link{bsModal}} or \code{\link{bsPopover}}.
#'  
#'  For \code{bsButton}, \code{value} is used to assign a return value for 
#'  \code{\link{bsButtonGroup}}. See \code{\link{bsButtonGroup}} for more 
#'  details. For \code{bsToggleButton} and \code{updateButton}, \code{value} is 
#'  used to set whether the button is currently 'clicked'.
#'  
#'  \code{style} is used to customize the appearence of buttons. There are six 
#'  options for style: \code{primary}, \code{info}, \code{success}, 
#'  \code{warning}, \code{danger}, \code{inverse}, \code{link}. Any other value 
#'  will result in a standard button style.
#'  
#'  \code{size} is used to control the size of buttons. \code{size} can be 
#'  \code{large}, \code{small}, or \code{mini}. Any other value will result in a
#'  standard-sized button.
#'  
#'  Setting \code{block = TRUE} will cause the button to take up the full width 
#'  of its parent element.
#'  
#'  When \code{disabled = TRUE} the button will appear "greyed-out" and clicking
#'  the button will have no effect on the app.
#'  
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
#'@details \code{bsToggleButton} is an alternative to 
#'  \code{\link{checkboxInput}}. It has on and an off states that correspond to
#'  \code{TRUE/FALSE}. When \code{TRUE} the toggle button will look like it is pressed
#'  in. When \code{FALSE} it will appear as a normal button. Clicking the toggle
#'  button will alternate between the two states.
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
#'@details \code{bsActionButton} works just like shiny's default
#'  \code{\link{actionButton}} but has additional styling options.
#'@export
bsActionButton <- function(inputId, label, style = NULL, size = NULL, block = FALSE,
                           disabled = FALSE) {
  
  btn <- bsButton(inputId, label, style = style, size=size, block = block, disabled=disabled)

  btn[[2]] <- tagRemoveClass(btn[[2]], "sbs-btn")
  btn[[2]] <- tagAddClass(btn[[2]], "sbs-action-button")
  
  return(btn)
  
}

#'@rdname buttons
#'@param session The session object passed from shinyServer
#'@param id The id of the button you want to update with \code{updateButton}
#'@details updateButton can be used within server.R to change the appearence
#'  and/or state of any of the shinyBS button types. If a parameter is passed to
#'  \code{updateButton} that doesn't apply to the button selected, it will be
#'  ignored (e.g. \code{value} for \code{bsActionButton}).
#'@export
updateButton <- function(session, id, label = NULL, value = NULL, style = NULL, 
                         size = NULL, block = NULL, disabled = NULL) {
  
  data <- dropNulls(list(label = label, value = value, style = style, 
                         size = size, block = block, disabled = disabled))
  
  session$sendInputMessage(id, data)
  
}

