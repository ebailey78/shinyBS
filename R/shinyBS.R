#' Twitter Bootstrap Components for Shiny
#' 
#' shinyBS makes available many of the the components that are part of Twitter 
#' Bootstap but aren't included in Shiny.
#' 
#' Most components have update functions that allow you to modify the elements
#' from server.R. All functions are completely documented and
#' \code{\link{bsDemo}} offers live, interactive examples of all components.
#' 
#' shinyBS allows for the creation of many different Twitter Bootstrap elements.
#' For example, you can create tooltips and popovers to convey extra information
#' about elements of your app. Alerts let you share information with your users 
#' about what is happening in the background or problems that may exist.
#' 
#' shinyBS's menu functions allow for the creation of menus based on Twitter 
#' Bootstrap's navbar, or context-sensitive popup menus that appear when the 
#' user right-clicks on a targeted element. These menus can contain command 
#' links that act like action buttons, toggle links that act like checkbox 
#' inputs, or radio links that act like radio buttons.
#' 
#' I've created a website for shinyBS at 
#' \url{http://ebailey78.github.io/shinyBS} that (will have/has) examples and 
#' references for all functions in the package as well as instructions for 
#' installing and getting more help.
#' 
#' @name shinyBS-package
#' @aliases shinyBS
#' @docType package
#' @import shiny
NULL

.onAttach <- function(...) {
  
  # Create link to javascript and css files for package
  shiny::addResourcePath("sbs", system.file("www", package="shinyBS"))
  
}

# Wrapper to add the appropriate singletons to the head of the shiny app
sbsHead <- function(..., js = list("sbs/shinyMenu.js", "sbs/shinyBS.js"), css = list("sbs/shinyMenu.css", "sbs/shinyBS.css", "shared/font-awesome/css/font-awesome.min.css")) {
  
  js.tags <- tagList(lapply(js, function(j) singleton(tags$script(src = j))))
  css.tags <- tagList(lapply(css, function(i) singleton(tags$link(rel = "stylesheet", 
                                                                  type = "text/css", 
                                                                  href = i))))
  
  tagList(singleton(tags$head(js.tags, css.tags)),
          ...
  )
  
}

# Copy of dropNulls function for shiny to avoid using shiny:::dropNulls
dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}

# Takes a tag and removes any classes in the remove argument
tagRemoveClass <- function(tag, remove) {
  
  if(length(remove) == 1) remove <- strsplit(remove, " ", fixed = TRUE)[[1]]
  
  class <- strsplit(tag$attribs$class, " ", fixed = TRUE)[[1]]
  class <- class[!(class %in% remove)]
  tag$attribs$class <- paste(class, collapse = " ")
  
  return(tag)
  
}

tagAddClass <- function(tag, add) {
  tag$attribs$class <- paste(tag$attribs$class, add)
  return(tag)
}

tagHasClass <- function(tag, class) {
  cl <- unlist(strsplit(tag$attribs$class, " "))
  class %in% cl
}


tagAddAttribs <- function(tag, ...) {
  a <- list(...)
  for(i in seq(length(a))) {
    tag$attribs[names(a)[i]] = a[[i]]
  }
  return(tag)
}

tagRemoveAttribs <- function(tag, ...) {
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
