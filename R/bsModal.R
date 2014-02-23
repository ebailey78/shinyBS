bsModal <- function(id, header, body, trigger) {
  
  sbsHead(tags$div(id = id, class = "modal hide fade",
           tags$div(class = "modal-header",
                    tags$button(type = "button", class = "close", "data-dismiss" = "modal", "aria-hidden" = "true", "&times;"),
                    header
                    ),
           tags$div(class = "modal-body",
                    body),
           tags$div(class = "modal-footer",
                    tags$a(href = "#", class = "button", "Close")
                    )
           )
          ) 
  
}