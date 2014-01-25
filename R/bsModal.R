bsModal <- function(inputId, trigger, title, content) {
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$div(id = inputId, class="modal hide fade",
                   tags$div(class="modal-header",
                            tags$button(type="button", class="close", "data-dismiss"="modal", "aria-hidden"="true", HTML("&times;")),
                            tags$h4(title)),
                   tags$div(class="modal-body", HTML(content)),
                   tags$div(class="modal-footer", tags$a(href="#", "data-dismiss"="modal", "aria-hidden"="true", class="btn btn-primary", "Close"))
          ),
          tags$script(paste0("addModal('", trigger, "', '", inputId, "');"))
  )
  
}
