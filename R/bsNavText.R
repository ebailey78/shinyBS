# same as textOutput but wrapped for better formatting in navbar 
bsNavTextOutput <- function(outputId) {
          tags$li(tags$p(id = outputId, class="navbar-text shiny-text-output"))
}
