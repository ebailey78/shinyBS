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
                              tags$link(rel = "stylesheet", type = "text/css", href = "shared/datepicker/css/datepicker.css"))),
          singleton(tags$head(tags$script(src = "tbs/shinyBS.js"),
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