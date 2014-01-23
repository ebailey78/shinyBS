library(shiny)
library(shinyBS)

pollutants <- c('Acetone', 'Acrolein', 'Benzene', 'Benzyl Chloride', 'Bromodichloromethane', 'Bromoform', 'Bromomethane', '1,3-Butadiene', 'Carbon Disulfide', 'Carbon Tetrachloride', 'Chlorobenzene', 'Chloroethane', 'Chloroform', 'Chloromethane', 'Cyclohexane', 'Dibromochloromethane', '1,2-Dibromoethane', 'm-Dichlorobenzene', 'p-Dichlorobenzene', 'o-Dichlorobenzene', 'Dichlorodifluoromethane (F-12)', '1,1-Dichloroethane', '1,2-Dichloroethane', 't-1,2-Dichloroethene', 'c-1,2-Dichloroethene', 'Dichloromethane', '1,2-Dichloropropane', 'c-1,3-Dichloropropene', 't-1,3-Dichloropropene', 'Dichloro-Tetrafluoroethane (F-114)', '1,4-Dioxane', 'Ethanol', 'Ethyl Acetate', 'Ethylbenzene', 'p-Ethyltoluene', 'Heptane', 'Hexachlorobutadiene', 'Hexane', 'Isopropanol', 'Methyl Ethyl Ketone (MEK)', 'Methyl Isobutyl Ketone (MIBK)', 'Methyl n-Butyl Ketone (MBK)', 'Methyl Tert-Butyl Ether (MTBE)', 'Propene', 'Styrene', '1,1,2,2-Tetrachloroethane', 'Tetrachloroethene (PCE)', 'Tetrahydrofuran (THF)', 'Toluene', 'Trichlorotrifluoroethane (F-113)', '1,2,4-Trichlorobenzene', '1,1,1-Trichloroethane', '1,1,2-Trichloroethane', 'Trichloroethene (TCE)', 'Trichlorofluoromethane (F-11)', '1,3,5-Trimethylbenzene', '1,2,4-Trimethylbenzene', 'Vinyl Acetate', 'Vinyl Chloride', 'Vinylidene Chloride', 'o-Xylene', 'm+p-Xylenes')

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
  bsTypeAhead("ta1", pollutants),
  bsTooltip("link1", "Click Me!"), 
  bsTooltip("dd1", "NavBar Dropdown", "bottom", "hover"),
  bsTooltip("dateRange", "dateRangeInput", "bottom", "hover"),
  bsTooltip("textInput1", "textInput", "right"),
  bsPopover("ta1", "TypeAhead", placement="bottom",
            "This is a typeahead box. It works just like a text box in shiny but allows you to lead the user to specific inputs. Start typing to see how it works.", trigger="hover")
  ,
  bsModal("modal", "link1", "Modal", "This was made using the bsModal function. It could display help text or even shiny outputs like maps, graphs, or tables.")

))