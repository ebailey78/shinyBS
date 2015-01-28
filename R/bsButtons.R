#'@templateVar item_name Button
#'@template component
#'@details shinyBS adds additional styling options to the
#' \code{\link{actionButton}} and introduces two new types of buttons to the
#' shiny interface.
NULL

#'@rdname buttons
#'@param inputId Input variable to assign the control's value to
#'@param label The text that will appear within the button
#'@param value See details
#'@param style The style to apply to the button
#'@param size The desired size of the button
#'@param block Logical indicating whether the button should be a block level
#' control.
#'@param disabled Logical indicating whether the button should be clickable
#'@details \code{bsButton} is a generic button that doesn't have any default
#' behavior. They are used as inputs when creating a
#' \code{\link{bsButtonGroup}}. They can also be used as triggers for other
#' elements like \code{\link{bsModal}} or \code{\link{bsPopover}}.
#'
#'@section Options:
#' For \code{bsButton}, \code{value} is used to assign a return value for
#' \code{\link{bsButtonGroup}}. See \code{\link{bsButtonGroup}} for more
#' details. For \code{bsToggleButton} and \code{updateButton}, \code{value} is
#' used to set whether the button is currently 'clicked'.
#'
#' \code{style} is used to customize the appearence of buttons. There are six
#' options for style: \code{primary}, \code{info}, \code{success},
#' \code{warning}, \code{danger}, \code{inverse}, \code{link}. Any other value
#' will result in a standard button style.
#'
#' \code{size} is used to control the size of buttons. \code{size} can be
#' \code{large}, \code{small}, or \code{mini}. Any other value will result in a
#' standard-sized button.
#'
#' Setting \code{block = TRUE} will cause the button to take up the full width
#' of its parent element.
#'
#' When \code{disabled = TRUE} the button will appear "greyed-out" and clicking
#' the button will have no effect on the app.
#'
#'@export
bsButton <- function(inputId, label, icon = NULL, ..., style = "default", 
                     size = "md", type = "action", block = FALSE, 
                     disabled = FALSE, value = FALSE) {
  
  btn <- actionButton(inputId, label, icon, ...)
  
  if(type == "toggle") {
    btn <- removeClass(btn, "action-button")
    btn <- addClass(btn, "sbs-toggle-button")

    if(value == TRUE) {
      btn <- addClass(btn, "active")
    }
  }
  
  if(style != "default") {
    btn <- removeClass(btn, "btn-default")
    btn <- addClass(btn, paste0("btn-", style))
  }
  
  if(size != "md") {
    btn <- addClass(btn, paste0("btn-", size))
  }
  
  if(block == TRUE) {
    btn <- addClass(btn, "btn-block")
  }
  
  if(disabled) {
    btn <- addAttribs(btn, disabled = "disabled")
  }
  
  return(btn)
  
}

#'@export
updateButton <- function(session, id, label = NULL, icon = NULL, value = NULL, style = NULL, 
                         size = NULL, block = NULL, disabled = NULL) {
  
  if(!is.null(icon)) icon <- as.character(icon)
  
  data <- dropNulls(list(id = id, label = label, icon = icon, value = value, style = style, 
                         size = size, block = block, disabled = disabled))
  
  session$sendCustomMessage("bsButtonUpdate", data)
  
}

# # Creates a button group
# bsButtonGroup <- function(inputId, ..., label, toggle = "checkbox", style, size, 
#                           value = NULL, disabled = FALSE, block = FALSE, vertical = FALSE) {
#     
#   # Start the button group tag
#   btngrp <- tags$div(id = inputId, class = "btn-group sbs-button-group")
#   btns <- list(...)
# 
#   if(inputCheck(toggle = toggle, valid = c("checkbox", "radio"))) {
#     btngrp$attribs['data-toggle'] <- paste0("buttons-", toggle)
#   }
#   
#   if(block) btngrp <- addClass(btngrp, "btn-block")
#   if(vertical) btngrp <- addClass(btngrp, "btn-group-vertical")
#   
#   if(!missing(style)) {
#     if(inputCheck(style = style, 
#                   valid = c("primary", "info", "success", "warning", 
#                             "danger", "inverse", "link"))) {
#       style = paste0("btn-", style)
#     }
#   }
#   
#   if(!missing(size)) {
#     if(inputCheck(size = size, valid = c("large", "small", "mini"))) {
#       size = paste0("btn-", size)
#     }
#   }
#   
#   # Loop through the buttons for the group making neccesary changes
#   for(btn in btns) {
#     
#     btn2 <- btn[[2]]
#     
#     if(disabled) btn2 <- addClass(btn2, "disabled")
# 
#     btn2$attribs['data-toggle'] <- NULL
#     btn2 <- removeClass(btn2, "action-button btn-block toggle-button active")
#     
#     if(btn2$attribs['data-value'] %in% value) {
#       btn2 <- addClass(btn2, "active bs-active")
#     }
#     
#     if(block) btn2$name <- "span"
#     
#     if(!missing(size)) {
#       btn2 <- removeClass(btn2, "btn-large btn-small btn-mini")
#       btn2 <- addClass(btn2, size)
#     }
#     
#     if(!missing(style)) {
#       styles <- "btn-primary btn-info btn-success btn-warning btn-danger btn-inverse btn-link"
#       btn2 <- removeClass(btn2, styles)
#       btn2 <- addClass(btn2, style)
#     }
#     
#     btn[[2]] <- btn2
#     
#     btngrp <- tagAppendChild(btngrp, btn)
#     
#   }
# 
#   if(!missing(label)) {
#     btngrp <- tagList(tags$label(label, 'for' = inputId), btngrp)
#   }
#   
#   return(sbsHead(btngrp))
# 
# }
# 
# updateButtonGroup <- function(session, id, toggle = NULL, style = NULL, 
#                               size = NULL, disabled = NULL, value = NULL) {
#   
#   data <- dropNulls(list(toggle = toggle, style = style, size = size, 
#                          disabled = disabled, value = value))
#   session$sendInputMessage(id, data)
#   
# }