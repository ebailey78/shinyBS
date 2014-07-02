#'@templateVar item_name Alert
#'@template component_header
#'  
#'@details By default each new alert will be added below any previously existing
#'  alerts. If you want only one alert to appear at a time change append to 
#'  FALSE. This will cause new alerts to overwrite any previously existing 
#'  alerts.
#'  
#'  Block style is an option discussed in the Twitter Bootstrap documentation, 
#'  it seems to add a slight amount of padding to the alert box.
#'  
#'@param inputId id of the alert anchor
#'@template footer
bsAlert <- function(inputId) {
  
  sbsHead(tags$div(class="tbs-alert", id = inputId, " "))

}

#'@rdname alerts
#'@template session
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
#'@export
createAlert <- function(session, inputId, alertId = NULL, title=NULL, message=NULL, type=NULL, dismiss=TRUE, block=NULL, append=TRUE) {
  
  data <- dropNulls(list(id=inputId, alertId = alertId, title=title, message=message, type=type, dismiss=dismiss, block=block, append=append))

  session$sendCustomMessage(type="createalert", data)
  
}

#'@rdname alerts
#'@export
closeAlert <- function(session, alertId) {
  
  session$sendCustomMessage(type="closealert", alertId)
  
}