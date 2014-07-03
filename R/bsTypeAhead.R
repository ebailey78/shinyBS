#'@templateVar item_name TypeAhead
#'@template component
#'@details TypeAheads can be an alternative to select inputs. They appear to be
#'  a regular text input until the user begins to type. As the user types
#'  suggestions will appear below the input similar to how Google's search
#'  suggestions work.
NULL

#'@rdname typeaheads
#'@param inputId Id to assign to the typeAhead
#'@param label The label that will appear on the typeAhead
#'@param value The value to apply to the typeAhead
#'@param choices A list or vector of choices that will appear as the user types
#'@param items The maximum number of typeAhead choices that will appear at one
#'  time as the user types
#'@param minLength The minimum number of characters that a user must type before
#'  typeAhead suggestions begin
#'@section Options:
#'\code{value} should be equal to one of the options presented in choices, but it isn't required.
bsTypeAhead <- function(inputId, label, value = "", choices, items=8, minLength=1) {
  
  choices <- paste0(choices, collapse="|")
  
  sbsHead(tagList(tags$label(label, `for` = inputId), 
                  tags$input(id = inputId, type="text", class="sbs-typeahead", 
                             "data-provide"="typeahead", autocomplete="off",
                             value = value, "data-choices" = choices, 
                             "data-items" = items, "data-minLength" = minLength)
                  )
          )
  
}

#'@rdname typeaheads
#'@param session The \code{session} object passed to function given to
#'  \code{shinyServer}
#'@details
#'updateTypeAhead is used in server.R to change the style and values of a typeAhead.
#'@export
updateTypeAhead <- function(session, inputId, label=NULL, value=NULL, choices=NULL) {
  
  data <- dropNulls(list(label=label, value=value, choices=choices))

  session$sendInputMessage(inputId, data)
  
}