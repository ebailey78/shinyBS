library(shiny)
library(shinyBS)
shinyServer(
   function(input, output, session) {
     observeEvent(input$togOne, ({
       updateButton(session, "actOne", disabled = !input$togOne)
     }))
     observeEvent(input$bins, ({

       b <- input$bins
       disabled = NULL
       style = "default"
       icon = ""

       if(b < 5) {
         disabled = TRUE
         icon <- icon("ban")
       } else {
         disabled = FALSE
       }

       if(b < 15 | b > 35) {
         style = "danger"
       } else if(b < 20 | b > 30) {
         style = "warning"
       } else {
         style = "default"
         icon = icon("check")
       }

       updateButton(session, "actTwo", disabled = disabled, style = style, icon = icon)

     }))

     output$exampleText <- renderText({
       input$actTwo
       b <- isolate(input$bins)
       txt = ""
       if((b > 5 & b < 15) | b > 35) {
         txt = "That was dangerous."
       } else if((b > 5 & b < 20) | b > 30) {
         txt = "I warned you about that."
       } else if(b >= 20 &  b <= 30) {
         txt = "You have chosen... wisely."
       }
       return(txt)
     })
   }
)
