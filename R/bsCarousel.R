#'@export
bsCarousel <- function(id, ..., animate = TRUE, autoSlide = TRUE, 
                       interval = 5000, pause = TRUE) {
  
  carouselDep <- htmltools::htmlDependency("shinyBS", packageVersion("shinyBS"), src = c("href" = "sbs"), stylesheet = "bsCarousel.css")

  slides <- list(...)
  idlink <- paste0("#", id)
  
  active <- FALSE
  indicators <- list()
  
  for(i in seq_along(slides)) {
    
    ind <- tags$li(`data-target` = idlink, `data-slide` = (i-1))
    if(hasClass(slides[[i]], "active")) {
      if(active) {
        slides[[i]] <- removeClass(slides[[i]], "active")
      } else {
        active <- TRUE
        ind <- addClass(ind, "active")
      }
    }
    indicators[[i]] <- ind
  }
  
  if(!active) {
    slides[[1]] <- addClass(slides[[1]], "active")
    indicators[[1]] <- addClass(indicators[[1]], "active")
  }
  
  carousel <- tags$div(id = id, 
           class = "carousel",
           `data-ride` = "carousel",
    tags$ol(class = "carousel-indicators",
      tagList(indicators)        
    ),
    tags$div(class = "carousel-inner",
             role = "listbox", 
      tagList(slides)
    ),
    tags$a(class = "left carousel-control", 
           href = idlink, 
           role = "button", 
           `data-slide`="prev",
      tags$span(class = "glyphicon glyphicon-chevron-left")
    ),
    tags$a(class = "right carousel-control", 
           href = idlink, 
           role = "button", 
           `data-slide`="next",
           tags$span(class = "glyphicon glyphicon-chevron-right")
    )
  ) 
  
  # Turn off the interval if autoslide = FALSE
  if(!autoSlide) interval = "false"
  
  carousel <- tagAppendAttributes(carousel,
                                  `data-interval` = interval,
                                  `data-pause` = checkClass("hover", pause)
                                  )
  carousel <- addClass(carousel, checkClass("slide", animate))
  return(htmltools::attachDependencies(carousel, carouselDep, append = TRUE))
  
}

#'@export
bsCarouselSlide <- function(..., active = FALSE) {
  
  addClass(tags$div(class = "item", ...), checkClass("active", active))
  
}