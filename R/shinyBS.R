bsGlyph <- function(name, white = FALSE) {
  class <- name
  if(white) class <- paste(class, "icon-white")
  tags$i(class=class)
}

bsTooltip <- function(id, title, placement="bottom", trigger="hover") {
  
  tagList(tags$head(singleton(tags$script(src="tbs/shinyBS.js"))),
          tags$script(paste0("addTooltip('", id, "', '", title, "', '", placement, "', '", trigger, "');")))
  
}

bsPopover <- function(id, title, content, placement="right", trigger="click") {
  
  tagList(tags$head(singleton(tags$script(src="tbs/shinyBS.js"))),
          tags$script(paste0("addPopover('", id, "', '", title, "', '", content, "', '", placement, "', '", trigger, "');")))
  
}

bsAlert <- function(id, text, type="warn", dismiss=TRUE) {
  
  tags$div(class=paste0("alert alert-", type),
           if(dismiss) tags$button(type="button", class="close", "data-dismiss"="alert", HTML("&times;")),
           text
           )
  
}

bsModal <- function(inputId, title, content) {
  
  tags$div(id = inputId, class="modal hide fade",
           tags$div(class="modal-header",
                    tags$button(type="button", class="close", "data-dismiss"="modal", "aria-hidden"="true", HTML("&times;")),
                    tags$h4(title)),
           tags$div(class="modal-body", HTML(content)),
           tags$div(class="modal-footer", tags$a(href="#", "data-dismiss"="modal", "aria-hidden"="true", class="btn btn-primary", "Close"))
           )
  
}