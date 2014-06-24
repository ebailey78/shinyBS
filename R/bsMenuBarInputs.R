#'@rdname menuBarInputs
#'@export
bsMenuLink <- function(inputId, label, href="#", icon = NULL) {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  if(!is.null(icon)) {
    i <- tags$i(class = "fa fa-fw left-icon")
    if(!is.null(icon)) {
      # Prepends 'fa-' to the icon name, if it isn't already there.
      if(substr(icon, 1, 3) != "fa-") {
        icon <- paste0("fa-", icon)  
      }
      i <- tagAddClass(i, icon)
    }
  } else {
    i <- ""
  }
  
  tags$li(tags$a(id = inputId, type="button", href = href, class="action-button", i, label))
  
}

#'@rdname menuBarInputs
#'@export
bsMenuToggleLink <- function(inputId, label, icon = NULL, value=FALSE) {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  if(!is.null(icon)) {
    i <- tags$i(class = "fa fa-fw left-icon")
    if(!is.null(icon)) {
      # Prepends 'fa-' to the icon name, if it isn't already there.
      if(substr(icon, 1, 3) != "fa-") {
        icon <- paste0("fa-", icon)  
      }
      i <- tagAddClass(i, icon)
    }
  } else {
    i <- ""
  }
  
  class = ""
  if(value) class = "active"
  
  tags$li(class = class, tags$a(id = inputId, href="#", class = "sbs-toggle", i, label))
  
}

#'@rdname menuBarInputs
#'@export
updateMenuToggle <- function(session, inputId, label=NULL, value=NULL) {
  data <- dropNulls(list(label=label, value = value))
  
  session$sendInputMessage(inputId, data)
  
}

#'@rdname menuBarInputs
#'@export
bsMenuBarDivider <- function() {
  tags$li(class="divider-vertical")
}

#'@rdname bsMenuDateRangeInput
#'@name bsMenuDateRangeInput
#'@title Date Range Input for shinyBS menu bars
#'@description Function for creating a date range input for shinyBS menubars
#'  
#'@param inputId An Id for the dateRangeInput object
#'@param label Label for dateRangeInput (appears as tooltip)
#'@param start See \link{dateRangeInput}
#'@param end See \link{dateRangeInput}
#'@param min See \link{dateRangeInput}
#'@param max See \link{dateRangeInput}
#'@param format See \link{dateRangeInput}
#'@param startview See \link{dateRangeInput}
#'@param weekstart See \link{dateRangeInput}
#'@param language See \link{dateRangeInput}
#'@param presets A list of preset date ranges to aid in date selection (See
#'  details)
#'  
#'@details \code{bsMenuDateRangeInput} is a modified version of Shiny's native 
#'  \code{\link{dateRangeInput}} designed to fit better within a shinyBS
#'  menubar. \cr\cr If \code{presets} is provided, a button with a calendar icon
#'  will be prepended to the date range input. Clicking this button will reveal
#'  a dropdown with the provided presets. If the user clicks a preset, the
#'  dateRangeInput will automatically be updated to selected preset. Presets
#'  should be in the form of a named list of two-element vectors. For
#'  example:\cr\cr \code{presets = list("Year Two" = c("2013-01-01",
#'  "2013-12-31"), "Year One" = c("2012-01-01", "2012-12-31"))} \cr\cr Would
#'  create two presets labeled 'Year One' and 'Year Two' corresponding to the
#'  provided date ranges. \cr\cr There is currently no update function for
#'  \code{bsMenuDateRangeInput}. the standard \code{\link{updateDateRangeInput}}
#'  will work on \code{bsMenuDateRangeInput} but does not give the option of
#'  updating the presets. If that is functionality that you would find useful,
#'  please let contact me.
#'@note Run \code{bsDemo("menubar")} for a live examples of shinyBS menubar 
#'  functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/components.html}{Components of
#'  Twitter Bootstrap 2.3.2}
#'@references \href{http://getbootstrap.com/2.3.2/base-css.html}{Base CSS for 
#'  Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo("menubar") for examples
#'@export
bsMenuDateRangeInput <- function (inputId, label, start = NULL, end = NULL, 
                                  min = NULL, max = NULL, format = "yyyy-mm-dd", 
                                  startview = "month", weekstart = 0, 
                                  language = "en", presets) {
  
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
  st <- tags$input(size = 8, class = "input-small", 
                   type = "text", `data-date-language` = language, `data-date-weekstart` = weekstart, 
                   `data-date-format` = format, `data-date-start-view` = startview, 
                   `data-min-date` = min, `data-max-date` = max, `data-initial-date` = start)
  et <- tags$input(type = "text", class = "input-small", style = "border-radius: 0px 4px 4px 0px; margin-left: -1px;",
                   `data-date-language` = language, `data-date-weekstart` = weekstart, 
                   `data-date-format` = format, `data-date-start-view` = startview, size = 8,
                   `data-min-date` = min, `data-max-date` = max, `data-initial-date` = end)
  
  if(!missing(presets)) {
    
    opts <- tags$ul(class = "dropdown-menu", role = "menu", 
                    lapply(seq(length(presets)), function(i) {
                      v <- paste0('["',paste0(presets[[i]], collapse = '","'),'"]')
                      tags$li(class = "date-range-preset", "data-target" = inputId, "data-value" = v, tags$a("tab-index" = "-1", href = "#", names(presets)[i]))
                    })
            )
    
    btn <- tags$button(class = "btn dropdown-toggle ",
                       type = "button", "data-toggle" = "dropdown", style = "margin-top: 5px;",
                       tags$i(id = paste0(inputId, "_icon"), class="fa fa-calendar")
    )
    
    op <- tags$li(id = inputId, class = "sbs-menu-wrap shiny-date-range-input input-daterange input-prepend input-append",
                  tags$form(class="navbar-form",
                            tags$div(class="btn-group date-range-presets", id = paste0(inputId, "_presets"), btn, opts),
                            st, et
                  )
    )
    
  } else {
    op <- tags$li(id = inputId, class = "sbs-menu-wrap shiny-date-range-input input-daterange input-prepend input-append", tags$form(class = "navbar-form", tags$i(id = paste0(inputId, "_icon"), class="fa fa-calendar add-on"), st, et))
  }
  
  attr(op, "html_dependencies") <- dep
  
  label <- bsTooltip(paste0(inputId, "_icon"), label)
  
  return(tagList(op, label))
  
}

