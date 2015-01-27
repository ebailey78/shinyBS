bsModal <- function(id, title, trigger, ..., size) {
  print(1)
  if(!missing(size)) {
    if(size == "large") {
      size = "modal-lg"
    } else if(size == "small") {
      size = "modal-sm"
    }
    size <- paste("modal-dialog", size)
  } else {
    size <- "modal-dialog"
  }
  print(2)
  mo <- tags$div(class = "modal sbs-modal fade", id = id, tabindex = "-1", "data-sbs-trigger" = trigger,
                 tags$div(class = size,
                          tags$div(class = "modal-content",
                                   tags$div(class = "modal-header",
                                            tags$button(type = "button", class = "close", "data-dismiss" = "modal", tags$span(HTML("&times;"))),
                                            tags$h4(class = "modal-title", title)
                                    ),
                                   tags$div(class = "modal-body", list(...)),
                                   tags$div(class = "modal-footer",
                                            tags$button(type = "button", class = "btn btn-default", "data-dismiss" = "modal", "Close")
                                   )
                          )
                  )
        )
  print(3)
  return(mo)
  
}

toggleModal <- function(session, modalId, toggle = "toggle") {
  
  session$sendInputMessage(modalId, list(toggle = toggle))
  
}