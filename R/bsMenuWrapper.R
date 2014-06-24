#'@rdname menuBarInputs
#'@name Menu Bar Inputs
#'@title Custom inputs for shinyBS menu bars
#'@description Function to create specially formatted inputs for shinyBS menu 
#'  bars
#'  
#'@param input An input object
#'@param width The width of a text-based input, in characters
#'@param form Logical indicating whether the input should be wrapped in a form 
#'  tag (See Details)
#'@param icon A \href{http://fortawesome.github.io/Font-Awesome/}{Font Awesome} 
#'  icon to attach to the input
#'@param placement Where to place the icon, either 'before' or 'after'
#'@param inputId An Id for the menu item
#'@param label Label for menu item (appears as tooltip)
#'@param href If provided, bsMenuLink will act as a regular html link to the
#'  provided address
#'@param value The value to assign to the toggle link, TRUE or FALSE
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'  
#'@details Use \code{bsMenuWrap} to format standard shiny inputs to fit 
#'  better within a menu bar. Only works for text-based inputs (e.g. 
#'  \code{textInput}, \code{dateInput}, \code{numericInput}, etc.) and buttons. 
#'  \cr\cr These functions remove the normal label from the input and 
#'  make it a placeholder within the input. In addition, if an icon is included,
#'  a tooltip with the label is attached to the icon on hover.\cr\cr Some inputs
#'  look better when wrapped in a \code{form} tag. if \code{form} isn't 
#'  specified, \code{bsMenuWrap} attempts to determine if the input should be 
#'  wrapped in a \code{form}. If an input is not rendering correctly try setting
#'  \code{form} to \code{TRUE} or \code{FALSE}. Even if this fixes it, please 
#'  file a bug report or send me an email so I fix the problem for others.
#'@note Run \code{bsDemo("menubar")} for a live examples of shinyBS menubar 
#'  functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/components.html}{Components of
#'  Twitter Bootstrap 2.3.2}
#'@references \href{http://getbootstrap.com/2.3.2/base-css.html}{Base CSS for 
#'  Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo("menubar") for examples
#'@export
bsMenuWrap <- function(input, width = 10, form = "auto", icon, placement = "before") {
  
  parts <- inputParser(input)
  class <- "sbs-menu-wrap"
  if(!is.null(parts$class)) class <- paste(class, parts$class)  
  
  if(form == "auto") {
    if(inherits(parts$body, "list") || parts$body$name != "button") {
      form = TRUE
    } else {
      form = FALSE
    }
  }
  
  for(i in seq(length(parts$body))) {
    if(parts$body[[i]]$name == "input") {
      if(!is.null(parts$label)) parts$body[[i]] <- tagAddAttribs(parts$body[[i]], placeholder = parts$label)
      if(!is.null(width)) parts$body[[i]] <- tagAddAttribs(parts$body[[i]], size = width)
    }
  }
  
  if(!missing(icon)) {
    if(substr(icon, 1, 3) != "fa-") icon <- paste0("fa-", icon)
    icon_id <- paste0("icon_", as.integer(runif(1,1,100000)))
    i <- tags$i(id = icon_id, class = paste("fa add-on", icon))
    if(placement == "before") {
      class <- paste(class, "input-prepend")
      parts$body <- tagList(i, parts$body)
    } else {
      class <- paste(class, "input-append")
      parts$body <- tagList(parts$body, i)
    }
    
  } 
  
  wrap <- tags$li(class = class)
  if(!is.null(parts$id)) wrap <- tagAddAttribs(wrap, id = parts$id)
  if(form) {
    wrap <- tagAppendChild(wrap, tags$form(class = "navbar-form", parts$body))
  } else {
    wrap <- tagAppendChild(wrap, parts$body)
  }
  
  if(!is.null(parts$head)) wrap <- tagList(parts$head, wrap)
  if(!is.null(parts$depends)) attr(wrap, "html_dependencies") <- parts$depends
  
  if(!missing(icon)) {
    label <- bsTooltip(icon_id, parts$label)
    wrap <- tagList(wrap, label)
  }
  
  return(wrap)
  
}

# Recursively searches through an input tag and pulls out the important bits.
inputParser <- function(input, parts = list(head = NULL, label = NULL, 
                                            body = NULL, class = NULL,
                                            depends = NULL, id = NULL)) {
  
  if(inherits(input, "list")) {
    for(l in input) {
      parts <- inputParser(l, parts)
    }
  } else {
    
    if("html_dependencies" %in% names(attributes(input))) {
      parts$depends <- attributes(input)$html_dependencies
    }
    
    if(input$name == "head") {
      parts$head <- input
    } else if(input$name == "label") {
      parts$label <- input$children[[1]]
    } else if(input$name == "input" || input$name == "button") {
      parts$body <- tagList(input)
    } else if(input$children[[1]]$name == "label") {
      parts$label <- input$children[[1]]$children[[1]]
      parts$body <- tagList(input$children[[seq(2, length(input$children))]])
      parts$class <- input$attribs$class
      parts$id <- input$attribs$id
    }
  }
  
  return(parts)
  
}