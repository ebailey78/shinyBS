library(shiny)
library(shinyBS)

# Creates a standardized "Demo" panel for the bsDemo() app.
demoPanel <- function(title, intro, controls, example, uiCode, serverCode) {
  tabPanel(title,
           tags$div(class = "row-fluid",
                    tags$div(class = "span7",
                             tags$div(class = "row-fluid",
                                      tags$div(class = "span12",
                                               tags$div(class = "intro",
                                                        tags$h4(title),
                                                        tags$p(HTML(intro)),
                                                        tags$hr()
                                                        )
                                               )
                                      ),
                             tags$div(class = "row-fluid",
                                      tags$div(class = "span3",
                                               tags$div(class="section-label", "Control Panel"),
                                               tags$div(class = "well control-panel",
                                                        tags$small("Use the controls below to manipulate the example to the right. Code to the far right will also update."),
                                                        controls
                                                        )
                                               ),
                                      tags$div(class = "span9",
                                               tags$div(class = "section-label", "Example"), 
                                               tags$div(class = "example-box",
                                                        example
                                                        )
                                               )
                                      )
                             ),
                    tags$div(class = "span5",
                             tags$div(class = "section-label", "ui.R"),
                             tags$div(class = "scriptblock",
                                      htmlOutput(uiCode)
                                      ),
                             tags$div(class = "section-label", "server.R"),
                             tags$div(class = "scriptblock",
                                      htmlOutput(serverCode)
                                      )
                             )
                    )
           )
}

pollutants <- c('Acetone', 'Acrolein', 'Benzene', 'Benzyl Chloride', 'Bromodichloromethane', 'Bromoform', 'Bromomethane', '1,3-Butadiene', 'Carbon Disulfide', 'Carbon Tetrachloride', 'Chlorobenzene', 'Chloroethane', 'Chloroform', 'Chloromethane', 'Cyclohexane', 'Dibromochloromethane', '1,2-Dibromoethane', 'm-Dichlorobenzene', 'p-Dichlorobenzene', 'o-Dichlorobenzene', 'Dichlorodifluoromethane (F-12)', '1,1-Dichloroethane', '1,2-Dichloroethane', 't-1,2-Dichloroethene', 'c-1,2-Dichloroethene', 'Dichloromethane', '1,2-Dichloropropane', 'c-1,3-Dichloropropene', 't-1,3-Dichloropropene', 'Dichloro-Tetrafluoroethane (F-114)', '1,4-Dioxane', 'Ethanol', 'Ethyl Acetate', 'Ethylbenzene', 'p-Ethyltoluene', 'Heptane', 'Hexachlorobutadiene', 'Hexane', 'Isopropanol', 'Methyl Ethyl Ketone (MEK)', 'Methyl Isobutyl Ketone (MIBK)', 'Methyl n-Butyl Ketone (MBK)', 'Methyl Tert-Butyl Ether (MTBE)', 'Propene', 'Styrene', '1,1,2,2-Tetrachloroethane', 'Tetrachloroethene (PCE)', 'Tetrahydrofuran (THF)', 'Toluene', 'Trichlorotrifluoroethane (F-113)', '1,2,4-Trichlorobenzene', '1,1,1-Trichloroethane', '1,1,2-Trichloroethane', 'Trichloroethene (TCE)', 'Trichlorofluoromethane (F-11)', '1,3,5-Trimethylbenzene', '1,2,4-Trimethylbenzene', 'Vinyl Acetate', 'Vinyl Chloride', 'Vinylidene Chloride', 'o-Xylene', 'm+p-Xylenes')

shinyUI(basicPage(tags$head(tags$title("shinyBS Demo Page"), 
                            tags$link(type = "text/css", rel = "stylesheet", href="demo.css")
                            ),
            tabsetPanel(id = "tabset",
              tabPanel("Introduction", tags$div(class = "row-fluid", tags$div(class = "span12", tags$h3("shinyBS Demo"))),
                                       tags$div(class = "row-fluid", tags$div(class = "span6",
                                                                              tags$p(HTML("shinyBS is an R package that makes much of the functionality inherent to Twitter Boostrap available to shiny programmers without the need to make custom <code>html</code> user interfaces. It began as a project to help me better understand how shiny works but I hope it will be useful to others. </p><p>I've created <code>bsDemo()</code> to hopefully help reduce the learning curve for using shinyBS by allowing you to interact with new components directly within a shiny application rather than having to have to rely soley on the help files in R. Each added component is represented by a tab above. Clicking a tab will display a demonstration panel for the component. Each panel is laid out like the example on the right. A brief explanation of a panel follows:")),
                                                                              tags$ul(tags$li("The upper-left section of the panel contains brief explanatory text for the component."),
                                                                                      tags$li("The upper-right section contains a minimal example of how the component could be implemented in a ui.R script."),
                                                                                      tags$li("The lower-right section contains a minimal example of how the component could be implemented or updated from a server.R script."),
                                                                                      tags$li("The lower-middle section contains an interactive example of the component."),
                                                                                      tags$li("The lower-right section contains a control panel that allows you to see how changes to the arguements of the component affect the appearance and/or behaviour in the example component. The code contained in the ui.R and server.R scripts will also update to reflect the changes you make in the control panel.")
                                                                                      ),
                                                                              tags$p(HTML("Please use the tabs above to explore shinyBS functionality. I have made great efforts to make sure that the code all works under multiple use scenarios but if you find a bug, or if you have suggestions for additional functionality, please contact me at <a href='mailto:ebailey@idem.in.gov'>ebailey@idem.in.gov</a>."))
                                                                     ),
                                                                     tags$div(class = "span6", tags$img(src="expic.png")))),
              demoPanel(title = "Navbar",
                        intro = paste0("<p>Navbars offer a space-efficient way to group your inputs together in your shiny app. Most of the customizations in Twitter Bootstrap are available as arguments in the <code>bsNavBar()</code> function. Any element you add to the navbar will align to the left, unless you add them to the <code>rightitems</code> arguments, which will cause them to align to the right.</p>",
                                       "<p>Several of shiny's default inputs have been reformatted to look better in the navbar. For example, <code>textInput</code> has had its label changed to a placeholder and has an added 'width' attribute to help save room. New versions of inputs have been had <code>bsNav</code> prepended to their names.</p>",
                                       "<p>Refer to the help files for shinyBS for additional information about navBar inputs.</p>"
                                       ),
                        controls = tagList(textInput("nbBrand", "Brand", "navbar"),
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
                                             bsNavTextInput("nbText", "Text Input", width = 75),
                                             bsNavButton("nbButton", "Button")
                                             )
                                  )),
                        uiCode = "nbUICode",
                        serverCode = "nbServerCode"
                        ),
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
                        uiCode = "alUICode",
                        serverCode = "alServerCode"
                        ),
              demoPanel(title = "Progress Bars",
                        intro = "Progress bars are created with the <code>bsProgressBar</code> function in UI.R and then modified with <code>updateProgressBar</code> in server.R. Below is a live demonstration of the progress bar functionality. Use the inputs to modify the example progress bar. The example code will shows the code necessary to replicate the current progress bar.",
                        controls = tagList(sliderInput("pbnumb", "Percent Complete", 50, min=0, max=100),
                                           selectInput("pbselect", "Color", c("standard", "warning", "info", "danger", "success")),
                                           radioButtons("pbradio", "Style", c("none", "striped", "animated")),
                                           checkboxInput("pbcb", "Hidden", FALSE)),
                        example = bsProgressBar("pb1", 50, color="success", animate=TRUE),
                        uiCode = "pbUICode",
                        serverCode = "pbServerCode"
              ),
              demoPanel(title = "TypeAhead",
                        intro = "TypeAhead boxes are special versions of textboxes that help lead the user to acceptable inputs. They are created with the <code>bsTypeAhead()</code> function and can be updated with <code>updateTypeAhead()</code>. You can set the minimum match length and number of items to display at creation but these properties cannot be changed by <code>updateTypeAhead()</code>.",
                        controls = tagList(textInput("taLabel", "Label", "TypeAhead:"),
                                           selectInput("taChoice", "Choices", c("Pollutants", "Fruits and Vegetables", "Animals"))
                                           ),
                        example = bsTypeAhead("ta1", label = "TypeAhead:", choices = pollutants, items=4),
                        uiCode = "taUICode",
                        serverCode = "taServerCode"
              ),
              demoPanel(title = "Tooltips and Popovers",
                        intro = "<p>Tooltips and popovers are added in very similar ways. Tooltips can be added to any element with an <code>inputId</code> or an <code>outputId</code> by using <code>bsTooltip()</code> in ui.R, or <code>addTooltip()</code> in server.R.</p><p>Some tooltips and popovers have already been added to the example below. These are used to illustrate how they can be added in the ui.R script. You can add your own tooltips and popovers from the control panel. The code for these will be shown in the server.R script.",
                        controls = tagList(selectInput("tpTarget", "Target", c("link", "slider", "select", "text", "plot")),
                                           radioButtons("tpType", "Type", choices = c("Tooltip", "Popover"), selected= "Tooltip"),
                                           textInput("tpTitle", "Title", "A tooltip"),
                                           conditionalPanel("input.tpType == 'Popover'", textInput("tpContent", "Content", "This is content. Isn't it <b>great!</b>")),
                                           selectInput("tpPlacement", "Placement", c("top", "bottom", "left", "right")),
                                           radioButtons("tpTrigger", "Triggers", choices = c("click", "hover", "focus", "manual"), selected="hover"),
                                           actionButton("tpAdd", "Add")),
                        example = tagList(tags$p(HTML("This is some example text. It is here so that I can put a <a id = \"tplink\" href = \"#\">link</a> in the example. I've given the link an id attribute so that tooltips and popovers can be assigned to it. Otherwise this example is an expansion of the '01_Hello' example that is part of shiny. ")),
                                          tags$div(class = "row-fluid",
                                                   tags$div(class = "span3 well control-panel",
                                                            sliderInput("tpobs", "Number of observations:", min = 1, max = 1000, value = 500),
                                                            selectInput("tpdist", "Distribution", choices = c("Normal", "Lognormal", "Uniform", "Exponential")),
                                                            textInput("tptitle", "Plot Title", "A Plot")
                                                            ),
                                                   tags$div(class = "span9",
                                                            plotOutput("tpplot")
                                                            )
                                          ),
                                          bsTooltip("tpobs", "This changes the sample size of the random data set.", "right"),
                                          bsTooltip("tpdist", "This allows changes to the distribution", "right"),
                                          bsTooltip("tptitle", "Add a custom title to the plot", "right"),
                                          bsPopover("tpplot", "Boxplot", "I really wanted to have a boxplot based on the same dataset as the histogram appear in this box. Unfortunately, it appears that popovers are written when they are shown and destroyed when they are hidden so there is nothing persistent for shiny to bind to. So instead of a plot you get this text...", trigger="click", placement="right")
                        ),
                        uiCode = "tpUICode",
                        serverCode = "tpServerCode"
              ),
              demoPanel(title = "Collapse",
                        intro = "Collapses (sometimes called accordions) are an alternative way to segment information and free up space in your shiny app. They have been designed to work in a very similar way to <code>tabsetPanel()</code> and <code>tabPanel()</code>. Create a collapse group with <code>bsCollapse()</code> and include any number of panels in it with <code>bsCollapsePanel()</code>. ",
                        controls = tagList(tags$p("There is currently no working update function for bsCollapse()"),
                                           tags$h5("Output"),
                                           textOutput("coValue")),
                        example = bsCollapse(multiple = FALSE, open = c("col1"), id = "collapse1",
                          bsCollapsePanel("Collapse #1", "Cell treachery spearwife night's watch, tower suckling pig, drink, your king commands it spare me your false courtesy tourney. Feed it to the goats, seven hells lord of light as high as honor in his cups. Sword greyscale old bear none so wise godswood the last of the dragons rouse me not. No foe may pass bloody mummers, let me soar spiced wine your grace honed and ready fire.", id="col1", value = "test1"),
                          bsCollapsePanel("Collapse #2", actionButton("btn123", "A Button"), textInput("txt1234", "A Text Input"), id="col2", value = "test2"),
                          bsCollapsePanel("Collapse #3", plotOutput("testPlot1"), id="col3", value = "test3")),
                        uiCode = "coUICode",
                        serverCode = "coServerCode"
              )
    )
))