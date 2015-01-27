bsCollapse <- function(..., id = NULL, multiple = FALSE, open = NULL) {
  if(is.null(id)) id = paste0("collapse", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  if(!multiple & length(open) > 1) {
    open <- open[1]
  }
  
  panels <- list(...)
  for(i in seq(length(panels))) {
    if(getAttribs(panels[[i]])$id %in% open) {
      panels[[i]]$children[[2]] <- addClass(panels[[i]]$children[[2]], "in")
    }
    if(!multiple) {
      panels[[i]]$children[[1]]$children[[1]]$children[[1]] <- addAttribs(panels[[i]]$children[[1]]$children[[1]]$children[[1]], 'data-parent' = paste0("#", id))
    }
  }
  
  sbsHead(tags$div(class = "panel-group sbs-panel-group", id=id, role = "tablist", panels))
  
  
}

bsCollapsePanel <- function(title, ..., id = NULL, value = NULL, type = NULL) {
  
  content <- list(...)
  
  if(is.null(id)) id <- paste0("cpanel", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  if(is.null(value)) {
    value = title
  }
  if(is.null(type)) {
    type = "default"
  }
  
  tags$div(class = paste0("panel panel-", type), value = value,
    tags$div(class = "panel-heading", role = "tab", id = paste0("heading_", id),
      tags$h4(class = "panel-title",
        tags$a("data-toggle" = "collapse", href = paste0("#", id), title)
      )
    ),
    tags$div(id = id, class = "panel-collapse collapse", role = "tabpanel",
      tags$div(class = "panel-body", content)         
    )
  )
  
}

updateCollapse <- function(session, id, open = NULL, close = NULL, type = NULL) {
  
  data <- dropNulls(list(open = open, close = close, type = type))
  session$sendInputMessage(id, data)
  
}