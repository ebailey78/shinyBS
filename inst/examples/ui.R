library(shiny)
library(shinyBS)

pollutants <- c('Acetone', 'Acrolein', 'Benzene', 'Benzyl Chloride', 'Bromodichloromethane', 'Bromoform', 'Bromomethane', '1,3-Butadiene', 'Carbon Disulfide', 'Carbon Tetrachloride', 'Chlorobenzene', 'Chloroethane', 'Chloroform', 'Chloromethane', 'Cyclohexane', 'Dibromochloromethane', '1,2-Dibromoethane', 'm-Dichlorobenzene', 'p-Dichlorobenzene', 'o-Dichlorobenzene', 'Dichlorodifluoromethane (F-12)', '1,1-Dichloroethane', '1,2-Dichloroethane', 't-1,2-Dichloroethene', 'c-1,2-Dichloroethene', 'Dichloromethane', '1,2-Dichloropropane', 'c-1,3-Dichloropropene', 't-1,3-Dichloropropene', 'Dichloro-Tetrafluoroethane (F-114)', '1,4-Dioxane', 'Ethanol', 'Ethyl Acetate', 'Ethylbenzene', 'p-Ethyltoluene', 'Heptane', 'Hexachlorobutadiene', 'Hexane', 'Isopropanol', 'Methyl Ethyl Ketone (MEK)', 'Methyl Isobutyl Ketone (MIBK)', 'Methyl n-Butyl Ketone (MBK)', 'Methyl Tert-Butyl Ether (MTBE)', 'Propene', 'Styrene', '1,1,2,2-Tetrachloroethane', 'Tetrachloroethene (PCE)', 'Tetrahydrofuran (THF)', 'Toluene', 'Trichlorotrifluoroethane (F-113)', '1,2,4-Trichlorobenzene', '1,1,1-Trichloroethane', '1,1,2-Trichloroethane', 'Trichloroethene (TCE)', 'Trichlorofluoromethane (F-11)', '1,3,5-Trimethylbenzene', '1,2,4-Trimethylbenzene', 'Vinyl Acetate', 'Vinyl Chloride', 'Vinylidene Chloride', 'o-Xylene', 'm+p-Xylenes')

demoPanel <- function(title, intro, controls, example, codeId) {
  tabPanel(title,
           tags$p(HTML(intro)),
           tags$div(class="row-fluid",
                    tags$div(class="span3 well",
                             controls
                    ),
                    tags$div(class="span8",
                             tags$div(tags$div(style="padding-left: 10px; font-weight: bold;", "Example:"), example),
                             tags$div(tags$div(style="padding-left: 10px; font-weight: bold;", "Example Code:"), textOutput(codeId))
                    )
           )
           
  )

}

shinyUI(basicPage(title = "shinyBS Demo Page",
  tabsetPanel(id = "tabset",
              tabPanel("Introduction", tagList(tags$h3("Welcome!"), 
                                               tags$p(HTML("shinyBS is an R package that makes much of the functionality inherent to Twitter Boostrap available to shiny users without the need to make custom <code>html</code> user interfaces. shinyBS was developed with shiny version 0.8, but looks better with the development version of shiny that has incorporated Bootstrap version 2.3.2.")),
                                               tags$p(HTML("One of the first things you may notice is the navigation bar above. A navigation bar can be a space-efficient ways to collect various shiny inputs. They are created with the <code>bsNavBar</code> function. They can be customized with several arguments that will affect their positioning, color, and movement during scrolling. In additonal to the normal shiny inputs, <code>bsNavLink</code> can be used to create links that either link to other pages, work like <code>actionButton</code> in your shiny app or open modal dialogs or invoke other bootstap functionality. <code>bsNavDropDown</code> can be used to create dropdown menus in the navigation bar that return the selected item to shiny in much the same way that <code>selectInput</code> does.")),
                                               tags$p(HTML("Please use the tabs to explore other shinyBS functionality."))
                                               )),
              tabPanel("Navbar", 
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
                                  bsNavButton("button1", "Hello") 
                                ))
                       ),
              demoPanel(title = "Alerts",
                        intro = "Alerts allow you to communicate information to the user on the fly. Begin by creating an alert anchor with the <code>bsAlert()</code> function in the iu.R script. You can then add alerts to this anchor with <code>createAlert()</code> and remove them with <code>closeAlert()</code>",
                        controls = tagList(textInput("alTitle", "Title"),
                                           tags$textarea(type="text", rows=5, id="alMessage"),
                                           selectInput("alType", "Type", c("warning", "info", "danger", "success")),
                                           checkboxInput("alDis", "Dismissable", TRUE),
                                           checkboxInput("alBlock", "Block", TRUE),
                                           checkboxInput("alAppend", "Append", TRUE),
                                           actionButton("alcreate", "Create Alert")
                                           ),
                        example = bsAlert("alert_anchor"),
                        codeId = "alCode"
                        ),
              tabPanel("Alerts",
                       tags$p(HTML("You can create bootstrap style alerts by first creating an alert anchor with the <code>bsAlert</code> function. Then, from server.R you can create alerts at that achor point using the <code>createAlert</code> function. By default, shiny will continue to add new alerts to the under the old ones unless you set <code>append=FALSE</code>, which will cause all previous alerts to be destroyed and replaced with the new alert. You can set <code>type</code> equal to <code>error</code>, <code>info</code>, or <code>success</code> for different types of information.")),
                       bsAlert("alert_anchor1"),
                       tags$p(HTML("By default, the user can dismiss an alert by clicking the &times; at the far right of the alert box, but by setting <code>dismiss=FALSE</code> the user won't be able to close the alert, but you can.")),
                       bsAlert("alert_anchor2"),
                       actionButton("ac", "Close Alert"),
                       tags$p(HTML("You can add a title to an alert by setting the <code>title</code> argument")),
                       bsAlert("alert_anchor3"),
                       tags$p(HTML("Setting <code>block=TRUE</code> will add some additional padding and may be useful when you have a large amount of text in the message.")),
                       bsAlert("alert_anchor4")
              ),
              tabPanel("Collapse",
                       bsCollapse(inputId = "ac1", autocollapse=TRUE,
                                  bsCollapsePanel("ap1", "Accordion #1", HTML("This is an accordion panel (Also called a collapse). It lets you segment content and free up room on your page. By default, when one panel is opened all other panels in the group will close, though this behavior can be changed by setting the <code>autocollapse</code> arguement to <code>FALSE</code>."), open=TRUE),
                                  bsCollapsePanel("ap2", "Accordion #2", HTML("Collapse panels work much the same way that tab panels work in regular shiny. <code>bsCollapse</code> creates the collapse group, then you provide that function with a series of <code>bsCollapsePanel</code>'s to populate it.")),
                                  bsCollapsePanel("ap3", "Accordion #3", tags$div("You can also put shiny outputs in collapses", plotOutput("hist")))
                       )
              ),
              tabPanel("Carousel",
                       bsCarousel(inputId = "c1", interval = 5000,
                                  bsCarouselSlide("cs1", plotOutput("hist1"), caption=c("Histogram", "This is a histogram")),
                                  bsCarouselSlide("cs2", plotOutput("box1"), caption=c("Boxplot", "This is a boxplot."))
                       )
              ),
              demoPanel(title = "Progress Bars",
                        intro = "Progress bars are created with the <code>bsProgressBar</code> function in UI.R and then modified with <code>updateProgressBar</code> in server.R. Below is a live demonstration of the progress bar functionality. Use the inputs to modify the example progress bar. The example code will shows the code necessary to replicate the current progress bar.",
                        controls = tagList(sliderInput("pbnumb", "Percent Complete", 0, min=0, max=100),
                                           selectInput("pbselect", "Color", c("standard", "warning", "info", "danger", "success")),
                                           radioButtons("pbradio", "Style", c("none", "striped", "animated")),
                                           checkboxInput("pbcb", "Hidden", FALSE)),
                        example = bsProgressBar("pb1", 0, color="success", animate=TRUE),
                        codeId = "pbCode"),
              tabPanel("New Inputs",
                       bsTypeAhead("ta1", pollutants),
                       HTML("This is a typeahead box. It works just like a text box in shiny but allows you to lead the user to specific inputs. Start typing to see how it works.")
              ),
              tabPanel(HTML("Tooltips & Popovers"),
                       tags$p(HTML("Tooltips and popovers can be added to any element with an <code>inputId</code> by using <code>bsTooltip()</code> or <code>bsPopover()</code>, respectively.")),
                       tags$p(HTML("They can be set to appear <a href='#' id='tt1'>above</a>, <a href='#' id='tt2'>below</a>, to the <a href='#' id='tt3'>left</a>, or the <a href='#' id='tt4'>right</a>.")),
                       tags$p(HTML("They can be set to appear on <a href='#' id='tt5'>hover</a> or <a href='#' id='tt6'>click</a>.")),
                       tags$p(HTML("Popovers work the same way as tooltips, they just allow more information to be <a href='#' id='po1'>displayed</a>.")),
                       bsTooltip("tt1", "This is above", placement="top", trigger="hover"),
                       bsTooltip("tt2", "This is below", placement="bottom", trigger="hover"),
                       bsTooltip("tt3", "This is to the left", placement="left", trigger="hover"),
                       bsTooltip("tt4", "This is to the right", placement="right", trigger="hover"),
                       bsTooltip("tt5", "This is from hovering", trigger="hover"),
                       bsTooltip("tt6", "This is from clicking", trigger="click"),
                       bsPopover("po1", "A Generic Popover", content=HTML("You can add anything to this box, even shiny outputs, if you wanted to."), placement="left")
              )
   ),
   
   bsTooltip("dd1", "NavBar Dropdown", "bottom", "hover"),
   bsTooltip("dateRange", "dateRangeInput", "bottom", "hover"),
   bsTooltip("textInput1", "textInput", "right"),
   bsModal("modal", "link1", "Modal", HTML("This was made using the <code>bsModal</code> function. It could display help text or even shiny outputs like maps, graphs, or tables."))

))