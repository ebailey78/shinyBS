# Creates an alert anchor
bsAlert <- function(inputId) {
  
  sbsHead(tags$div(class="sbs-alert", id = inputId, " "))

}

# Adds and alert to an alert anchor.
createAlert <- function(session, inputId, alertId = NULL, title=NULL, message=NULL, type=NULL, dismiss=TRUE, append=TRUE) {
  
  data <- dropNulls(list(id=inputId, alertId = alertId, title=title, message=message, type=type, dismiss=dismiss, append=append))

  session$sendCustomMessage(type="createAlert", data)
  
}

# Closes and alert
closeAlert <- function(session, alertId) {
  
  session$sendCustomMessage(type="closeAlert", alertId)
  
}