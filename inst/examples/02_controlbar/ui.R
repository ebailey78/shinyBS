library(shiny)
library(shinyBS)

shinyUI(basicPage(
  
  bsControlBar(inputId = "cb1", brand = "shinyBS",
               bsControlMenu("bcm1", label = "Links", icon = "link", caret = TRUE,
                             bsControlHeader("Action Links"),
                             bsControlLink("p_2", "With Icon", icon = "globe"),
                             bsControlLink("p_1", "Without Icon"),
                             bsControlDivider(),
                             bsControlHeader("Toggle Links"),
                             bsControlLink("p_3", "Toggle #1", toggle = TRUE),
                             bsControlLink("p_4", "Toggle #2", toggle = TRUE, active = TRUE),
                             bsControlDivider(),
                             bsControlHeader("Radio Links"),
                             bsRadioGroup("bsRad", active = "rad2",
                                          bsControlLink("rad1", "Radio #1"),
                                          bsControlLink("rad2", "Radio #2"),
                                          bsControlLink("rad3", "Radio #3"))
               ),
               bsControlMenu("bcm2", label = "Caret", caret = TRUE,
                             bsControlSubMenu("i_sm1", "Submenu", 
                                              bsControlLink("i_sm1_11", "One"),
                                              bsControlLink("i_sm1_21", "Two"),
                                              bsControlLink("i_sm1_31", "Three"),
                                              bsControlLink("i_sm1_41", "Four"),
                                              bsControlSubMenu("i_sm1", " Sub-Submenu", 
                                                               bsControlLink("i_sm1_12", "One"),
                                                               bsControlLink("i_sm1_22", "Two"),
                                                               bsControlLink("i_sm1_32", "Three"),
                                                               bsControlLink("i_sm1_42", "Four")
                                              )
                             ),
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
                             bsControlHeader("Radio Links"),
                             bsRadioGroup("rad1", active = "b_3",
                                          bsControlLink("b_1", "Radio #1", toggle = TRUE),
                                          bsControlLink("b_2", "Radio #2", toggle = TRUE),
                                          bsControlLink("b_3", "Radio #3", toggle = TRUE),
                                          bsControlLink("b_4", "Radio #4", toggle = TRUE)
                             )
               ),
               bsControlMenu("bcm5", icon = "fa-bar-chart-o",
                             bsControlLink("f_1", "Test")
               ),
               bsControlMenu("bcm6", icon = "fa-bar-chart-o", caret = TRUE,
                             bsControlInput("ip1", textInput(inputId = "textTest", "Text Test", "Testing")),
                             bsControlInput("ip2", numericInput(inputId = "numTest", "Numeric Test", value = 5, min = -10, max = 10, step = 1)),
                             bsControlInput("ip3", dateInput(inputId = "dateTest", "Date Test", value = "2014-01-01", min = "2012-01-01", max = "2014-12-31"), icon = "calendar"),
                             bsControlInput("ip4", dateRangeInput(inputId = "dateRangeTest", "Date Range Test", start = "2013-12-01", end = "2013-12-31", min = "2013-01-01", max = "2014-12-31")),
                             bsControlInput("ip5", sliderInput(inputId = "sliderTest", "Slider Test", min = 0, max = 1000, value = 435, step = 5)),
                             bsControlInput("ip6", bsTypeAhead(inputId = "typeAheadTest", "TypeAhead Test", value = "benzene", choices = c("benzene", "toluene", "ethylbenzene", "xylenes")))
               )
  ),

  textOutput("test")
  
))