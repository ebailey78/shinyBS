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