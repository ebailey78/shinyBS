#'@rdname menuBarInputs
#'@export
bsMenuDateRangeInput <- function (inputId, label, start = NULL, end = NULL, min = NULL, 
                                  max = NULL, format = "yyyy-mm-dd", startview = "month", weekstart = 0, 
                                  language = "en") {
  
  dep <- list(name = "bootstrap-datepicker", version = "1.0.2", 
              src = structure(list(href = "shared/datepicker"), .Names = "href"), 
              meta = NULL, script = "js/bootstrap-datepicker.min.js", 
              stylesheet = "css/datepicker.css", 
              head = NULL)
  class(dep) <- "html_dependency"
  
  if (inherits(start, "Date")) 
    start <- format(start, "%Y-%m-%d")
  if (inherits(end, "Date")) 
    end <- format(end, "%Y-%m-%d")
  if (inherits(min, "Date")) 
    min <- format(min, "%Y-%m-%d")
  if (inherits(max, "Date")) 
    max <- format(max, "%Y-%m-%d")
  st <- tags$input(size = 10,
             type = "text", `data-date-language` = language, `data-date-weekstart` = weekstart, 
             `data-date-format` = format, `data-date-start-view` = startview, 
             `data-min-date` = min, `data-max-date` = max, `data-initial-date` = start)
  et <- tags$input(type = "text", style = "border-radius: 0px 4px 4px 0px; margin-left: -1px;",
             `data-date-language` = language, `data-date-weekstart` = weekstart, 
             `data-date-format` = format, `data-date-start-view` = startview, size = 10,
             `data-min-date` = min, `data-max-date` = max, `data-initial-date` = end)
  
  op <- tags$li(class = "sbs-menu-wrap shiny-date-range-input input-daterange input-prepend input-append", tags$form(class = "navbar-form", tags$i(id = paste0(inputId, "_icon"), class="fa fa-calendar add-on"), st, et))
  attr(op, "html_dependencies") <- dep
  
  label <- bsTooltip(paste0(inputId, "_icon"), label)
  
  return(tagList(op, label))
  
}