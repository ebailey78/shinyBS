bsModal <- function(id, title, trigger, ..., href) {
  
  mo <- tags$div(class = "modal sbs-modal hide fade", id = id,
                 "data-trigger" = trigger,
                 tags$div(class = "modal-header",
                          tags$button(Type = "button", class = "close",
                                      "data-dismiss" = "modal", HTML("&times;")),
                          tags$h3(title)),
                 body <- tags$div(class = "modal-body"),
                 tags$div(class = "modal-footer",
                         tags$a(href = "#", class = "btn", "data-dismiss" = "modal", "Close")
                         )
                 )

  if(!missing(href)) {
    mo <- addAttribs(mo, "data-remote" = href)
  } else {
    mo$children[[2]] <- tagAppendChildren(mo$children[[2]], list = list(...))
  }

  return(mo)
  
}

toggleModal <- function(session, modalId) {
  
  session$sendInputMessage(modalId, list(toggle = TRUE))
  
}