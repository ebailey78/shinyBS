#'@export
bsAlert <- function(inputId) {
  
  bsTag <- tags$div(class = "sbs-alert", id = inputId, " ")
  
  htmltools::attachDependencies(bsTag, shinyBSDep)
  

}

#'@export
createAlert <- function(session, inputId, alertId = NULL, title=NULL, message=NULL, type=NULL, dismiss=TRUE, append=TRUE) {
  
  data <- dropNulls(list(id=inputId, alertId = alertId, title=title, message=message, type=type, dismiss=dismiss, append=append))

  session$sendCustomMessage(type="createAlert", data)
  
}

#'@export
closeAlert <- function(session, alertId) {
  
  session$sendCustomMessage(type="closeAlert", alertId)
  
}