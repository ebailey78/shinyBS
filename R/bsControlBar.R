bsControlBar <- function(inputId, ..., brand, rightItems, fixed=FALSE, inverse=FALSE) {
  
  leftItems <- list(...)
  
  # Build the navbar div and add appropriate classes
  cb <- tags$div(class = "navbar sbs-controlbar")
  if(fixed) cb <- addClass(cb, "navbar-static-top")
  if(inverse) cb <- addClass(cb, "navbar-inverse")
  
  # Create inner navbar div seperately - easier to manipulate
  cbi <- tags$div(class = "navbar-inner")
  if(!missing(brand)) cbi <- tagAppendChild(cbi, tags$a(class = "brand", href = "#", brand))
  if(length(leftItems) > 0)
    cbi <- tagAppendChild(cbi, tagAppendChildren(tags$ul(class="nav pull-left"),
                                                 list = leftItems))
  if(!missing(rightItems))
    cbi <- tagAppendChild(cbi, tagAppendChildren(tags$ul(class="nav pull-right"),
                                                 list = rightItems))
  
  sbsHead(tagAppendChild(cb, cbi), 
          js = list("sbs/shinyBS.js", "sbs/controlbar.js"),
          css = list("shared/font-awesome/css/font-awesome.min.css", 
                       "sbs/controlbar.css", 
                       "sbs/shinyBS.css"))
  
}

bsControlMenu <- function(inputId, label, ..., icon, caret = FALSE) {
  
  menuItems <- list(...)
  
  #If label isn't already a shiny tag make it HTML
  if(missing(label)) label = ""
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  if(!missing(icon)) {
    if(substr(icon, 1, 3) != "fa-") 
      icon <- paste0("fa-", icon)  
    label <- tagList(tags$i(class = paste("fa fa-fw", icon)), label)
  }
  
  # Start the dropdown HTML
  dd <- tags$li(id = inputId, class = "dropdown sbs-control-menu",
                tags$a(href="#", class = "dropdown-toggle", 
                       "data-toggle" = "dropdown", label))
  
  if(caret)
    dd$children[[1]] <- tagAppendChild(dd$children[[1]], 
                                       tags$b(class = "caret"))
  
  ddm <- tagAppendChildren(tags$ul(class = "dropdown-menu"), 
                           list = menuItems)
  
  return(tagAppendChild(dd, ddm))
  
}

bsControlSubMenu <- function(inputId, label, ..., icon = "none", radio = FALSE) {
  
  items <- list(...)
  csm <- bsControlLink(inputId, label, icon)
  
  csm <- removeClass(csm, "control-item")
  csm <- addClass(csm, "dropdown-submenu control-group")
  csm <- removeAttribs(csm, "data-tog")
  
  if(radio) {
    for(i in seq(length(items))) {
      if(hasAttribs(items[[i]], "data-tog")) {
        if(items[[i]]$attribs["data-tog"] == TRUE)
          items[[i]]$attribs["data-tog"] = "radio"
      }
    }
  }
  
  sm <- tagAppendChildren(tags$ul(class = "dropdown-menu"), list = items)
  
  tagAppendChild(csm, sm)
  
}

bsControlLink <- function(inputId, label, icon, toggle = FALSE, active = FALSE, disabled = FALSE) {
  
  if(active) toggle = TRUE
  
  #If label isn't already a shiny tag make it HTML
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  cia <- (tags$a(href = "#"))
  
  ico <- tags$i(class = "fa fa-fw left-icon")
  if(toggle) {
    if(active) {
      ico <- addClass(ico, "fa-check-square-o")
    } else {
      ico <- addClass(ico, "fa-square-o")
    }
  } else if(!missing(icon)) {
    if(substr(icon, 1, 3) != "fa-") {
      icon <- paste0("fa-", icon)  
    }
    ico <- addClass(ico, icon)
  }

  cia <- tagAppendChildren(cia, ico, label)
  
  li <- tags$li(id = inputId, class = "sbs-control control-item", cia)
  
  if(disabled) li <- addClass(li, "disabled")
  if(toggle) li <- addAttribs(li, "data-sbs-toggle" = TRUE)
  
  return(li)
  
}

bsControlDivider <- function() {
  tags$li(class = "divider")
}

bsControlHeader <- function(label) {
  tags$li(class = "nav-header", label)
}