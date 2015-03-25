#'closeAlert
#'
#'\code{closeAlert} is used within your Server logic to close an alert that you 
#'created with \code{\link{createAlert}}.
#'
#'@param alertId The id of the alert to be dismissed.
#'@inheritParams createAlert
#'
#'@templateVar item_name closeAlert
#'@templateVar family_name Alerts
#'@template item_details
#'@template footer
#'@export
closeAlert <- function(session, alertId) {
  
  session$sendCustomMessage(type="bsAlertClose", alertId)
  
}