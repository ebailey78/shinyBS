#This isn't used by the user, only used as an anchor for group ids.
bsMenuGroup <- function(groupId) {
  singleton(tags$span(id = groupId, class = "sbs-menu-group"))
}

#'@export
bsMenuDivider <- function() {
  tags$li(class = "divider sbs-menu-divider")
}
#'@export
bsMenuHeader <- function(label) {
  tags$li(class = "nav-header sbs-menu-header", label)
}


