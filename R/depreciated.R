#'@rdname glyph
#'@name bsGlyph
#'@title Glyphicons
#'@description Add Glyphicons to shiny (DEPRECIATED)
#'
#'@param name The name of the glyphicon
#'@param white Logical indicating whether the white version should be used
#'
#'@details Since writing this function, RStudio has added an \code{icon()} function to shiny. Use \code{icon()} instead.
#'
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/base-css.html}{Base CSS for
#'  Twitter Bootstrap 2.3.2}
#'@export
bsGlyph <- function(name, white = FALSE) {
  warning("bsGlyph is depreciated. Use native shiny function 'icon()' instead.")
  class <- name
  if(white) class <- paste(class, "icon-white")
  tags$i(class=class)
}

#'@rdname NavBar
#'@name NavBar
#'@title Depreciated Navbar Functions
#'  
#'@description Depreciated functions related to creating NavBars in shiny. See
#'  \link{bsMenuBar} for updated functions.
#'  
#'@param inputId The Id of the input
#'@param brand A word or short phrase that describes the NavBar
#'@param \dots Elements that will appear in the NavBar(left-aligned)
#'@param rightItems Elements that will appear in the NavBar(right-aligned)
#'@param fixed Logical indicating whether the NavBar should be fixed to the top
#'@param inverse Logicial indicating whether the NavBar should have the
#'  'inverse' style applied
#'@param title The title of the page
#'@param navbar A NavBar object to add to the page
#'@param mainContent The main content of the page
#'@param outputId The Id of the output
#'@param label The label the user will see for the input
#'@param href An optional link that will be followed if the user clicks the link
#'  object
#'@param value The value the object should return
#'@param width The width, in pixels, the object should have
#'@param min See \link{dateRangeInput}
#'@param max See \link{dateRangeInput}
#'@param format See \link{dateRangeInput}
#'@param startview See \link{dateRangeInput}
#'@param weekstart See \link{dateRangeInput}
#'@param language See \link{dateRangeInput}
#'@param start See \link{dateRangeInput}
#'@param end See \link{dateRangeInput}
#'@param choices A list of choices to populate the TypeAhead or Dropdown
#'@param items See \link{bsTypeAhead}
#'@param minLength See \link{bsTypeAhead}
#'@param selected The initial value of the \code{bsNavDropDown}
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'  
#'@details These functions have been depreciated. I have reworked how navbars
#'work and added new functionality. These new function begin with \code{bsMenu}.
#'The bsNav function remain to avoid breaking older apps but should not be used
#'for new apps.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/components.html}{Components of
#'  Twitter Bootstrap 2.3.2}
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript 
#'  for Twitter Bootstrap 2.3.2}
#'@references \href{http://getbootstrap.com/2.3.2/base-css.html}{Base CSS for
#'  Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsNavBar <- function(inputId, brand, ..., rightItems, fixed=FALSE, inverse=FALSE) {
  
  warning("bsNavBar() is depreciated. Use bsMenuBar() instead.")
  bsMenuBar(inputId = inputId, ... = ..., brand = brand, rightItems = rightItems, 
            fixed = fixed, inverse = inverse)
  
}

# Allows the user to change some aspects of th navbar from the server.
#'@rdname NavBar
#'@export
updateNavBar <- function(session, inputId, brand=NULL, fixed=NULL, inverse=NULL) {
  
  data <- dropNulls(list(id=inputId, brand=brand, fixed=fixed, inverse=inverse))
  
  session$sendCustomMessage(type="modifynavbar", data)
  
}

# Wrapper for creating a page with a navbar
#'@rdname NavBar
#'@export
pageWithNavBar <- function(title = "", navbar, mainContent) {
  
  basicPage(tags$head(tags$title(title)),
            navbar,
            mainContent)
  
}

# same as textOutput but wrapped for better formatting in navbar 
#'@rdname NavBar
#'@export
bsNavTextOutput <- function(outputId) {
  tags$li(tags$p(id = outputId, class="navbar-text sbs-text-output"))
}

# Create a link input for a navbar that acts like an actionButton
#'@rdname NavBar
#'@export
bsNavLink <- function(inputId, label, href="#") {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  tags$li(tags$a(id = inputId, type="button", href = href, class="action-button", label))
  
}

# Create a link input for a navbar that acts like a checkboxInput
#'@rdname NavBar
#'@export
bsNavToggleLink <- function(inputId, label, value=FALSE) {
  
  if(!inherits(label, "shiny.tag")) label <- HTML(label)
  
  class = ""
  if(value) class = "active"
  
  tags$li(class = class, tags$a(id = inputId, href="#", class = "sbs-toggle", label))
  
}

# Update a toggleLink object
#'@rdname NavBar
#'@export
updateToggleLink <- function(session, inputId, label=NULL, value=NULL) {
  data <- dropNulls(list(label=label, value = value))
  
  session$sendInputMessage(inputId, data)
  
}

# Create a vertical divider between navbar elements
#'@rdname NavBar
#'@export
bsNavDivider <- function() {
  tags$li(class="divider-vertical")
}

# Wraps actionbutton in a li so it works with bsNavBar
#'@rdname NavBar
#'@export
bsNavButton <- function(inputId, label) {
  
  tags$li(tags$form(class="navbar-form", actionButton(inputId, label)))
  
}

# Same as textInput but with label and a placeholder and optional width argument to save space
#'@rdname NavBar
#'@export
bsNavTextInput <- function(inputId, label, value = "", width=NULL) {
  
  style = ""
  if(!is.null(width)) style = paste0("width: ", width, "px;")
  
  tags$li(tags$form(class="navbar-form", tags$input(id = inputId, style=style, type = "text", value = value, placeholder=label)))
  
}

# dateInput element for navbars
#'@rdname NavBar
#'@export
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
#'@rdname NavBar
#'@export
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

# Same as bsTypeAhead but with label as placeholder and optional width argument to save space.
#'@rdname NavBar
#'@export
bsNavTypeAhead <- function(inputId, label, value = "", choices, items=8, minLength=1, width = NULL) {
  
  choices <- paste0("[\"", paste0(choices, collapse="\", \"") , "\"]")
  
  style = ""
  if(!is.null(width)) style = paste0("width: ", width, "px;")
  
  
  tags$li(tags$form(class="navbar-form", tags$input(id = inputId, type="text", class="sbs-typeahead",
                                                    "data-provide"="typeahead", "data-source"=choices, style=style,
                                                    "data-items"=items, "data-minLength"=1, autocomplete="off",
                                                    placeholder=label, value = value)))
  
}