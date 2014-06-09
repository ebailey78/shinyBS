bsMenuItem <- function(inputId, label, type = "command", value = NULL, icon = NULL, 
                       disabled = FALSE, checked = FALSE, group = NULL) {
  
  if(is.null(group) & type == "radio") stop("Radio menu items must include a group name.")
  
  if(missing(inputId)) inputId <- paste0("menuitem", as.integer(runif(1, 1, 1000000)))
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  i <- tags$i(class = "fa fa-fw left-icon")
  
  itemClass <- "sbs-menu-item"
  
  if(type == "radio") {
    itemClass <- paste(itemClass, "sbs-menu-radio")
    if(checked) {
      icon <- "fa-dot-circle-o"
      itemClass <- paste(itemClass, "sbs-menu-checked")
    } else {
      icon <- "fa-circle-o"
    }
  } else if(type == "checkbox") {
    itemClass <- paste(itemClass, "sbs-menu-checkbox")
    if(checked) {
      icon <- "fa-check-square-o"
      itemClass <- paste(itemClass, "sbs-menu-checked")
    } else {
      icon <- "fa-square-o"
    }
  } else {
    itemClass <- "sbs-menu-item sbs-menu-command"
  }
  
  if(!is.null(icon)) {
    if(!is.null(icon)) {
      # Prepends 'fa-' to the icon name, if it isn't already there.
      if(substr(icon, 1, 3) != "fa-") {
        icon <- paste0("fa-", icon)  
      }
      i <- tagAddClass(i, icon)
    }
  }
  
  item <- tags$li(id = inputId, class = itemClass, tags$a(href = "#", i, label))
  
  if(!is.null(value)) item <- tagAddAttribs(item, "data-menu-value" = value)
  
  if(disabled) item <- tagAddClass(item, "disabled")
  
  if(!is.null(group) & (type == "radio" | type == "checkbox")) {
    item <- tagAddAttribs(item, "data-group" = group)
    item <- tagList(shinyMenuGroup(group), item)
  }
  
  return(item)
  
}