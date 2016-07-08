#'updateButton
#'
#'\code{updateButton} is used in your Server logic to update the style or state
#'of a button.
#'
#'@inheritParams bsButton
#'@param session The session object passed to function given to shinyServer.
#' 
#'@details Because of the way it is coded, \code{updateButton} may work on buttons not
#'created by \code{\link{bsButton}} such as \code{\link{submitButton}}.
#'
#'See \code{\link{Buttons}} for more information about how to use \code{updateButton} with the rest of the Buttons family.
#' 
#'@templateVar item_name updateButton
#'@templateVar family_name Buttons
#'@template item_details
#'@template footer
#'@export
updateButton <- function(session, inputId, label = NULL, icon = NULL, value = NULL, style = NULL,
                         size = NULL, block = NULL, disabled = NULL) {

  if(!is.null(icon)) icon <- as.character(icon)

  if(!is.null(size)) {
    size <- switch(size,
                   "extra-small" = "btn-xs",
                   "small" = "btn-sm",
                   "large" = "btn-lg",
                   "default" = "default")
  }

  data <- dropNulls(list(id = inputId, label = label, icon = icon, value = value, style = style,
                         size = size, block = block, disabled = disabled))
  
  session$sendCustomMessage("bsButtonUpdate", data)
  
}