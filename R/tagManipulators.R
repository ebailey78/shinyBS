addClass <- function(tag, class) {
  
  if(!is.null(class)) {
    tag$attribs$class <- trimws(paste(tag$attribs$class, class), "both")
  }
  
  tag
  
}

removeClass <- function(tag, class) {
  
  if(!is.null(class) & !is.null(tag$attribs$class)) {
    cls <- strsplit(tag$attribs$class, " ")[[1]]
    cls <- cls[cls != class]
    tag$attribs$class <- paste(cls, collapse = " ")
  }
  
  tag
  
}

hasClass <- function(tag, class) {
  if(!is.null(class) & !is.null(tag$attribs$class)) {
    class %in% strsplit(tag$attribs$class, " ")[[1]]
  } else {
    FALSE
  }
}

checkClass <- function(class, include) {
  if(!include) class <- NULL
  class
}

buildClass <- function(prefix, variable) {
  if(!is.null(variable)) {
    variable <- paste0(prefix, variable)
  }
  variable
}

addStyles <- function(tag, ..., .dots) {
  
  new_styles <- list(...)
  
  if(!missing(.dots)) {
    new_styles <- c(new_styles, .dots)
  }
  
  if(!is.null(tag$attribs$style)) {
    styles <- parseStyles(tag$attribs$style)
  } else {
    styles <- list()
  }
  
  for(i in seq_along(new_styles)) {
    styles[[names(new_styles)[i]]] <- new_styles[[i]]
  }
  
  tag$attribs$style <- writeStyles(styles)
  
  tag
  
}

removeStyles <- function(tag, ...) {
  
  if(!is.null(tag$attribs$style)) {
    styleList <- list(...)
    styles <- parseStyles(tag$attribs$style)
    styles <- styles[!names(styles) %in% styleList]
    tag$attribs$style <- writeStyles(styles)
  }
  
  tag
  
}

parseStyles <- function(styleString) {
  
  styles <- trimws(strsplit(styleString, ";")[[1]])
  styles <- strsplit(styles, ":")
  style_names <- sapply(styles, function(s) trimws(s[1]))
  styles <- lapply(styles, function(s) trimws(s[2]))
  names(styles) <- style_names
  
  return(styles)
  
}

writeStyles <- function(styleList) {
  
  paste(names(styleList), styleList, sep = ": ", collapse = "; ")
  
}
