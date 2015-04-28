#'Tooltips and Popovers
#'
#'Tooltips and Popovers allow you to add additional information about controls
#'or outputs without cluttering up your user interface. You can add a tooltip to 
#'a button that displays on hover and better explains what the button will do, or
#'you could add a popover to an output providing further analysis of that output.
#'
#'@section Components:
#'There are eight functions in the Tooltips and Popovers family: 
#'  \describe{
#'    \item{\code{\link{bsTooltip}}}{Used in the UI to add a tooltip to an element
#'    in your UI.}
#'    \item{\code{\link{bsPopover}}}{Used in the UI to add a popover to an element
#'    in your UI.}
#'    \item{\code{\link{tipify}}}{Wrap any UI element in \code{tipify} to add a
#'    tooltip to the wrapped element. Preferred for elemented created with 
#'    \code{\link{renderUI}}.}
#'    \item{\code{\link{popify}}}{Wrap any UI element in \code{popify} to add a
#'    popover to the wrapped element. Preferred for elements created with 
#'    \code{\link{renderUI}}.}
#'    \item{\code{\link{addTooltip}}}{Used in the Server logic to add a tooltip 
#'    to an element in your UI.}
#'    \item{\code{\link{addPopover}}}{Used in the Server logic to add a popover 
#'    to an element in your UI.}
#'    \item{\code{\link{removeTooltip}}}{Used in the Server logic to remove a 
#'    tooltip from an element in your UI.}
#'    \item{\code{\link{removePopover}}}{Used in the Server logic to remove a 
#'    popover from an element in your UI.}
#'  }
#'      
#'@details
#'You can create tooltips and popovers from either the UI script or within the
#'Server logic. \code{\link{bsTooltip}} and \code{\link{bsPopover}} are used in
#'the UI, and \code{\link{addTooltip}} and \code{\link{addPopover}} are used in
#'the Server logic. \code{\link{tipify}} and \code{\link{popify}} can be used 
#'within the UI or from within a \code{\link{renderUI}} in the Server logic. They
#'also have the added advantage of not requiring that the UI element have an ID
#'attribute.
#'
#'@note
#'Tooltips and Popovers cannot contain shiny inputs or outputs.
#'
#'There must be at least one \code{shinyBS} component in the UI of your
#'app in order for the necessary dependencies to be loaded. Because of this,
#'\code{\link{addTooltip}} and \code{\link{addPopover}} will not work if they
#'are the only shinyBS components in your app.
#'
#'Tooltips and popovers may not work on some of the more complex shiny inputs 
#'or outputs. If you encounter a problem with tooltips or popovers not appearing
#'please file a issue on the github page so I can fix it.
#'
#'@section Changes:
#'An \code{options} argument has been added to the creation functions to allow
#'advanced users more control over how the tooltips and popovers appear. See
#'the \href{http://getbootstrap.com}{Twitter Bootstrap 3 documentation} for more
#'details.
#'
#'@examples
#'library(shiny)
#'library(shinyBS)
#'
#'app = shinyApp(
#'  ui = 
#'  fluidPage(
#'    sidebarLayout(
#'      sidebarPanel(
#'        sliderInput("bins",
#'                    "Number of bins:",
#'                    min = 1,
#'                    max = 50,
#'                    value = 30),
#'        bsTooltip("bins", "The wait times will be broken into this many equally spaced bins", 
#'          "right", options = list(container = "body"))
#'      ),
#'      mainPanel(
#'        plotOutput("distPlot"),
#'        uiOutput("uiExample")       
#'      )
#'    )  
#'  ),
#'  server = 
#'  function(input, output, session) {
#'    output$distPlot <- renderPlot({
#'      
#'      # generate bins based on input$bins from ui.R
#'      x    <- faithful[, 2]
#'      bins <- seq(min(x), max(x), length.out = input$bins + 1)
#'      
#'      # draw the histogram with the specified number of bins
#'      hist(x, breaks = bins, col = 'darkgray', border = 'white')
#'      
#'    })
#'    output$uiExample <- renderUI({
#'      tags$span(
#'        popify(bsButton("pointlessButton", "Button", style = "primary", size = "large"), 
#'          "A Pointless Button", 
#'          "This button is <b>pointless</b>. It does not do <em>anything</em>!"),
#'        tipify(bsButton("pB2", "Button", style = "inverse", size = "extra-small"),
#'          "This button is pointless too!")
#'      )
#'    })
#'    addPopover(session, "distPlot", "Data", content = paste0("<p>Waiting time between ",
#'      "eruptions and the duration of the eruption for the Old Faithful geyser ",
#'      "in Yellowstone National Park, Wyoming, USA.</p><p>Azzalini, A. and ",
#'      "Bowman, A. W. (1990). A look at some data on the Old Faithful geyser. ",
#'      "Applied Statistics 39, 357-365.</p>"), trigger = 'click')
#'  }
#')
#'\dontrun{
#'  runApp(app)
#'}
#'@templateVar item_name Tooltips_and_Popovers
#'@templateVar family_name Tooltips_and_Popovers
#'@template footer
NULL


## These Functions are common to multiple tooltip and popover functions
# Shared functions with really long names...
createTooltipOrPopoverOnServer <- function(session, id, type, options) {

  data <- list(action = "add", type = type, id = id, options = options)
  session$sendCustomMessage(type = "updateTooltipOrPopover", data)
  
}

createTooltipOrPopoverOnUI <- function(id, type, options) {
  
  options = paste0("{'", paste(names(options), options, sep = "': '", collapse = "', '"), "'}")

  bsTag <- shiny::tags$script(shiny::HTML(paste0("$(document).ready(function() {setTimeout(function() {shinyBS.addTooltip('", id, "', '", type, "', ", options, ")}, 500)});")))

  htmltools::attachDependencies(bsTag, shinyBSDep)  
  
}

buildTooltipOrPopoverOptionsList <- function(title, placement, trigger, options, content) {
  
  if(is.null(options)) {
    options = list()
  }
  
  if(!missing(content)) {
    content <- gsub("'", "&#39;", content, fixed = TRUE)
    if(is.null(options$content)) {
      options$content = shiny::HTML(content)
    }    
  }
  
  if(is.null(options$placement)) {
    options$placement = placement
  }
  
  if(is.null(options$trigger)) {
    if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
    options$trigger = trigger
  }
  
  if(is.null(options$title)) {
    options$title = title
    options$title <- gsub("'", "&#39;", options$title, fixed = TRUE)  
  }
  
  return(options)
  
}