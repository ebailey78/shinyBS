#This isn't used by the user, only used as an anchor for group ids.
bsMenuGroup <- function(groupId) {
  singleton(tags$span(id = groupId, class = "sbs-menu-group"))
}

#'@export
updateMenuGroup <- function(session, groupId, value = NULL) {
  if(!is.null(value)) {
    session$sendInputMessage(groupId, list(value = value))
  }
}

#'@rdname MenuItems
#'@export
bsMenuDivider <- function() {
  tags$li(class = "divider sbs-menu-divider")
}
#'@rdname MenuItems
#'@export
bsMenuHeader <- function(label) {
  tags$li(class = "nav-header sbs-menu-header", label)
}

#'@export
bsMenuItemGroup <- function(groupId, ..., group = FALSE) {
  # I am fairly certain that there is a *MUCH* better way of doing what this
  # function does. If anyone reading this wants to help me out would be great...
  # I am just happy that I got it to work at all...
  parent <- parent.frame()
  
  obs <- function(groupId, item, grp, group) {
    x <- "observe({\n"
    x <- paste0(x, "grp <- ", deparse(grp), "\n")
    x <- paste0(x, "val <- input$", item, "\n")
    x <- paste0(x, "for(j in grp) {\n")
    x <- paste0(x, "if(j != '", item, "') {\n")
    if(group) {
      x <- paste0(x, "updateMenuGroup(session, j, val)\n")
    } else {
      x <- paste0(x, "updateMenuItem(session, j, checked = val)\n")
    }
    x <- paste0(x, "}\n")
    x <- paste0(x, "}\n")
    x <- paste0(x, "isolate(menuGroups$", groupId, " <- val)\n")
    x <- paste0(x, "})")
    return(x)
  }
  
  if(!exists("menuGroups")) {
    eval(parse(text = "menuGroups <- reactiveValues()"), envir = parent)
  } else {
    if(!is.reactivevalues(menuGroups)) {
      stop("menuGroups is a reserved word in shinyBS. Please rename your variable.")
    }
  }
  
  grpItems <- list(...)
  
  for(i in grpItems) {
    eval(parse(text = obs(groupId, i, grpItems, group)), envir = parent)
  }
  
}
