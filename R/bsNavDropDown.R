bsNavDropDown <- function(inputId, label, choices, selected = "") {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  choices <- lapply(choices, function(choice) tags$li(tags$a(tabindex="-1", href="#", HTML(choice))))
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$li(id=inputId, class="dropdown shiny-dropdown", "data-value"=selected,
                  tags$a(href="#", class="dropdown-toggle", "data-toggle"="dropdown", label, tags$b(class="caret")),
                  tags$ul(class = "dropdown-menu",
                          choices
                  )
          )
  )
  
}

updateBSNavDropDown <- function(session, inputId, label=NULL, choices=NULL, selected=NULL) {
  
  choices <- shiny:::choicesWithNames(choices)
  if (!is.null(selected)) 
    selected <- shiny:::validateSelected(selected, choices, inputId)
  options <- if (length(choices)) 
    mapply(choices, names(choices), SIMPLIFY = FALSE, USE.NAMES = FALSE, 
           FUN = function(value, name) {
             list(value = value, label = name)
           })
  message <- shiny:::dropNulls(list(label = label, options = options, 
                            value = selected))
  session$sendInputMessage(inputId, message)
  
}