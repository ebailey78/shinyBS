#'@rdname menus
#'@name Menus
#'@title Create Twitter Bootstrap-style Menus and dropdowns
#'  
#'@details Function to create a menu based on Twitter Bootstrap styles.
#'  
#'@param menuId An Id for the menu
#'@param \dots Items to add to the menu
#'@param label The label for the menu
#'@param icon An optional Font Awesome icon
#'@param type The type of toolbar to create
#'@param caret Logical indicating whether to include a caret on a toolbar menu
#'@param target Id of a target for the popup menu
#'  
#'@details \code{bsMenu} is the general function for creating menus in shinyBS. 
#'  shinyBS menus can contain command links, toggle links, radio links, 
#'  dividers, and headers. Menus are useful if you need to include a lot of 
#'  functionality within your shiny app but don't want to use up a lot a space 
#'  doing it.
#'  
#'@section Options: A menu can take any of three forms determined by the
#'  \code{type} argument. \code{type = 'toolbar'} is for creating top-level
#'  menus in a \code{\link{bsMenuBar}} object similar to the depreciated 
#'  \code{\link{bsNavToolbar}}.
#'  
#'  \code{type = 'popup'} will create a context menu accessible by 
#'  right-clicking on the element identified by the \code{target} attribute.
#'  
#'  \code{type = 'submenu'} will create submenus within either \code{toolbar} or
#'  \code{popup} menus.
#'  
#'  \code{label} is the label to apply to the menu, it is ignored when
#'  \code{type = 'popup'}.
#'  
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/components.html}{Components of
#'  Twitter Bootstrap 2.3.2}
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript 
#'  for Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsMenu <- function(menuId, ..., label, icon = NULL, type = "toolbar", 
                   caret = TRUE, target = NULL) {
  
  menuItems <- list(...)
  if(missing(menuId)) menuId <- paste0("menu", as.integer(runif(1,1,100000)))
  
  if(is.null(target) & type == "popup") stop("popup menus must have a target")
  
  i <- tags$i(class = "fa fa-fw")
  
  #If label isn't already a shiny tag make it HTML
  if(missing(label)) label = ""
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  # Prepends 'fa-' to the icon name, if it isn't already there.
  if(!is.null(icon)) {
    if(substr(icon, 1, 3) != "fa-") icon <- paste0("fa-", icon)
    i <- tagAddClass(i, icon)
  }
  if(type != "toolbar" | !is.null(icon))
    label <- tagList(tags$i(class = paste("fa fa-fw", icon)), label)
  
  # Start the dropdown HTML
  if(type == "popup") {
    dd <- tags$div(id = menuId, class = "dropdown sbs-menu sbs-menu-popup", "data-target" = target)
  } else {
    dd <- tags$li(id = menuId, class = "sbs-menu sbs-menu-item",
                  tags$a(href="#", class = "dropdown-toggle", 
                         "data-toggle" = "dropdown", label))
  }
  
  dd <- tagAddAttribs(dd, "data-type" = type)
  
  if(type == "toolbar") {
    dd <- tagAddClass(dd, "dropdown")
  } else if(type == "submenu") {
    dd <- tagAddClass(dd, "dropdown-submenu")
  }
  
  if(caret & type == "toolbar")
    dd$children[[1]] <- tagAppendChild(dd$children[[1]], 
                                       tags$b(class = "caret"))
  
  ddm <- tagAppendChildren(tags$ul(class = "dropdown-menu"), 
                           list = menuItems)
  
  return(tagAppendChild(dd, ddm))
  
}