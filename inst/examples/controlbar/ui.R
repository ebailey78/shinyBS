library(shiny)
library(shinyBS)

shinyUI(basicPage(
  
  bsControlBar(inputId = "cb1", 
               bsControlMenu("file", "File",
                             bsControlItem("new", "New", "file"),
                             bsControlItem("save", "Save"),
                             bsControlSubMenu("open", "Open", icon = "folder-open",
                                              bsControlItem("of_123", "Old Data.csv"),
                                              bsControlItem("of_234", "Old Data2.csv"),
                                              bsControlItem("of_345", "Old Data3.csv")
                                              )
                             ),
               bsControlMenu("opts", "Options",
                             bsControlSubMenu("units", "Units",
                                              bsControlItem("ugm3", HTML("&mu;g/m<sup>3</sup>"), toggle = TRUE),
                                              bsControlItem("ppbv", "ppbv", toggle = TRUE)
                                              )
                             )
               ),
  plotOutput("plot")
  
  ))