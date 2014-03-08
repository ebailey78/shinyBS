# Creates an alert anchor
bsAlert <- function(inputId) {
  
  sbsHead(tags$div(class="tbs-alert", id = inputId, " "))

}

# Adds and alert to an alert anchor.
createAlert <- function(session, inputId, alertId = NULL, title=NULL, message=NULL, type=NULL, dismiss=TRUE, block=NULL, append=TRUE) {
  
  data <- dropNulls(list(id=inputId, alertId = alertId, title=title, message=message, type=type, dismiss=dismiss, block=block, append=append))

  session$sendCustomMessage(type="createalert", data)
  
}

# Closes and alert
closeAlert <- function(session, alertId) {
  
  session$sendCustomMessage(type="closealert", alertId)
  
}