# same as textOutput but wrapped for better formatting in navbar 
bsNavTextOutput <- function(inputId, value=NULL) {
          tags$li(tags$p(id = inputId, class="navbar-text shiny-text-output", value))
}
