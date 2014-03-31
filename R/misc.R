.onAttach <- function(...) {
  
  # Create link to javascript and css files for package
  addResourcePath("sbs", system.file("www", package="shinyBS"))
  
}

# Wrapper to add the appropriate singletons to the head of the shiny app
sbsHead <- function(..., js = "sbs/shinyBS.js", css = "sbs/shinyBS.css") {
  
  js.tags <- tagList(lapply(js, function(j) tags$script(src = j)))
  css.tags <- tagList(lapply(css, function(i) tags$link(rel = "stylesheet", 
                                                        type = "text/css", 
                                                        href = i)))
  
  tagList(singleton(tags$head(js.tags, css.tags)),
          ...
          )
  
}

# Copy of dropNulls function for shiny to avoid using shiny:::dropNulls
dropNulls <- function(x) {
    x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}

# Takes a tag and removes any classes in the remove argument
removeClass <- function(tag, remove) {
  
  if(length(remove) == 1) remove <- strsplit(remove, " ", fixed = TRUE)[[1]]

  class <- strsplit(tag$attribs$class, " ", fixed = TRUE)[[1]]
  class <- class[!(class %in% remove)]
  tag$attribs$class <- paste(class, collapse = " ")
  
  return(tag)
  
}

addClass <- function(tag, add) {
  tag$attribs$class <- paste(tag$attribs$class, add)
  return(tag)
}

addAttribs <- function(tag, ...) {
  a <- list(...)
  for(i in seq(length(a))) {
    tag$attribs[names(a)[i]] = a[[i]]
  }
  return(tag)
}

removeAttribs <- function(tag, ...) {
  a <- list(...)
  for(i in seq(length(a))) {
    tags$attribs[a[[i]]] = NULL
  }
  return(tag)
}

inputCheck <- function(..., valid, stop.func = FALSE) {
  
  v <- list(...)[1]
  
  if(!(v %in% valid)) {
  
    n <- names(list(...))[1]
    caller <- deparse(sys.call(-1)[1])
    msg <- paste0("Invalid '", n, "' argument in ", caller, ": ", v)
    if(stop.func) {
      stop(msg, call. = FALSE)
    } else {
      warning(msg, call. = FALSE)
    }
    
    return(FALSE)
    
  } else {
    
    return(TRUE)
  
  }
  
}
