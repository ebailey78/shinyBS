#'bsButton
#'
#'\code{bsButton} is used in your UI script to create customizable action and toggle
#'buttons.
#'
#'@inheritParams shiny::actionButton
#'@param style A Bootstrap style to apply to the button. (\code{default}, \code{primary},
#'\code{success}, \code{info}, \code{warning}, or \code{danger})
#'@param size The size of the button (\code{extra-small}, \code{small}, 
#'\code{default}, or \code{large})
#'@param type The type of button to create. (\code{action} or \code{toggle})
#'@param block \bold{logical} Should the button take the full width of the parent element?
#'@param disabled \bold{logical} Should the button be disabled (un-clickable)?
#'@param value \bold{logical} If \code{type = "toggle"}, the initial value of the button.
#' 
#'@templateVar item_name bsButton
#'@templateVar family_name Buttons
#'@template item_details
#'@template footer
#'@export
bsButton <- function(inputId, label, icon = NULL, ..., style = "default",
                     size = "default", type = "action", block = FALSE,
                     disabled = FALSE, value = FALSE) {
  btn <- shiny::actionButton(inputId, label, icon, ...)
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
  
  size <- switch(size,
                 "extra-small" = "btn-xs",
                 "small" = "btn-sm",
                 "large" = "btn-lg",
                 "default")
  
  if(size != "default") {
    btn <- addClass(btn, size)
  }
  
  if(block == TRUE) {
    btn <- addClass(btn, "btn-block")
  }
  if(disabled) {
    btn <- addAttribs(btn, disabled = "disabled")
  }
  
  htmltools::attachDependencies(btn, shinyBSDep)
  
}