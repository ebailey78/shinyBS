#This isn't used by the user, only used as an anchor for group ids.
bsMenuGroupTag <- function(groupId) {
  singleton(tags$span(id = groupId, class = "sbs-menu-group"))
}

#'@export
bsMenuGroup <- function(groupId, groupType = "radio", itemIds, labels, values, 
                        disabled = FALSE, checked = NULL) {
  
  l <- length(itemIds)
  if(l == 1) {
    itemIds <- paste(itemIds, seq(length(labels)))
  } else if(l != length(labels)) {
    stop("There must be the same number of itemIds as labels")
  } else if(length(unique(itemIds)) != l) {
    stop("Each itemId must be unique.")
  }
  l <- length(itemIds)  
  
  if(missing(values)) {
    values <- rep(NULL, l)
  } else if(length(values) != l) {
    stop("If values is provided, it must be the same length as other inputs.")
  }
  
  if(length(disabled) == 1) {
    disabled = rep(disabled, l)
  } else if(length(disabled) != l) {
    stop("If disabled is provided, it must be a single value or a vector the same length as other inputs.")
  }
  
  if(groupType != "radio" & groupType != "checkbox") {
    groupType = "checkbox"
    warning("Unrecognized groupType, using checkbox")
  }
  
  if(!missing(checked)) {
    if(!(checked %in% itemIds)) {
      warning("checked value not found in list of inputIds")
      checked = NULL
    }
  }
  
  tl <- lapply(seq(length(itemIds)), function(i) {
    
    x <- paste0("bsMenuItem(inputId =  itemIds[i], label = labels[i], type = groupType, value = values[i], group = groupId")
    if(itemIds[i] %in% checked) x <- paste0(x, ", checked = TRUE")
    x <- paste0(x, ", disabled = ", disabled[i])
    x <- paste0(x, ")")
    return(eval(parse(text = x)))    
    
  })
  
  return(tagList(tl))
  
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
pageWithMenuBar <- function(title = "", navbar, ...) {
  
  basicPage(tags$head(tags$title(title)),
            navbar,
            ...)
  
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
