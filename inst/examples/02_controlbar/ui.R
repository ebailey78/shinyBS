library(shiny)
library(shinyBS)

shinyUI(basicPage(
  
  bsControlBar(inputId = "cb1", brand = "shinyBS",
               bsControlMenu("bcm1", label = "Plain",
                             bsControlLink("p_1", "Test"),
                             bsControlLink("p_2", "With Icon", icon = "globe"),
                             bsControlLink("p_3", "Toggle", toggle = TRUE),
                             bsControlLink("p_4", "Active", toggle = TRUE, active = TRUE)
               ),
               bsControlMenu("bcm2", label = "Caret", caret = TRUE,
                             bsControlLink("c_1", "Test")
               ),
               bsControlMenu("bcm3", label = "Icon", icon = "fa-bar-chart-o",
                             bsControlSubMenu("i_sm1", "Submenu", 
                                              bsControlLink("i_sm1_1", "One"),
                                              bsControlLink("i_sm1_2", "Two"),
                                              bsControlLink("i_sm1_3", "Three"),
                                              bsControlLink("i_sm1_4", "Four")
                             ),
                             bsControlLink("i_1", "Link #1", toggle = TRUE),
                             bsControlLink("i_2", "Link #2", toggle = TRUE)
               ),
               bsControlMenu("bcm4", label = "Both", caret = TRUE, icon = "bar-chart-o",
                             bsControlLink("b_1", "Test")
               ),
               bsControlMenu("bcm5", icon = "fa-bar-chart-o",
                             bsControlLink("f_1", "Test")
               ),
               bsControlMenu("bcm6", icon = "fa-bar-chart-o", caret = TRUE,
                             bsControlInput("ip1", textInput(inputId = "textTest", "Text Test", "Testing")),
                             bsControlInput("ip2", numericInput(inputId = "numTest", "Numeric Test", value = 5, min = -10, max = 10, step = 1)),
                             bsControlInput("ip3", dateInput(inputId = "dateTest", "Date Test", value = "2014-01-01", min = "2012-01-01", max = "2014-12-31")),
                             bsControlInput("ip4", dateRangeInput(inputId = "dateRangeTest", "Date Range Test", start = "2013-12-01", end = "2013-12-31", min = "2013-01-01", max = "2014-12-31")),
                             bsControlInput("ip5", sliderInput(inputId = "sliderTest", "Slider Test", min = 0, max = 1000, value = 435, step = 5)),
                             bsControlInput("ip6", bsTypeAhead(inputId = "typeAheadTest", "TypeAhead Test", value = "benzene", choices = c("benzene", "toluene", "ethylbenzene", "xylenes")))
               )
  ),

  textOutput("test")
  
))