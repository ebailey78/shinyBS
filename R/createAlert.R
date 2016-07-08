#'createAlert
#'
#'\code{createAlert} is used within the Server logic of your Shiny app to display
#'an alert to the user.
#'
#'@param session The session object passed to function given to shinyServer.
#'@param anchorId The unique identifier of the anchor where the alert should be
#'displayed.
#'@param alertId \bold{Optional} A unique identifier for the Alert.
#'@param title \bold{Optional} A title for the Alert.
#'@param content The main body of the Alert. HTML tags are allowed.
#'@param style A bootstrap style to apply. Defaults to \code{info}.
#'@param dismiss \code{logical} Should the Alert be user dismissable? Defaults to \code{TRUE}.
#'@param append \code{logical} Should the Alert be appended below existing Alerts? Default to \code{TRUE}.
#'
#'@templateVar item_name createAlert
#'@templateVar family_name Alerts
#'@template item_details
#'@template footer
#'@export
createAlert <- function(session, anchorId, alertId = NULL, title=NULL, 
                        content=NULL, style=NULL, dismiss=TRUE, append=TRUE) {
  
  data <- dropNulls(list(id = anchorId, alertId = alertId, title = title, 
                         content = content, style = style, dismiss = dismiss, 
                         append = append))
  
  session$sendCustomMessage(type="bsAlertCreate", data)
  
}
