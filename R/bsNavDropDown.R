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