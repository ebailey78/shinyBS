# Creates a dropdown shiny input that returns the value of the last dropdown element clicked
processChoice <- function(choice) {
  
  cname <- names(choice)
  if(is.null(cname)) cname <- ""
  if(cname == "") cname = choice[[1]]

  if(inherits(choice[[1]], "bsmedia")) {
    ddi <- tags$li("data-value" = cname, tags$a(tabindex = "-1", href="#", choice[[1]]))

  } else if(!is.list(choice[[1]])) {
    if(is.na(choice[[1]])) {
      if(is.na(cname)) {
        ddi <- tags$li(class = "divider")
      } else {
        ddi <- tags$li(class = "nav-header", cname)
      }
    } else {  
      ddi <- tags$li("data-value" = choice[[1]], tags$a(tabindex = "-1", href = "#", cname))
    }
  } else {
    ddi <- tags$li(class = "dropdown-submenu",
                    tags$a(tabindex = "-1", href = "#", cname))
    sdd <- tags$ul(class = "dropdown-menu")
    for(i in seq(length(choice[[1]]))) {
      sdd <- tagAppendChild(sdd, processChoice(choice[[1]][i]))
    }
    ddi <- tagAppendChild(ddi, sdd)
    
  }
  
  return(ddi)  
  
}

#'@rdname navbar
#'@export
bsNavDropDown <- function(inputId, label, choices, selected="") {
  
  #If label isn't already a shiny tag make it HTML
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  # Start the dropdown HTML
  dd <- tags$li(id = inputId, class = "dropdown sbs-dropdown", "data-value" = selected,
                tags$a(href="#", class = "dropdown-toggle", "data-toggle" = "dropdown", label, tags$b(class = "caret")))
  
  ddm <- tags$ul(class = "dropdown-menu")
  
  for(i in seq(length(choices))) {
    ddm <- tagAppendChild(ddm, processChoice(choices[i]))
  }
    
  return(tagAppendChild(dd, ddm))
  
}

# Allows updating out navbar dropdowns.
#'@rdname navbar
#'@export
updateDropDown <- function(session, inputId, label=NULL, choices=NULL, selected=NULL) {
  
  if(!is.null(choices)) {
    options <- tags$ul(class = "dropdown-menu")
    for(i in seq(length(choices))) {
      options <- tagAppendChild(options, processChoice(choices[i]))
    }
    options <- as.character(options)
  } else {
    options <- NULL
  }
  
  message <- dropNulls(list(label = label, options = options, 
                            value = selected))
  
  session$sendInputMessage(inputId, message)
  
}