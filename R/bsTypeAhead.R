#'@rdname TypeAhead
#'@name TypeAhead
#'@title TWitter Bootstrap TypeAheads
#'  
#'@description Functions to add and update Twitter Bootstrap TypeAheads in shiny
#'  
#'@param inputId Id to assign to the typeAhead
#'@param label The label that will appear on the typeAhead
#'@param value The value to apply to the typeAhead
#'@param choices A list of choices taht will appear as the user types
#'@param items The maximum number of typeAhead choices that will appear as one
#'  time as the user types
#'@param minLength The minimum number of characters that a use must type before
#'  typeAhead suggestions begin
#'@param session The \code{session} object passed to function given to
#'  \code{shinyServer}
#'  
#'  #'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript 
#'  for Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsTypeAhead <- function(inputId, label, value = "", choices, items=8, minLength=1) {
  
  choices <- paste0("[\'", paste0(choices, collapse="\', \'") , "\']")
  
  sbsHead(tagList(tags$label(label, `for` = inputId), 
                  tags$input(id = inputId, type="text", class="sbs-typeahead", 
                             "data-provide"="typeahead", autocomplete="off",
                             value = value),
                  tags$script(paste0("$('#", inputId, "').typeahead({source: ", choices, ",
                                                                     items: ", items, ",
                                                                     minLength: ", minLength, "})"))
                  )
          )
  
}

#'@rdname TypeAhead
#'@export
updateTypeAhead <- function(session, inputId, label=NULL, value=NULL, choices=NULL) {
  
  data <- dropNulls(list(label=label, value=value, choices=choices))

  session$sendInputMessage(inputId, data)
  
}