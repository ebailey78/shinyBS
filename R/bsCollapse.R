bsCollapse <- function(..., id = NULL, multiple = FALSE, open = NULL) {

  if(is.null(id)) id = paste0("accordion", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  panels <- tagList()
      
  for(panel in list(...)) {

    x <- panel$children[[1]]$children[[1]]
    
    if(!multiple) panel$children[[1]]$children[[1]]$attribs["data-parent"] = paste0("#", id)
    
    if(x$attribs["data-value"] %in% open | x$children[[1]] %in% open | panel$children[[2]]$attribs$id %in% open) {
      panel$children[[2]]$attribs$class = paste(panel$children[[2]]$attribs$class, "in")
    }
      
    panels <- tagAppendChild(panels, panel)

  }
  
  if(!is.null(open)) {
    
    
  }
  
  sbsHead(tags$div(class="accordion", id = id, panels))
  
}

bsCollapsePanel <- function(title, ..., id = NULL, value = NULL) {
  
  content <- list(...)
  
  if(is.null(id)) id = paste("collapse", sprintf("%07i", as.integer(stats::runif(1, 1, 1000000))))
  
  tags$div(class = "accordion-group",
           tags$div(class = "accordion-heading",
                    tags$a(class = "accordion-toggle", "data-toggle" = "collapse", "data-value" = value, href = paste0("#", id), title)),
           tags$div(class = "accordion-body collapse", id = id,
                    tags$div(class = "accordion-inner", content)
                    )
           )
  
}