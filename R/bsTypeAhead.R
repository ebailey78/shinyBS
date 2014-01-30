bsTypeAhead <- function(inputId, label, value = "", choices, items=8, minLength=1) {
  
  choices <- paste0("[\"", paste0(choices, collapse="\", \"") , "\"]")
  
  tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
                              tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tagList(tags$label(label, `for` = inputId), tags$input(id = inputId, type="text", class="shiny-typeahead",
                                                                 "data-provide"="typeahead", "data-source"=choices,
                                                                 "data-items"=items, "data-minLength"=minLength, autocomplete="off"
                                                                 value = value))
  )
  
}

bsNavTypeAhead <- function(inputId, label, value = "", choices, items=8, minLength=1) {
  
  choices <- paste0("[\"", paste0(choices, collapse="\", \"") , "\"]")

  tags$li(tags$form(class="navbar-form", tags$input(id = inputId, type="text", class="shiny-typeahead",
                     "data-provide"="typeahead", "data-source"=choices,
                     "data-items"=items, "data-minLength"=1, autocomplete="off",
                     placeholder=label, value = value)))
  
}

updateTypeAhead <- function(session, inputId, label=NULL, value=NULL, choices=NULL) {
  
  data <- shiny:::dropNulls(list(label=label, value=value, choices=choices))
 
  session$sendInputMessage(inputId, data)
  
}