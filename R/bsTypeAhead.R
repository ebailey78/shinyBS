# Create a typeahead text input
bsTypeAhead <- function(inputId, label, value = "", choices, items=8, minLength=1) {
  
  choices <- paste0("[\"", paste0(choices, collapse="\", \"") , "\"]")
  
  sbsHead(tagList(tags$label(label, `for` = inputId), 
                  tags$input(id = inputId, type="text", class="shiny-typeahead", 
                             "data-provide"="typeahead", "data-source"=choices,
                             "data-items"=items, "data-minLength"=minLength, autocomplete="off",
                             value = value)
                  )
          )
  
}

# Same as bsTypeAhead but with label as placeholder and optional width argument to save space.
bsNavTypeAhead <- function(inputId, label, value = "", choices, items=8, minLength=1, width = NULL) {
  
  choices <- paste0("[\"", paste0(choices, collapse="\", \"") , "\"]")
  
  style = ""
  if(!is.null(width)) style = paste0("width: ", width, "px;")
  
  
  tags$li(tags$form(class="navbar-form", tags$input(id = inputId, type="text", class="shiny-typeahead",
                     "data-provide"="typeahead", "data-source"=choices, style=style,
                     "data-items"=items, "data-minLength"=1, autocomplete="off",
                     placeholder=label, value = value)))
  
}

# Update a typeahead element from server.R
updateTypeAhead <- function(session, inputId, label=NULL, value=NULL, choices=NULL) {
  
  data <- shiny:::dropNulls(list(label=label, value=value, choices=choices))
 
  session$sendInputMessage(inputId, data)
  
}