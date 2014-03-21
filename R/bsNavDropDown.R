# Creates a dropdown shiny input that returns the value of the last dropdown element clicked
bsNavDropDown <- function(inputId, label, choices, selected="") {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  choices <- lapply(length(choices), function(i) {
    if(nameschoices[i])
      tags$li(tags$a(tabindex="-1", href="#", HTML(choice)))
  )
  
  tags$li(id=inputId, class="dropdown sbs-dropdown", "data-value"=selected,
          tags$a(href="#", class="dropdown-toggle", "data-toggle"="dropdown", label, tags$b(class="caret")),
          tags$ul(class = "dropdown-menu",
                  choices
          )
  )
  
  }

# Allows updating out navbar dropdowns.
updateDropDown <- function(session, inputId, label=NULL, choices=NULL, selected=NULL) {
  
  message <- dropNulls(list(label = label, options = choices, 
                            value = selected))
  
  session$sendInputMessage(inputId, message)
  
}