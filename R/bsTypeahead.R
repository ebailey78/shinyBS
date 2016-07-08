#'bsTypeahead
#'
#'\code{typeaheadInput} creates a textinput with type ahead function buttons.
#'
#'@param inputId Input variable to assign the control's value to
#'@param label Display label for the control
#'@param value Initial value
#'@param choices Array of strings to match against. Can also be JavaScript
#' function. Use htmlwidgets::JS() to indicate JavaScript. The length of \code{choices} must no exceed 131370.
#'@param items The max number of items to display in the dropdown. Can also be
#' set to 'all'
#'@param minLength The minimum character length needed before triggering
#' autocomplete suggestions. You can set it to 0 so suggestion are shown even
#' when there is no text when lookup function is called.
#'@seealso \code{\link{updateTypeaheadInput}}
#'@export
bsTypeahead <- function(inputId, label, value = "", choices, items = 8, minLength = 1) {
  if(!is.null(choices)) {
    if(length(choices) > 131370) {
      warning("Due to a limitation of the Bootstrap2 Typeahead JavaScript library the length of 'choices' must not exceed 2 ^ 17 - 2!");
    }
  }
  if(!'JS_EVAL' %in% class(choices)) {
    choices <- jsonlite::toJSON(choices);
  }
  typeahead <- shiny::tagList(
    shiny::div(class = 'form-group shiny-input-container',
               shiny::tags$label(label, `for` = inputId),
               shiny::tags$input(id = inputId, type="text",
                                 class="form-control shiny-bound-input typeahead",
                                 "data-provide" = "typeahead", autocomplete="off",
                                 value = value),
               shiny::tags$script(paste0("$('#", inputId, "').typeahead({source: ", choices, ",
                                         items: ", items, ",
                                         minLength: ", minLength, "})"))
               )
               )
  
  htmltools::attachDependencies(typeahead, typeaheadDep)
  
}