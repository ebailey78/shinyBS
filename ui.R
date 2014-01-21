library(shiny)
library(shinyBS)

shinyUI(basicPage(bsNavBar("navBar", "IDEM", 
                           leftItems = list(bsNavLink("link1", "Link #1"),
                                            bsNavDivider(),
                                            bsNavLink("link2", "Link #2"),
                                            bsNavDateRangeInput("dateRange"),
                                            bsNavTextInput("text1")
                                            ), 
                           rightItems = list(
                             bsNavSliderInput("slider1", min=0, max=5, value=3),
                             bsNavButton("button1", "<b>Hello</b>"), bsNavText("text1", "This is some text."),
                                             bsNavDropDown("dd1", bsGlyph("icon-hand-up"), c("Action", "Another Action", "Something else here")))
                           ),
                  dateRangeInput("daterange1", "Date Range"),
                  numericInput("numInput", "Num", 5)
                  )
        )