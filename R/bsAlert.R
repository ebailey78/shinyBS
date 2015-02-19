#' Alerts
#' 
#' Alerts allow you to communicate information to the user on the fly. Standard
#' Bootstrap styling options give the user a hint at the type of information 
#' contained in the Alert.
#' 
#' @param anchorId A unique ID that identifies the anchor.
#' @param alertId A unique ID that identifies the specific alert being created.
#' @param title An optional title for the alert. This will appear at the top of the alert in larger font.
#' @param content The main body of the alert. HTML tags are allowed.
#' @param style A Bootstrap style to apply (\code{danger}, \code{warning}, \code{info}, or \code{success}.
#' @param dismiss \code{logical} indicating whether the alert should be user dismissable.
#' @param append \code{logical} indicating whether the alert should be appended to the anchor, below any existing alerts.
#' @inheritParams shiny::updateTextInput
#' @name Alerts
#' 
#' @details
#' To create alerts in your Shiny app you must place \code{bsAlert} in your ui.
#' This serves as an anchor that tells shinyBS where to place the alerts created
#' with \code{createAlert}. 
#' 
#' Use \code{createAlert} in your server script to add alerts to the anchor 
#' you created with \code{bsAlert} in your ui. You can place \code{createAlert}
#' in observers, reactives, or outputs. A common usage may be to have logic that
#' validates a user's inputs. If they are valid produce the requested output, if
#' not use \code{createAlert} to give the user info about what they need to 
#' change.
#' 
#' @section Changes:
#' \code{style} was called \code{type} in previous versions of shinyBS.
#' 
#' \code{anchorId} was called \code{inputId} in previous versions of shinyBS.
#' 
#' \code{content} was called \code{message} in previous versions of shinyBS.
#' 
#' @template footer
NULL

#'@rdname Alerts
#'@export
bsAlert <- function(anchorId) {
  
  bsTag <- shiny::tags$div(class = "sbs-alert", id = anchorId, " ")
  
  htmltools::attachDependencies(bsTag, shinyBSDep)

}

#'@rdname Alerts
#'@export
createAlert <- function(session, anchorId, alertId = NULL, title=NULL, 
                        content=NULL, style=NULL, dismiss=TRUE, append=TRUE) {
  
  data <- dropNulls(list(id = anchorId, alertId = alertId, title = title, 
                         content = content, style = style, dismiss = dismiss, 
                         append = append))

  session$sendCustomMessage(type="bsAlertCreate", data)
  
}

#'@rdname Alerts
#'@export
closeAlert <- function(session, alertId) {
  
  session$sendCustomMessage(type="bsAlertClose", alertId)
  
}