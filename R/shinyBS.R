bsGlyph <- function(name, white = FALSE) {
  class <- name
  if(white) class <- paste(class, "icon-white")
  tags$i(class=class)
}

bsTooltip <- function(id, title, placement="bottom", trigger="hover") {
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$script(paste0("addTooltip('", id, "', '", title, "', '", placement, "', '", trigger, "');"))
  )
  
}

bsPopover <- function(id, title, content, placement="right", trigger="click") {
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$script(paste0("addPopover('", id, "', '", title, "', '", content, "', '", placement, "', '", trigger, "');"))
  )
  
}

bsAlert <- function(id, text, type="warn", dismiss=TRUE) {
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$div(class=paste0("alert alert-", type),
           if(dismiss) tags$button(type="button", class="close", "data-dismiss"="alert", HTML("&times;")),
           text
          )
  )
  
}

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

bsTypeAhead <- function(inputId, data.source, items=4, minLength=1) {
  
  data.source <- paste0("[\"", paste0(data.source, collapse="\", \"") , "\"]")
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$input(id=inputId, type="text", "data-provide"="typeahead", "data-source" = data.source)  
  )
  
}