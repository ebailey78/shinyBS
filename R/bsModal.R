bsModal <- function(id, title, ..., trigger, trigger.type = "click") {
  tags$div(class = "modal sbs-modal hide fade", id = id,
           "data-trigger" = trigger,
           "data-trigger-type" = trigger.type,
           tags$div(class = "modal-header",
                    tags$button(type = "button", class = "close",
                                "data-dismiss"="modal", HTML("&times;")),
                    tags$h3(title)),
           tags$div(class = "modal-body",
                    ...),
           tags$div(class = "modal-footer",
                    tags$a(href = "#", class = "btn", "data-dismiss" = "modal", "Close")
                    )
           )
}