# Create a link input for a navbar that acts like an actionButton
bsNavLink <- function(inputId, label, href="#") {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  tags$li(tags$a(id = inputId, type="button", href = href, class="action-button", label))
  
}

# Create a link input for a navbar that acts like a checkboxInput
bsNavToggleLink <- function(inputId, label, value=FALSE) {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  class = ""
  if(value) class = "active"
  
  tags$li(class = class, tags$a(id = inputId, href="#", class = "sbs-toggle", label))
  
}

# Update a toggleLink object
updateToggleLink <- function(session, inputId, label=NULL, value=NULL) {
  data <- dropNulls(list(label=label, value = value))
  
  session$sendInputMessage(inputId, data)
  
}

# Create a vertical divider between navbar elements
bsNavDivider <- function() {
  tags$li(class="divider-vertical")
}

# Wraps actionbutton in a li so it works with bsNavBar
bsNavButton <- function(inputId, label) {
  
  tags$li(tags$form(class="navbar-form", actionButton(inputId, label)))
  
}

# Same as textInput but with label and a placeholder and optional width argument to save space
bsNavTextInput <- function(inputId, label, value = "", width=NULL) {
  
  style = ""
  if(!is.null(width)) style = paste0("width: ", width, "px;")
  
  tags$li(tags$form(class="navbar-form", tags$input(id = inputId, style=style, type = "text", value = value, placeholder=label)))
  
}

# dateInput element for navbars
bsNavDateInput <- function(inputId, label, value = NULL, min = NULL,
                           max = NULL, format = "yyyy-mm-dd", startview = "month",
                           weekstart = 0, language = "en", width = NULL) {
  
  if (inherits(value, "Date")) 
    value <- format(value, "%Y-%m-%d")
  if (inherits(min, "Date")) 
    min <- format(min, "%Y-%m-%d")
  if (inherits(max, "Date")) 
    max <- format(max, "%Y-%m-%d")
  
  style = ""
  if(!is.null(width)) style = paste0("width: ", width, "px;")
    
  tagList(singleton(tags$head(tags$script(src = "shared/datepicker/js/bootstrap-datepicker.min.js"), 
                              tags$link(rel = "stylesheet", type = "text/css", href = "shared/datepicker/css/datepicker.css"))), 
          tags$li(tags$form(id = inputId, class = "shiny-date-input navbar-form", tags$input(type = "text", style = style, class = "input-medium datepicker", placeholder = label,
                                                                       `data-date-language` = language, `data-date-weekstart` = weekstart, 
                                                                       `data-date-format` = format, `data-date-start-view` = startview, 
                                                                       `data-min-date` = min, `data-max-date` = max, `data-initial-date` = value)
                            )
                  )
          )
}

# Same as dateRangeInput with slight formatting modification. Would like to figure out how to remove space from between date inputs
bsNavDateRangeInput <- function(inputId, label, start = NULL, end = NULL,
                                min = NULL, max = NULL, format = "yyyy-mm-dd",
                                startview = "month", weekstart = 0, language = "en", width=NULL) {
  
  if (inherits(start, "Date")) 
    start <- format(start, "%Y-%m-%d")
  if (inherits(end, "Date")) 
    end <- format(end, "%Y-%m-%d")
  if (inherits(min, "Date")) 
    min <- format(min, "%Y-%m-%d")
  if (inherits(max, "Date")) 
    max <- format(max, "%Y-%m-%d")
  
  style = ""
  if(!is.null(width)) style = paste0("width: ", width, "px;")
  
  x <- label # Just a placeholder
  
  tagList(singleton(tags$head(tags$script(src = "shared/datepicker/js/bootstrap-datepicker.min.js"), 
                              tags$link(rel = "stylesheet", type = "text/css", href = "shared/datepicker/css/datepicker.css"))), 
          tags$li(tags$form(id = inputId, class = "shiny-date-range-input input-daterange navbar-form", 
                   tags$input(class = "input-small", style = style, placeholder="Start Date",
                              type = "text", `data-date-language` = language, 
                              `data-date-weekstart` = weekstart, `data-date-format` = format, 
                              `data-date-start-view` = startview, `data-min-date` = min, 
                              `data-max-date` = max, `data-initial-date` = start), 
                   tags$input(class = "input-small", style = style, placeholder="End Date",
                              type = "text", `data-date-language` = language, 
                              `data-date-weekstart` = weekstart, `data-date-format` = format, 
                              `data-date-start-view` = startview, `data-min-date` = min, 
                              `data-max-date` = max, `data-initial-date` = end)
                            )
                  )
          )
  
  
}

