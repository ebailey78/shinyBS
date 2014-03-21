library(shiny)
library(shinyBS)

options <- list("Font Size" = list("8pt" = "txtsz:8", "10pt" = "txtsz:10", "12pt" = "txtsz:12", "14pt" = "txtsz:14", "16pt" = "txtsz:16", "18pt" = "txtsz:18"), 
                "Font Color" = list("White" = "txt:white", "Black" = "txt:black", "Red" = "txt:red", "Blue" = "txt:blue", "Green" = "txt:green", "Yellow" = "txt:yellow", "Orange" = "txt:orange", "Purple" = "txt:purple"), 
                "Background Color" = list("White" = "bg:white", "Red" = "bg:red", "Blue" = "bg:blue", "Green" = "bg:green", "Yellow" = "bg:yellow", "Orange" = "bg:orange", "Purple" = "bg:purple"))
media <- list(GI = bsMedia("GI", "Gary IITRI", "Gary IITRI has been an active monitor since 1998. Besides air toxics, Gary IITRI also monitors meteorology paramaters and criteria pollutants. Gary IITRI is also an unofficial PAMS monitor so it has hourly data for may air toxics.", "holder.js/120x120/sky"),
              NE = bsMedia("NE", "Falls of the Ohio", "The Falls of the Ohio air toxics monitor is one of the newer monitors in the ToxWatch network, only active since 2008. It is located on the roof of the State Park visitors center and collects only 1-in-6 day toxics samples.", "holder.js/120x120/sky"))


shinyUI(pageWithNavBar("NavBar Demo",
                       navbar = bsNavBar("mainnb", "navBar Demo",
                                         bsNavDropDown("ndd1", "Options", options),
                                         bsNavDropDown("ndd2", "Monitors", media)
                                         ),
                       tagList(tags$head(tags$script(src = "nbDemo.js"),
                                         tags$script(src = "holder/holder.js")),
                               suppressWarnings(includeHTML("http://www.gameofipsum.com/api/?type=html&paragraphs=5&percent=0")),
                               tags$a(href = "#", "This is a ", tags$a(href = "#", "Test"))
                               )
                       )
        )