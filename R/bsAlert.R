bsAlert <- function(id, text, type="warn", dismiss=TRUE) {
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$div(class=paste0("alert alert-", type),
                   if(dismiss) tags$button(type="button", class="close", "data-dismiss"="alert", HTML("&times;")),
                   text
          )
  )
  
}