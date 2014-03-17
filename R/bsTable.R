highlightCells <- function(session, id, min = NULL, max = NULL, regex = NULL,
                           class = NULL, style = NULL, reset = NULL, skip.row.names = TRUE) {
  
  data <- dropNulls(list(id = id, min = min, max = max, regex = regex,
                         class = class, style = style, reset = reset, skip = skip.row.names))
  
  session$sendCustomMessage("highlightCells", data)
  
}

highlightRows <- function(session, id, column, min=NULL, max=NULL, regex = NULL,
                          class = NULL, style = NULL, reset = NULL) {
  
  data <- dropNulls(list(id = id, column = column, min = min, max = max, regex = regex,
                         class = class, style = style, reset = reset))
  
  session$sendCustomMessage("highlightRows", data)
  
}