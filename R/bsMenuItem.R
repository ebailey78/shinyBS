#'@rdname MenuItems
#'@name Menu Items
#'@title Menu Items for shinyBS menus
#'  
#'@description Functions for creating and manipulating shinyBS menu items
#'  
#'@param inputId the id of the menu item being created
#'@param label Text that will appear on the menu item
#'@param type String indicating the type of menu item (See Details)
#'@param value The value to assign to the menu item
#'@param icon An optional Font Awesome icon for the menu item
#'@param disabled Logical indicating whether the menu item should be disabled
#'@param checked Logical indicating whether the menu item should be checked
#'@param group A groupId to assign the menu item to
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'  
#'@details Menu items can take on three different forms, depending the to value 
#'  of \code{type}. \code{command} results in a menu item that acts like an 
#'  action button. \code{checkbox} results in a menu item that can be toggled 
#'  on/off like a checkbox input. \code{radio} results in a menu item is linked 
#'  to other menu items that share its \code{group} value and acts like a radio 
#'  input.\cr\cr If \code{type = 'radio'} then a \code{group} must be provided. 
#'  An error will result if a group isn't provided. \code{group} is optional for
#'  \code{type = "checkbox"} and will have no effect if \code{type = "command"}.
#'@return For \code{type = "command"} a integer is incremented and returned each
#'  time the menu item is clicked. \cr\cr For \code{type = "radio"} and 
#'  \code{type = "checkbox"} TRUE or FALSE is returned depending on whether the 
#'  menu item is currently active. \cr\cr When \code{type = "radio"} or when 
#'  \code{type = "checkbox"} and \code{group != NULL}, an additional 
#'  \code{bsMenuGroup} input is created with an \code{id} equal to the group 
#'  value. This input can be accessed from the server script like any other ui 
#'  input. For radio group the \code{value} of the currently active radio input 
#'  will be returned, if available, if not the id of the radio input will be 
#'  returned. For checkbox groups, a vector of values or ids of currently active
#'  checkbox items in the group will be returned. Since \code{group} is used to 
#'  name a new input, care should be taken to not use a value that will conflict
#'  with other input names.
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/components.html}{Components of
#'  Twitter Bootstrap 2.3.2}
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript 
#'  for Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsMenuItem <- function(inputId, label, type = "command", value = NULL, icon = NULL, 
                       disabled = FALSE, checked = FALSE, group = NULL) {
  
  # A couple of checks to make sure menu item will render correctly
  if(is.null(group) & type == "radio") stop("Radio menu items must include a group name.")
  if(type %in% c("radio", "command", "checkbox") == FALSE) stop("type must be equal to 'radio', 'checkbox', or 'command'.")
  
  # So jQuery will recognize the boolean
  checked <- tolower(as.character(checked))
  
  # If label isn't a shiny tag, convert to HTML...
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  # ... and wrap the result in a span so it can be updated if necessary
  label <- tags$span(class="sbs-menu-label", label)
  
  # Build the left icon
  i <- tags$i(class = "fa fa-fw left-icon")
  if(type == "radio") {
    if(checked) {
      icon <- "fa-dot-circle-o"
    } else {
      icon <- "fa-circle-o"
    }
  } else if(type == "checkbox") {
    if(checked) {
      icon <- "fa-check-square-o"
    } else {
      icon <- "fa-square-o"
    }
  }
  if(!is.null(icon)) {
    # Prepends 'fa-' to the icon name, if it isn't already there.
    if(substr(icon, 1, 3) != "fa-") {
      icon <- paste0("fa-", icon)  
    }
    i <- tagAddClass(i, icon)
  }
  
  item <- tags$li(id = inputId, class = "sbs-menu-item", "data-menu-type" = type, tags$a(href = "#", i, label))
  
  if(type != "command") item <- tagAddAttribs(item, "data-menu-checked" = checked)
  if(!is.null(value)) item <- tagAddAttribs(item, "data-menu-value" = value)
  
  if(disabled) item <- tagAddClass(item, "disabled")
  
  if(!is.null(group) & (type == "radio" | type == "checkbox")) {
    item <- tagAddAttribs(item, "data-menu-group" = group)
    item <- tagList(bsMenuGroupTag(group), item)
  }
  
  return(item)
  
}

#'@rdname MenuItems
#'@export
updateMenuItem <- function(session, inputId, label = NULL, icon = NULL, 
                           value = NULL, checked = NULL, disabled = NULL) {
  
  if(!is.null(icon))
    if(substr(icon,1,3) != "fa-")
      icon <- paste0("fa-", icon)
  
#  if(!is.null(checked)) checked = tolower(as.character(checked))
  
  data <- dropNulls(list(label = label, icon = icon, value = value, 
                         checked = checked, disabled = disabled))
  session$sendInputMessage(inputId, data)
  
}

#'@rdname MenuItems
#'@export
clickMenuItem <- function(session, inputId) {
  session$sendInputMessage(inputId, list(click = TRUE))
}