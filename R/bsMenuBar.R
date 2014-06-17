#'@rdname Menubar
#'@name Menu Bar
#'@title Twitter Bootstrap NavBar
#'@description Function for creating a Twitter Bootstrap-style navbar for use
#'  with shinyBS's menu objects
#'  
#'@param id The id of the menubar object
#'@param \dots Various inputs to add to the menu bar. These will be left-aligned
#'@param brand A word or brief phrase that will appear on the left of the menu
#'  bar
#'@param rightItems a list of additional inputs that will be right-aligned in
#'  the menu bar
#'@param fixed Logical indicating whether the menu bar should be fixed to the
#'  top of the screen
#'@param inverse Logical indicating whether the menu bar should use the
#'  'inverse' color scheme
#'@param session The \code{session} object passed to function given to 
#'  \code{shinyServer}
#'  
#'@details This function is almost identical to the depreciated \code{bsNavBar}
#'  function but has been renamed to be consistent with the new naming
#'  convention. \cr\cr Setting \code{fixed = TRUE} will result in a menubar that
#'  remains at the top of the screen, even if the user scrolls the page. \cr\cr
#'  Setting \code{inverse = TRUE} will cause the menubar to be black with white
#'  text.
#'@note Run \code{bsDemo()} for a live examples of shinyBS functionality.
#'@author Eric Bailey
#'@references \href{http://getbootstrap.com/2.3.2/components.html}{Components of
#'  Twitter Bootstrap 2.3.2}
#'@references \href{http://getbootstrap.com/2.3.2/javascript.html}{Javascript 
#'  for Twitter Bootstrap 2.3.2}
#'@examples #Run bsDemo() for examples
#'@export
bsMenuBar <- function(id, ..., brand, rightItems, fixed = FALSE, 
                         inverse = FALSE) {

  leftItems <- list(...)
  if(length(leftItems) == 0) leftItems = list("")
  if(missing(rightItems)) rightItems = list("")
  class <- "navbar"
  if(inverse) class <- paste(class, "navbar-inverse")
  if(fixed)  class <- paste(class, "navbar-fixed-top")
  sbsHead(tags$div(id = id, class = class,
                   tags$div(class = "navbar-inner",
                            tags$a(class="brand", href="#", brand),
                            tags$ul(class="nav pull-left", leftItems),
                            tags$ul(class="nav pull-right", rightItems)
                            )
                   )
          )  
}

#'@rdname Menubar
#'@export
updateMenuBar <- function(session, id, brand=NULL, fixed=NULL, inverse=NULL) {
  data <- dropNulls(list(id=id, brand=brand, fixed=fixed, inverse=inverse))
  session$sendCustomMessage(type="modifymenubar", data)
}