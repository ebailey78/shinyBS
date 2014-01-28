bsAlert <- function(inputId) {
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$div(class="shinybs-alert", id = inputId, " ")
  )

}

createAlert <- function(session, inputId, alertId = NULL, title=NULL, message=NULL, type=NULL, dismiss=TRUE, block=NULL, append=TRUE) {
  
  data <- shiny:::dropNulls(list(id=inputId, alertId = alertId, title=title, message=message, type=type, dismiss=dismiss, block=block, append=append))

  session$sendCustomMessage(type="createalert", data)
  
}

closeAlert <- function(session, alertId) {
  
  session$sendCustomMessage(type="closealert", alertId)
  
}