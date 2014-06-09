#'@rdname Alerts
#'@name Alerts
#'@title Twitter Bootstrap Alerts
#'  
#'@description Functions to add and manipulate Twitter Bootstrap alerts in shiny
#'  
#'@details By default each new alert will be added below any previously existing
#'  alerts. If you want only one alert to appear at a time change append to 
#'  FALSE. This will cause new alerts to overwrite any previously existing 
#'  alerts.
#'  
#'  Block style is an option discussed in the Twitter Bootstrap documentation, 
#'  though it doesn't make any difference that the author can see.
#'  
#'@param inputId id of the alert anchor
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'@param alertId An id for the created alert. Optional, but necessary if you 
#'  want to close alert later with \code{closeAlert}
#'@param title A title for the alert. This text will be at the top of the alert 
#'  and be in larger, bold font
#'@param message The main text of the alert
#'@param type One of four options: \code{warning}, \code{danger}, \code{info}, 
#'  or \code{success}. Corresponds to standard Twitter Boostrap styles
#'@param dismiss Logical indicating whether the user should be able to close the
#'  alert
#'@param block Logical indicating whether 'block' formatting should be applied 
#'  to the alert
#'@param append Logical indicating whether the alert should be appended to the 
#'  alert anchor or should overwrite existing alerts in the alert anchor
#'  
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/components.html}{Components of
#'  Twitter Bootstrap 2.3.2}
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript 
#'  for Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsAlert <- function(inputId) {
  
  sbsHead(tags$div(class="tbs-alert", id = inputId, " "))

}

#'@rdname Alerts
#'@export
createAlert <- function(session, inputId, alertId = NULL, title=NULL, message=NULL, type=NULL, dismiss=TRUE, block=NULL, append=TRUE) {
  
  data <- dropNulls(list(id=inputId, alertId = alertId, title=title, message=message, type=type, dismiss=dismiss, block=block, append=append))

  session$sendCustomMessage(type="createalert", data)
  
}

#'@rdname Alerts
#'@export
closeAlert <- function(session, alertId) {
  
  session$sendCustomMessage(type="closealert", alertId)
  
}