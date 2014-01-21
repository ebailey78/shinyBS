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