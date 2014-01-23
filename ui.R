library(shiny)
library(shinyBS)

shinyUI(basicPage(
  tags$head(tags$title("shinyBS Demo Page")), 
  bsNavBar("navBar", "shinyBS", 
           leftItems = list(
             bsNavLink("link1", "Link", href="#"), 
             bsNavDivider(), 
             bsNavDateRangeInput("dateRange"), 
             bsNavDivider(),
             bsNavDropDown("dd1", bsGlyph("icon-question-sign"), c("Apple", "Pear", "Lemon", "Orange", "Strawberry")),
             bsNavDivider(),
             bsNavText("text1","")),
              
           rightItems = list(
             bsNavTextInput("textInput1"),
             bsNavButton("button1", "<b>Hello</b>") 
             )),
  bsAlert("alert", "This is an alert box. It is dismissable", type="error", dismiss=TRUE),
  dateRangeInput("daterange1", "Date Range"),
  numericInput("numInput", "Num", 5), 
  bsTooltip("link1", "Click Me!"), 
  bsTooltip("dd1", "NavBar Dropdown", "bottom", "hover"),
  bsTooltip("dateRange", "dateRangeInput", "bottom", "hover"),
  bsTooltip("textInput1", "textInput", "right"),
  bsPopover("numInput", "Number Input", 
            "This is a box for entering numeric input. It looks just like a text input in Firefox but will have little arrows for selecting a number in some other browsers.", trigger="hover")
  ,
  bsModal("modal", "link1", "Modal", "This was made using the bsModal function. It could display help text or even shiny outputs like maps, graphs, or tables.")

))