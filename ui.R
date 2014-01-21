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
                             
                             bsNavButton("button1", "<b>Hello</b>"), bsNavText("text1", "This is some text."),
                                             bsNavDropDown("dd1", bsGlyph("icon-hand-up"), c("Action", "Another Action", "Something else here")))
                           ),
                  bsAlert("alert", "This is an alert box. It is dismissable", type="error", dismiss=TRUE),
                  dateRangeInput("daterange1", "Date Range"),
                  numericInput("numInput", "Num", 5)
                  , bsTooltip("link1", "This is a tooltip"), bsTooltip("text1", "This is a text input", "right"),
                    bsPopover("numInput", "Number Input", 
                              "This is a box for entering numeric input. It looks just like a text input in Firefox but will have little arrows for selecting a number in some other browsers.", trigger="hover")

                  
                  
                  
                  ))