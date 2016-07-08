#'updateTypeahead
#'
#'\code{updateTypeahead} Update a typeaheadInput buttons.
#'@param session The session object passed to function given to shinyServer.
#'@param inputId Input variable to assign the control's value to
#'@param label Display label for the control
#'@param value Initial value
#'@param choices Array of strings to match against. Can also be JavaScript
#'  function. Use htmlwidgets::JS() to indicate JavaScript.
#'@seealso \code{\link{typeaheadInput}}
#'@export
updateTypeahead<- function(session, inputId, label=NULL, value=NULL, choices=NULL) {
  
  if(!is.null(choices)) {
    if(length(choices) > 131370) {
      warning("Due to a limitation of the Bootstrap2 Typeahead JavaScript library the length of 'choices' must not exceed 2 ^ 17 - 2!");
    }
  }
  
  data <- dropNulls(list(id = inputId, label=label, value=value, choices=choices))
  session$sendCustomMessage("typeaheadUpdate", data)
  
}
