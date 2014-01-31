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