bsNavBar <- function(inputId, brand, leftItems, rightItems, fixed=FALSE, bottom=FALSE, inverse=FALSE) {
  
  class <- "navbar"
  if(inverse) class <- paste(class, "navbar-inverse")
  if(bottom) {
    class <- paste(class, "navbar-fixed-bottom")
  } else if(fixed) {
    class <- paste(class, "navbar-fixed-top")
  }
  
  tags$div(id = inputId, class = class,
           tags$div(class = "navbar-inner",
                    tags$a(class="brand", href="#", brand),
                    tags$ul(class="nav pull-left", leftItems),
                    tags$ul(class="nav pull-right", rightItems)
                    )
           )
}

bsNavLink <- function(inputId, label, active=FALSE, href="#", ...) {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  tags$li(tags$a(id = inputId, href = href, label))
  
}

bsNavDivider <- function() {
  tags$li(class="divider-vertical")
}

bsNavText <- function(inputId, value) {
  tags$li(tags$p(class="navbar-text", value))
}

bsNavDropDown <- function(inputId, label, choices, selected = NULL) {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  choices <- lapply(choices, function(choice) tags$li(tags$a(tabindex="-1", href="#", HTML(choice))))
  
  tags$li(id=inputId, class="dropdown",
          tags$a(href="#", class="dropdown-toggle", "data-toggle"="dropdown", label, tags$b(class="caret")),
          tags$ul(class = "dropdown-menu",
                  choices
                  )
          )
  
}

bsNavDateRangeInput <- function(inputId, start = NULL, end = NULL,
                                min = NULL, max = NULL, format = "yyyy-mm-dd",
                                startview = "month", weekstart = 0, language = "en") {
  
  if (inherits(start, "Date")) 
    start <- format(start, "%Y-%m-%d")
  if (inherits(end, "Date")) 
    end <- format(end, "%Y-%m-%d")
  if (inherits(min, "Date")) 
    min <- format(min, "%Y-%m-%d")
  if (inherits(max, "Date")) 
    max <- format(max, "%Y-%m-%d")
  
  tagList(singleton(tags$head(tags$script(src = "shared/datepicker/js/bootstrap-datepicker.min.js"), 
          tags$link(rel = "stylesheet", type = "text/css", href = "shared/datepicker/css/datepicker.css"),
          tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))),
          tags$li(tags$form(class="navbar-form", 
                            tags$div(id = inputId, class = "shiny-date-range-input input-daterange",
                                     tags$input(type = "text", `data-date-language` = language, 
                                                `data-date-weekstart` = weekstart, `data-date-format` = format, 
                                                `data-date-start-view` = startview, `data-min-date` = min, 
                                                `data-max-date` = max, `data-initial-date` = start), 
                                                tags$input(type = "text", `data-date-language` = language, 
                                                `data-date-weekstart` = weekstart, `data-date-format` = format, 
                                                `data-date-start-view` = startview, `data-min-date` = min, 
                                                `data-max-date` = max, `data-initial-date` = end)))
          ))
  
}

bsNavTextInput <- function(inputId, label="", value="") {
  
  tags$li(label, class="navbar-form", tags$input(id = inputId, type="text", value = value))
  
}

bsNavButton <- function(inputId, label) {
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  tags$li(tags$button(id = inputId, class="btn", label))
}

bsNavSliderInput <- function(inputId, label, min, max, value, step = NULL,
                             round = FALSE, format = "#,##0.#####", locale = "us",
                             ticks = TRUE) {

  tags$li(style="width: 10%", shiny:::slider(inputId, min = min, max = max, value = value, step = step, 
                 round = round, locale = locale, format = format, ticks = ticks,
                 animate = FALSE))
  
}