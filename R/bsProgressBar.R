bsProgressBar <- function(inputId, value = 0, visible=TRUE, 
                          color, striped=FALSE, animate=FALSE) {
  
  class = "progress"
  if(striped) {
    class=paste(class, "progress-striped")
  } else if(animate) {
    class=paste(class, "progress-striped active")
  }
  if(!missing(color)) {
    class=paste0(class, " progress-", color)
  }
  if(!visible) {
    class=paste(class, "hidden")
  }
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
                              tags$div(class=class, id=inputId,
                                tags$div(class="bar", style=paste0("width: ", initial.value, "%;"))
                              )
  )

}

updateProgressBar <- function(session, inputId, value=NULL, visible=NULL, color=NULL, striped=NULL, animate=NULL) {
  
  data <- shiny:::dropNulls(list(id=inputId, value=value, visible=visible, 
                                 color=color, striped=striped, animate=animate))
  
  session$sendCustomMessage("updateprogress", data)
  
}