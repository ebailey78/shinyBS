#'@rdname tables
#'@name Tables
#'@title Table Highlighting
#'@description Functions to highlight table cells and/or rows based on their
#'  contents.
#'  
#'@param session The \code{session} object passed to function given to
#'  \code{shinyServer}
#'@param id The id of the table you want to highlight
#'@param min Minimum value to highlight
#'@param max Maximum value to highlight
#'@param regex A regular expression to select cells/rows to highlight
#'@param column Optional column identifier to limit highlighting
#'@param class The class to apply to the highlighted cells
#'@param style CSS style to apply to the highlighted cells
#'@param reset Logical indicating whether previous highlights should be removed
#'  when this highlight is applied
#'@param skip.row.names Logical indicating whether the first column should be
#'  skipped
#'  
#'@details \code{highlightCells()} will highlight individual cells that match
#'criteria provided by other arguments. \cr\cr \code{highlightRows()} will
#'highlight rows based on any cell in that row matching the provided criteria.
#'\cr\cr Setting \code{column} will limit any matching to only the column
#'specified. \cr\cr \code{class} can be set to any of the following:
#'\code{danger}, \code{info}, \code{warning}, \code{success}, \code{good},
#'\code{bad}, or \code{neutral}.
#'
#'@template footer
highlightCells <- function(session, id, min = NULL, max = NULL, regex = NULL, column = NULL,
                           class = NULL, style = NULL, reset = NULL, skip.row.names = TRUE) {
  
  data <- dropNulls(list(id = id, min = min, max = max, regex = regex, column = column,
                         class = class, style = style, reset = reset, skip = skip.row.names))
  
  session$sendCustomMessage("highlightCells", data)
  
}

#'@rdname tables
#'@export
highlightRows <- function(session, id, column, min=NULL, max=NULL, regex = NULL,
                          class = NULL, style = NULL, reset = NULL) {
  
  data <- dropNulls(list(id = id, column = column, min = min, max = max, regex = regex,
                         class = class, style = style, reset = reset))
  
  session$sendCustomMessage("highlightRows", data)
  
}