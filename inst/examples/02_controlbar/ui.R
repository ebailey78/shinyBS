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
                             bsControlLink("i_1", "Link #1"),
                             bsControlLink("i_2", "Link #2")
               ),
               bsControlMenu("bcm4", label = "Both", caret = TRUE, icon = "bar-chart-o",
                             bsControlLink("b_1", "Test")
               ),
               bsControlMenu("bcm5", icon = "fa-bar-chart-o",
                             bsControlLink("f_1", "Test")
               ),
               bsControlMenu("bcm6", icon = "fa-bar-chart-o", caret = TRUE,
                             bsControlLink("g_1", "Test")
               )
  ),

  textOutput("test")
  
))