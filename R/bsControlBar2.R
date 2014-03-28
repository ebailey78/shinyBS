# # Creates the shell of a controlbar that can have elements added to it.
# bsControlBar <- function(inputId, ..., brand, rightItems, fixed=FALSE, inverse=FALSE) {
#   
#   leftItems <- list(...)
#   
#   cb <- tags$div(id = inputId, class = "navbar sbs-control-bar",
#                  tags$div(class = "navbar-inner")
#                  )
#   
#   if(inverse) cb <- addClass(cb, "navbar-inverse")
#   if(fixed)  cb <- addClass(cb, "navbar-fixed-top")
#   
#   if(!missing(brand)) {
#     cb$children[[1]] <- tagAppendChild(cb$children[[1]], 
#                                       tags$a(class = "brand", href = "#", brand)
#                                       )
#   }
#   
#   if(length(leftItems) > 0) {
#     cb$children[[1]] <- tagAppendChild(cb$children[[1]],
#                                       tags$ul(class="nav pull-left", leftItems)
#                                       )
#   }
#   
#   if(!missing(rightItems)) {
#     cb$children[[1]] <- tagAppendChild(cb$children[[1]],
#                                       tags$ul(class="nav pull-right", rightItems)
#                                       )
#   }
# 
#   sbsHead(cb)
#   
# }
# 
# bsControlMenu <- function(inputId, label, ..., caret = FALSE, radio = FALSE) {
#   
#   menuItems <- list(...)
#   
#   #If label isn't already a shiny tag make it HTML
#   if(!inherits(label, "shiny.tag")) label <- HTML(label)
#   
#   # Start the dropdown HTML
#   dd <- tags$li(id = inputId, class = "dropdown sbs-control control-menu",
#                 tags$a(href="#", class = "dropdown-toggle", "data-toggle" = "dropdown", label))
#   
#   if(caret) 
#     dd$children[[1]] <- tagAppendChild(dd$children[[1]], tags$b(class = "caret"))
#   
#   ddm <- tagAppendChildren(tags$ul(class = "dropdown-menu"), list = menuItems)
#   
#   return(tagAppendChild(dd, ddm))
#   
# }
# 
# bsControlSubMenu <- function(inputId, label, ..., icon = "none", radio = FALSE) {
#   
#   csm <- bsControlLink(inputId, label, icon)
#   
#   csm <- removeClass(csm, "sbs-control-item")
#   csm <- addClass(csm, "dropdown-submenu sbs-control control-menu")
#   csm <- removeAttribs(csm, "data-tog")
#   csm <- addAttribs(csm, "data-radio" = radio)
#   
#   sm <- tagAppendChildren(tags$ul(class = "dropdown-menu"), list = list(...))
# 
#   tagAppendChild(csm, sm)
#   
# }
# 
# bsControlLink <- function(inputId, label, icon = "none", toggle = FALSE, active = FALSE) {
#   
#   #If label isn't already a shiny tag make it HTML
#   if(!inherits(label, "shiny.tag")) label <- HTML(label)
#   
#   cia <- (tags$a(href = "#"))
#   
#   ico <- tags$i(class = paste0("icon-", icon))
#   if(toggle & active) ico <- addClass(ico, "icon-ok")
#   
#   cia <- tagAppendChild(cia, tags$span(ico, label))  
#   
#   return(tags$li(id = inputId, class = "sbs-control-item", "data-tog" = toggle, cia))
#   
# }
# 
# bsControlDivider <- function() {
#   tags$li(class = "divider")
# }
# 
# bsControlHeader <- function(label) {
#   tags$li(class = "nav-header", label)
# }
# 
# bsControlInput <- function(inputId, inputEl, icon = "none") {
#   
#   if(class(inputEl) == "shiny.tag.list") {
#     ip <- inputEl[[2]]
#     il <- inputEl[[1]][[3]]
#   }
#   
#   x <- bsControlSubMenu(inputId, il, icon = icon, radio = FALSE, ip)
#   x <- addClass(x, "dropdown-input")
#   
#   return(x)
# }