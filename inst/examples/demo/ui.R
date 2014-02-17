library(shiny)
library(shinyBS)
pollutants <- c('Acetone', 'Acrolein', 'Benzene', 'Benzyl Chloride', 'Bromodichloromethane', 'Bromoform', 'Bromomethane', '1,3-Butadiene', 'Carbon Disulfide', 'Carbon Tetrachloride', 'Chlorobenzene', 'Chloroethane', 'Chloroform', 'Chloromethane', 'Cyclohexane', 'Dibromochloromethane', '1,2-Dibromoethane', 'm-Dichlorobenzene', 'p-Dichlorobenzene', 'o-Dichlorobenzene', 'Dichlorodifluoromethane (F-12)', '1,1-Dichloroethane', '1,2-Dichloroethane', 't-1,2-Dichloroethene', 'c-1,2-Dichloroethene', 'Dichloromethane', '1,2-Dichloropropane', 'c-1,3-Dichloropropene', 't-1,3-Dichloropropene', 'Dichloro-Tetrafluoroethane (F-114)', '1,4-Dioxane', 'Ethanol', 'Ethyl Acetate', 'Ethylbenzene', 'p-Ethyltoluene', 'Heptane', 'Hexachlorobutadiene', 'Hexane', 'Isopropanol', 'Methyl Ethyl Ketone (MEK)', 'Methyl Isobutyl Ketone (MIBK)', 'Methyl n-Butyl Ketone (MBK)', 'Methyl Tert-Butyl Ether (MTBE)', 'Propene', 'Styrene', '1,1,2,2-Tetrachloroethane', 'Tetrachloroethene (PCE)', 'Tetrahydrofuran (THF)', 'Toluene', 'Trichlorotrifluoroethane (F-113)', '1,2,4-Trichlorobenzene', '1,1,1-Trichloroethane', '1,1,2-Trichloroethane', 'Trichloroethene (TCE)', 'Trichlorofluoromethane (F-11)', '1,3,5-Trimethylbenzene', '1,2,4-Trimethylbenzene', 'Vinyl Acetate', 'Vinyl Chloride', 'Vinylidene Chloride', 'o-Xylene', 'm+p-Xylenes')

demoPanel <- function(title, intro, controls, example, codeId) {
  tabPanel(title,
           tags$div(class="row-fluid",
                    tags$div(class="span3 well", style="height: 100%",
                             tags$h5("Control Panel"),
                             controls
                    ),
                    tags$div(class="span9",
                             tags$p(HTML(intro)),
                             tags$div(tags$h5(style="padding-left: 10px;", "Example Code:"), htmlOutput(codeId)),
                             tags$div(tags$h5(style="padding-left: 10px;", "Example:"), example)
                    )
           )
           
  )
}

shinyUI(basicPage(tags$head(tags$title("shinyBS Demo Page"), HTML("<style type='text/css' rel='stylesheet'>#pbCode, #alCode, #taCode, #nbCode, #ttCode, #poCode, #coCode{
  
  display: block;
  padding: 8.5px;
  margin: 0px 0px 9px;
  font-size: 12.025px;
  line-height: 18px;
  word-break: break-all;
  word-wrap: break-word;
  white-space: pre-wrap;
  background-color: rgb(245, 245, 245);
  border: 1px solid rgba(0, 0, 0, 0.15);
  border-radius: 4px 4px 4px 4px;
  
  }</style>")),
  tabsetPanel(id = "tabset",
              tabPanel("Introduction", tagList(tags$h3("shinyBS Demo"), 
                                               tags$p(HTML("shinyBS is an R package that makes much of the functionality inherent to Twitter Boostrap available to shiny users without the need to make custom <code>html</code> user interfaces. ")),
                                               tags$p(HTML("Please use the tabs above to explore shinyBS functionality."))
                                               )),
              demoPanel(title = "Navbar",
                        intro = paste0("<p>Navbars offer an attractive and space-effient way to group you inputs together in your shiny app. Most of the customizations in Twitter Bootstrap are available as arguments in the <code>bsNavBar()</code> function. You add elements to the left and right of the navbar by adding them to the <code>leftitems</code> and <code>rightitems</code> arguments, respectivly.</p>",
                                       "<p>Several of shiny's default inputs have been reformatted to look better in the navbar. For example, <code>textInput</code> has had its label changed to a placeholder and has an added 'width' attribute to help save room. New versions of inputs have been had <code>bsNav</code> prepended to their names.</p>",
                                       "<p>Refer to the help files for shinyBS for additional information about navBar inputs.</p>"
                                       ),
                        controls = tagList(textInput("nbBrand", "Brand", "shinyBS"),
                                           checkboxInput("nbInvert", "Inverse", FALSE),
                                           checkboxInput("nbFixed", "Fixed to Top", FALSE), 
                                           tags$hr(),
                                           tags$h5("Current Navbar Element Values"),
                                           tableOutput("nbDemo")
                                   ),
                        example = tags$div(style="height: 800px;", bsNavBar("navBar", "shinyBS", 
                                           bsNavLink("nbLink1", "Link", href="#"),
                                           bsNavDropDown("nbdd", "Dropdown", c("Apple", "Pear", "Banana", "Grapes", "Orange")),
                                           bsNavDivider(), 
                                           bsNavToggleLink("nbLink2", "Toggle", value=TRUE),        
                                           rightItems = list(
                                             bsNavTypeAhead("nbTA", "TypeAhead", choices=pollutants),
                                             bsNavDateRangeInput("nbDateRange", "Date Range"),
                                             bsNavButton("nbButton", "Button"),
                                             bsNavTextInput("nbText", "Text Input", width=40)
                                             )
                                  )),
                        codeId = "nbCode"),
              demoPanel(title = "Alerts",
                        intro = "Alerts allow you to communicate information to the user on the fly. Begin by creating an alert anchor with the <code>bsAlert()</code> function in the iu.R script. You can then add alerts to this anchor with <code>createAlert()</code> and remove them with <code>closeAlert()</code>",
                        controls = tagList(selectInput("alType", "Type", c("warning", "info", "danger", "success")),
                                           checkboxInput("alTitle", "Title", FALSE),
                                           checkboxInput("alDis", "Dismissible", TRUE),
                                           checkboxInput("alBlock", "Block", FALSE),
                                           checkboxInput("alAppend", "Append", TRUE),
                                           actionButton("alCreate", "Create Alert")
                                   ),
                        example = tagList(bsAlert("alert_anchor"),
                                          tags$p(HTML("Alert box text generated by <a href='http://www.gameofipsum.com/'>Game of Ipsum</a>."))),
                        codeId = "alCode"
                        ),
              demoPanel(title = "Progress Bars",
                        intro = "Progress bars are created with the <code>bsProgressBar</code> function in UI.R and then modified with <code>updateProgressBar</code> in server.R. Below is a live demonstration of the progress bar functionality. Use the inputs to modify the example progress bar. The example code will shows the code necessary to replicate the current progress bar.",
                        controls = tagList(sliderInput("pbnumb", "Percent Complete", 50, min=0, max=100),
                                           selectInput("pbselect", "Color", c("standard", "warning", "info", "danger", "success")),
                                           radioButtons("pbradio", "Style", c("none", "striped", "animated")),
                                           checkboxInput("pbcb", "Hidden", FALSE)),
                        example = bsProgressBar("pb1", 50, color="success", animate=TRUE),
                        codeId = "pbCode"
              ),
              demoPanel(title = "TypeAhead",
                        intro = "TypeAhead boxes are special versions of textboxes that help lead the user to acceptable inputs. They are created with the <code>bsTypeAhead()</code> function and can be updated with <code>updateTypeAhead()</code>. You can set the minimum match length and number of items to display at creation but these properties cannot be changed by <code>updateTypeAhead()</code>.",
                        controls = tagList(textInput("taLabel", "Label", "TypeAhead:"),
                                           selectInput("taChoice", "Choices", c("Pollutants", "Fruits and Vegetables", "Animals"))
                                           ),
                        example = bsTypeAhead("ta1", label = "TypeAhead:", choices = pollutants, items=4),
                        codeId = "taCode"
              ),
              demoPanel(title = "Tooltips",
                        intro = "Tooltips and popovers are added in very similar ways. Tooltips can be added to any element with an <code>inputId</code> or an <code>outputId</code> by using <code>bsTooltip()</code> in ui.R, or <code>addTooltip()</code> in server.R.",
                        controls = tagList(selectInput("ttTarget", "Target", c("button", "text input")),
                                           textInput("ttTitle", "Title", "A tooltip"),
                                           selectInput("ttPlacement", "Placement", c("top", "bottom", "left", "right")),
                                           #selectInput("ttTrigger", "Trigger", c("hover", "click", "focus", "manual")),
                                           checkboxGroupInput("ttTrigger", "Triggers", choices = c("click", "hover", "focus", "manual"), selected="hover"),
                                           tags$br(),
                                           actionButton("ttAdd", "Add Tooltip")),
                        example = tagList(actionButton("button1", "A Button"), tags$br(),
                                          textInput("text1", "Text Input")
                                          ),
                        codeId = "ttCode"),
              demoPanel(title = "Popovers",
                        intro = "Tooltips and popovers are added in very similar ways. Popovers can be added to any element with an <code>inputId</code> or an <code>outputId</code> by using <code>bsPopover()</code> in ui.R, or <code>addPopover()</code> in server.R.",
                        controls = tagList(selectInput("poTarget", "Target", c("button", "text input")),
                                           textInput("poTitle", "Title", "A Popover"),
                                           textInput("poContent", "Content", "This is content. Isn't it <b>great!</b>"),
                                           selectInput("poPlacement", "Placement", c("top", "bottom", "left", "right")),
                                           selectInput("poTrigger", "Trigger", c("click", "hover", "focus", "manual")),
                                           tags$br(),
                                           actionButton("poAdd", "Add Popover")),
                        example = tagList(actionButton("button2", "A Button"), tags$br(),
                                          textInput("text2", "Text Input")
                        ),
                        codeId = "poCode"),
              demoPanel(title = "Collapse",
                        intro = "Collapses (sometimes called accordions) are an alternative way to segment information and free up space in your shiny app. They have been designed to work in a very similar way to <code>tabsetPanel()</code> and <code>tabPanel()</code>. Create a collapse group with <code>bsCollapse()</code> and include any number of panels in it with <code>bsCollapsePanel()</code>. <code>updateCollapse()</code> can be used from server.ui to change which panel is currently open and to switch <em>multiple</em> mode on and off.",
                        controls = tagList(checkboxInput("coMultiple", "Multiple Mode", value = FALSE),
                                           checkboxGroupInput("coOpen", "Open Panels", choices = c("Collapse #1", "Collapse #2", "Collapse #3")),
                                           actionButton("coUpdate", "Update")),
                        example = bsCollapse(multiple = FALSE, open = c("col1"), id = "collapse1",
                          bsCollapsePanel("Collapse #1", tags$p("Cell treachery spearwife night's watch, tower suckling pig, drink, your king commands it spare me your false courtesy tourney. Feed it to the goats, seven hells lord of light as high as honor in his cups. Sword greyscale old bear none so wise godswood the last of the dragons rouse me not. No foe may pass bloody mummers, let me soar spiced wine your grace honed and ready fire."), id="col1", value="test1"),
                          bsCollapsePanel("Collapse #2", actionButton("btn123", "A Button"), textInput("txt1234", "A Text Input"), id="col2", value="test2"),
                          bsCollapsePanel("Collapse #3", plotOutput("testPlot1"), id="col3", value="test3")),
                        codeId = "coCode")
   )
))