#'Modals
#'
#'Modal windows are similar to popups but are rendered within the
#'original window. They can contain any combination of shiny inputs, shiny
#'outputs, and html. Possible uses include extra controls that you don't want
#'cluttering up the main app display or help pages to explain your apps
#'operation.
#'
#'@section Components:
#'There are only two functions in the Modals family: 
#'  \describe{
#'    \item{\code{\link{bsModal}}}{Used in the UI to create a modal window.}
#'    \item{\code{\link{toggleModal}}}{Used in the Server logic to open or
#'    close a modal window programmatically.}
#'  }
#'  
#'@details
#'Use \code{\link{bsModal}} in your UI to create a modal window. It works 
#'like \code{\link{Collapses}} or \code{\link{tabPanel}}, any non-named arguments
#'will be passed as content for the modal.
#'
#'Create a button or link and assign its \code{inputId} as the \code{trigger}
#'in \code{\link{bsModal}}.
#'
#'@section Changes:
#'There is now a \code{toggle} argument in \code{\link{toggleModal}} that allows
#'you to specify whether you want the modal to open or close.
#'
#'The \code{size} argument in \code{\link{bsModal}} allows you to specify the 
#'size of the modal window. Either \code{small} or \code{large}.
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
#'        actionButton("tabBut", "View Table")
#'      ),
#'      
#'      mainPanel(
#'        plotOutput("distPlot"),
#'        bsModal("modalExample", "Data Table", "tabBut", size = "large", 
#'          dataTableOutput("distTable"))
#'      )
#'    )
#'  ),
#'  server = 
#'  function(input, output, session) {
#'    
#'    output$distPlot <- renderPlot({
#'      
#'      x    <- faithful[, 2]
#'      bins <- seq(min(x), max(x), length.out = input$bins + 1)
#'      
#'      # draw the histogram with the specified number of bins
#'      hist(x, breaks = bins, col = 'darkgray', border = 'white')
#'      
#'    })
#'    
#'    output$distTable <- renderDataTable({
#'      
#'      x    <- faithful[, 2]
#'      bins <- seq(min(x), max(x), length.out = input$bins + 1)
#'      
#'      # draw the histogram with the specified number of bins
#'      tab <- hist(x, breaks = bins, plot = FALSE)
#'      tab$breaks <- sapply(seq(length(tab$breaks) - 1), function(i) {
#'        paste0(signif(tab$breaks[i], 3), "-", signif(tab$breaks[i+1], 3))
#'      })
#'      tab <- as.data.frame(do.call(cbind, tab))
#'      colnames(tab) <- c("Bins", "Counts", "Density")
#'      return(tab[, 1:3])
#'      
#'    }, options = list(pageLength=10))
#'    
#'  }
#')
#'\dontrun{
#'  runApp(app)
#'}
#'@templateVar family_name Modals
#'@templateVar item_name Modals
#'@template footer
NULL
