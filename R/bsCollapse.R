bsCollapse <- function(..., inputId, autocollapse=TRUE) {
  
  ag <- tagList(...)
  
  for(i in seq(length(ag))) {
    if(ag[[i]]$attribs$class != "accordion-group") stop("bsCollapse may only contain bsCollapsePanel objects.")
    if(autocollapse) ag[[i]]$children[[1]]$children[[1]]$attribs = c(ag[[i]]$children[[1]]$children[[1]]$attribs, "data-parent" = paste0("#", inputId))
  }
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
                    tags$div(class="accordion", id = inputId,
                             ag)
  )
  
}

bsCollapsePanel <- function(inputId, title, contents, open=FALSE) {

  if(!inherits(title, "shiny.tag")) title <- HTML(title)
  if(!inherits(contents, "shiny.tag")) contents <- HTML(contents)
  
  class = "accordion-body collapse"
  if(open) class = paste(class, "in")
  
  tags$div(class="accordion-group",
           tags$div(class="accordion-heading",
                    tags$a(class="accordion-toggle", "data-toggle"="collapse", href=paste0("#", inputId), title)
                    ),
           tags$div(class=class, id=inputId,
                    tags$div(class="accordion-inner",
                             contents
                             )
                    )
           )
  
}