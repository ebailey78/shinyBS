bsCollapse <- function(..., id = NULL, multiple = FALSE, open = NULL) {

  if(is.null(id)) id = paste0("accordion", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  panels <- tagList(...)
      
  sbsHead(tags$div(class="accordion", id = id, "data-multiple" = multiple, "data-open" = open, panels))
  
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
  
  data <- shiny:::dropNulls(list(open = open, close = close, multiple = multiple))
  session$sendInputMessage(id, data)
  
}