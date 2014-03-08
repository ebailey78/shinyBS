bsCollapse <- function(..., id = NULL, multiple = FALSE, open = NULL) {

  if(is.null(id)) id = paste0("accordion", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  if(!multiple & length(open) > 1) {
    open <- open[1]
  }
  
  panels <- list(...)
  for(i in seq(length(panels))) {
    if(panels[[i]]$children[[2]]$attribs$id %in% open) {
      panels[[i]]$children[[2]]$attribs$class <- paste(panels[[i]]$children[[2]]$attribs$class, "in")
    }
  }

  sbsHead(tags$div(class="accordion", id = id, "data-multiple" = multiple, panels))
  
}

bsCollapsePanel <- function(title, ..., id = NULL, value = NULL) {
  
  content <- list(...)
  
  if(is.null(id)) id <- paste0("cpanel", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  if(is.null(value)) {
      value = title
  }
  
  tags$div(class = "accordion-group",
           tags$div(class = "accordion-heading",
                    tags$a(class = "accordion-toggle", 'data-toggle' = "collapse", href = paste0("#", id), title)
                    ),
           tags$div(class = "accordion-body collapse", id = id, "data-value" = value,
                    tags$div(class = "accordion-inner", content)
                    )
           )
  
  
  
}

updateCollapse <- function(session, id, open = NULL, close = NULL, multiple = NULL) {
  
  data <- dropNulls(list(open = open, close = close, multiple = multiple))
  session$sendInputMessage(id, data)
  
}