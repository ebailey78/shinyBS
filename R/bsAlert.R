#'@templateVar item_name Alert
#'@template component
#'@details Alerts are used to convey small amounts of information to the
#' user of your shiny app. They have default stylings to convey the type of
#' information they contain. For example, you may want a warning alert that
#' lets your user know that they have made an invalid selection, or a success
#' alert that lets them know some process has completed successfully.
NULL
#'@rdname alerts
#'@param inputId id of the alert anchor
#'@details Use \code{bsAlert} within ui.R to mark where in the app you want
#'your alerts to appear. You can add multiple \code{bsAlert} anchors to an app
#'if you want alerts to appear in different places.
#'@export
bsAlert <- function(inputId) {
  
  sbsHead(tags$div(class="sbs-alert", id = inputId, " "))

}

#'@rdname alerts
#'@param session The session thing
#'@param alertId An id for the created alert. (Optional)
#'@param title A title for the alert. This text will be at the top of the alert
#' and be in larger, bold font
#'@param message The main text of the alert
#'@param type One of four options: \code{warning}, \code{danger}, \code{info},
#' or \code{success}. Corresponds to standard Twitter Boostrap styles
#'@param dismiss Logical indicating whether the user should be able to close the
#' alert
#'@param append Logical indicating whether the alert should be appended to the
#' alert anchor or should overwrite existing alerts in the alert anchor
#'
#'@details \code{createAlert} is used in server.R to create an alert within
#' an anchor created by \code{bsAlert}. For example, you may have an observer
#' that watches for certain conditions, like a missing input or an empty
#' data.frame and calls \code{createAlert} to create an alert warning the user
#' of the problem.
#'
#' The alert consists of an optional \code{title} and \code{message}. The title
#' will appear on its own line as larger bold text. The message is the main
#' body of the alert and with dislay as standard text.
#'
#'@section Options:
#'
#' \code{alertId} is optional but serves two useful functions. First, if an
#' alert is assigned an id with \code{alertId} it can be dismissed later by
#' using \code{closeAlert}. Second, if you assign an alert an id, shinyBS will
#' check to see if an alert with the same id already exists, and if it does it
#' wont create the new alert.
#'
#' \code{type} is used to set the style of the alert. There are currently four
#' options: \code{warning}, \code{danger}, \code{info}, or \code{success}.
#' These Correspond to standard Twitter Boostrap styles.
#'
#' The Twitter Bootstrap documentation says that \code{block} is for use when
#' \code{message} is longer. It adds a small amount of additional padding to the
#' alert that is meant to help set it apart from other elements on the page. I
#' don't see that it makes much of a difference...
#'
#' By default, any alert created with \code{createAlert} will have a small "x"
#' button in its upper-righ corner that the user can use to dismiss the alert.
#' You can remove this button by setting \code{dismiss = FALSE}. If you do
#' this, you may want to set a value for alertId so that you can remove the
#' alert with \code{closeAlert} later.
#'
#' By default, when you use \code{createAlert} it will create an append an
#' alert below the last alert created in the anchor. If \code{append = FALSE}
#' then any existing alerts in the anchor will be removed before the new alert
#' is created.
#'
#'@export
createAlert <- function(session, inputId, alertId = NULL, title=NULL, message=NULL, type=NULL, dismiss=TRUE, append=TRUE) {
  
  data <- dropNulls(list(id=inputId, alertId = alertId, title=title, message=message, type=type, dismiss=dismiss, append=append))

  session$sendCustomMessage(type="createAlert", data)
  
}

#'@rdname alerts
#'@details
#'\code{closeAlert} is used from server.R to close an existing alert. You must have assigned the alert an alertId at creation to use \code{closeAlert}.
#'@export
closeAlert <- function(session, alertId) {
  
  session$sendCustomMessage(type="closeAlert", alertId)
  
}