# These all work more or less but need more polish before release.

# I am commenting this out because I want to concentrate on getting an initial release done.

# bsCarousel <- function(..., inputId, interval = 5000) {
#   
#   cg <- tagList(...)
#   cg[[1]]$attribs$class = paste(cg[[1]]$attribs$class, "active")
# 
#   ci <- lapply(seq(length(cg)), function(i) {
#     class=""
#     if(i == 1) class="active"
#     
#     tags$li("data-target" = paste0("#", inputId), "data-slide-to"= i-1, class=class)
#     
#   })
#   
#   ci <- tagList(ci)
#   
#   tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
#                               tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
#           tags$div(id = inputId, class = "carousel slide", "data-interval" = interval,
#                    tags$ol(class="carousel-indicators",
#                            ci),
#                    tags$div(class="carousel-inner",
#                             cg),
#                    tags$a(class="carousel-control left", href=paste0("#", inputId), "data-slide"="prev", HTML("&lsaquo;")),
#                    tags$a(class="carousel-control right", href=paste0("#", inputId), "data-slide"="next", HTML("&rsaquo;"))
#                    )
#   )
#   
# }
# 
# bsCarouselSlide <- function(inputId, content, caption = FALSE) {
#   
#   op <- tags$div(class = "item", tags$div(content, style="margin-left: 75px; margin-right: 75px;"))
# 
#   suppressWarnings(if(caption != FALSE) {
#     cap <- tags$div(class="carousel-caption", style="position: static", if(length(caption) == 1) {
#       tags$p(caption)
#       } else {
#       tagList(tags$h4(caption[1]), tags$p(caption[2]))
#       })
#       op$children <- tagList(op$children, cap)
#   })
# 
#   return(op)
#   
# }

## I am commenting this out for now because I want to concentrate on getting an initial release done.

# bsCollapse <- function(..., inputId, autocollapse=TRUE) {
#   
#   ag <- tagList(...)
#   
#   for(i in seq(length(ag))) {
#     if(ag[[i]]$attribs$class != "accordion-group") stop("bsCollapse may only contain bsCollapsePanel objects.")
#     if(autocollapse) ag[[i]]$children[[1]]$children[[1]]$attribs = c(ag[[i]]$children[[1]]$children[[1]]$attribs, "data-parent" = paste0("#", inputId))
#   }
#   
#   tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
#                               tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
#                     tags$div(class="accordion", id = inputId,
#                              ag)
#   )
#   
# }
# 
# bsCollapsePanel <- function(inputId, title, contents, open=FALSE) {
# 
#   if(!inherits(title, "shiny.tag")) title <- HTML(title)
#   if(!inherits(contents, "shiny.tag")) contents <- HTML(contents)
#   
#   class = "accordion-body collapse"
#   if(open) class = paste(class, "in")
#   
#   tags$div(class="accordion-group",
#            tags$div(class="accordion-heading",
#                     tags$a(class="accordion-toggle", "data-toggle"="collapse", href=paste0("#", inputId), title)
#                     ),
#            tags$div(class=class, id=inputId,
#                     tags$div(class="accordion-inner",
#                              contents
#                              )
#                     )
#            )
#   
# }

# I'm commenting this out for now so that I can concentration on an initial release.

# bsModal <- function(inputId, trigger, title, content) {
#   
#   tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
#                               tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
#           tags$div(id = inputId, class="modal hide fade",
#                    tags$div(class="modal-header",
#                             tags$button(type="button", class="close", "data-dismiss"="modal", "aria-hidden"="true", HTML("&times;")),
#                             tags$h4(title)),
#                    tags$div(class="modal-body", HTML(content)),
#                    tags$div(class="modal-footer", tags$a(href="#", "data-dismiss"="modal", "aria-hidden"="true", class="btn btn-primary", "Close"))
#           ),
#           tags$script(paste0("addModal('", trigger, "', '", inputId, "');"))
#   )
#   
# }
