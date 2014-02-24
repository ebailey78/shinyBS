library(shiny)
library(shinyBS)

pollutants <- c('Acetone', 'Acrolein', 'Benzene', 'Benzyl Chloride', 'Bromodichloromethane', 'Bromoform', 'Bromomethane', '1,3-Butadiene', 'Carbon Disulfide', 'Carbon Tetrachloride', 'Chlorobenzene', 'Chloroethane', 'Chloroform', 'Chloromethane', 'Cyclohexane', 'Dibromochloromethane', '1,2-Dibromoethane', 'm-Dichlorobenzene', 'p-Dichlorobenzene', 'o-Dichlorobenzene', 'Dichlorodifluoromethane (F-12)', '1,1-Dichloroethane', '1,2-Dichloroethane', 't-1,2-Dichloroethene', 'c-1,2-Dichloroethene', 'Dichloromethane', '1,2-Dichloropropane', 'c-1,3-Dichloropropene', 't-1,3-Dichloropropene', 'Dichloro-Tetrafluoroethane (F-114)', '1,4-Dioxane', 'Ethanol', 'Ethyl Acetate', 'Ethylbenzene', 'p-Ethyltoluene', 'Heptane', 'Hexachlorobutadiene', 'Hexane', 'Isopropanol', 'Methyl Ethyl Ketone (MEK)', 'Methyl Isobutyl Ketone (MIBK)', 'Methyl n-Butyl Ketone (MBK)', 'Methyl Tert-Butyl Ether (MTBE)', 'Propene', 'Styrene', '1,1,2,2-Tetrachloroethane', 'Tetrachloroethene (PCE)', 'Tetrahydrofuran (THF)', 'Toluene', 'Trichlorotrifluoroethane (F-113)', '1,2,4-Trichlorobenzene', '1,1,1-Trichloroethane', '1,1,2-Trichloroethane', 'Trichloroethene (TCE)', 'Trichlorofluoromethane (F-11)', '1,3,5-Trimethylbenzene', '1,2,4-Trimethylbenzene', 'Vinyl Acetate', 'Vinyl Chloride', 'Vinylidene Chloride', 'o-Xylene', 'm+p-Xylenes')
fruits <- c("Apple", "Banana", "Pear", "Peach", "Starfruit", "Orange", "Grapefruit", "Lemon", "Strawberry", "Blueberry", "Raspberry", "Persimmon", "Brocolli", "Cauliflower", "Green Beans", "Spinach", "Lettuce", "Asparagus", "Celery", "Olives", "Kale", "Arugula", "Artichokes", "Zuchinni", "Squash", "Watermellon", "Pumpkin", "Carrots", "Cucumber", "Grapes", "Onion", "Peas", "Shallots", "Tomato", "Tomatillo", "Yams")
animals <- c("Cat", "Dog", "Mouse", "Rat", "Opossum", "Raccoon", "Fox", "Deer", "Squirrel", "Chipmunk", "Black Bear", "Polar Bear", "Grizzly Bear", "Lion", "Tiger", "Monkey", "Gorilla", "Chimpanzee", "Bonobo", "Lemur", "Meerkat", "Pig", "Cow", "Horse", "Chicken", "Goose", "Duck", "Sparrow", "African Swallow", "European Swallow", "Dove", "Hawk", "Eagle", "Crow", "Albatross", "Gazelle", "Cougar", "Hippo", "Rhino", "Kangaroo", "Panda", "Koala", "Rattlesnake", "Snake", "Lizard", "Salamander", "Shark", "Whale", "Dolphin", "Seal", "Sealion", "Otter", "Badger", "Groundhog", "Manatee", "Walrus", "Bass", "Sunfish", "Guppy", "Trout", "Tuna", "Salmon", "Goldfish", "Stingray", "Jellyfish")

baseUI <- function(main.code = "\tHello World!\n") {
  
  txt1 <-              "library(shiny)\n"
  txt1 <- paste0(txt1, "library(shinyBS)\n")
  txt1 <- paste0(txt1, "\n")
  txt1 <- paste0(txt1, "shinyUI(basicPage(\n")
  
  txt2 <- "))"

  as.character(tagList(tags$span(class = "extracode", txt1),
               tags$span(class = "maincode", main.code),
               tags$span(class = "extracode", txt2)))  
  
}

baseServer <- function(main.code = "") {
  
  txt1 <- "library(shiny)\n"
  txt1 <- paste0(txt1, "library(shinyBS)\n")
  txt1 <- paste0(txt1, "\n")
  txt1 <- paste0(txt1, "shinyServer(function(input, output, session) {\n")
  
  txt2 <- "})"
  
  as.character(tagList(tags$div(class = "extracode", txt1),
                       tags$div(class = "maincode", main.code),
                       tags$div(class = "extracode", txt2)))
  
}

shinyServer(function(input, output, session) {
  
###### CODE TO CONTROL NAVBAR DEMO ######
  
  # Navbar UI Code Example
  output$nbUICode <- renderText({    
    baseUI(

"  bsNavBar(\"navBar\", brand = \"shinyBS\", 
    bsNavLink(\"nbLink1\", \"Link\", href=\"#\"),
    bsNavDropDown(\"nbdd\", \"Dropdown\", c(\"Apple\", \"Pear\", \"Banana\", \"Grapes\", \"Orange\")),
    bsNavDivider(), 
    bsNavToggleLink(\"nbLink2\", \"Toggle\", value=TRUE),        
    rightItems = list(
<<<<<<< HEAD
      bsNavTextInput(\"nbText\", \"Text Input\", width=75),
      bsNavButton(\"nbButton\", \"Button\")
=======
      bsNavDateInput(\"nbDate\", \"Date\"),
      bsNavButton(\"nbButton\", \"Button\"),
      bsNavTextInput(\"nbText\", \"Text Input\", width=40)
>>>>>>> 780e4925b60f43f9495cfb96ce1dd575010d4473
    )
  )
"       
    )
  })
  
  # Navbar Server Code Example
  output$nbServerCode <- renderText({
    baseServer(
paste0("  observe({
    input$some_input # This causes the observer to take a dependency on input$some_input

    updateNavBar(session, \"navBar\", brand = \"", input$nbBrand, "\", fixed = ", input$nbFixed, ", inverse = ", input$nbInvert, ")
  })")
  )
  
  })
  
  # Navbar demo table generator
  output$nbDemo <- renderTable({
    
    tb <- rbind(
      c("Link as ActionButton", input$nbLink1),
      c("Dropdown", input$nbdd),
      c("Toggle Link", input$nbLink2),
      c("Button", input$nbButton),
<<<<<<< HEAD
      c("Text Input", input$nbText))
=======
      c("Text Input", input$nbText),
      c("Date Input", as.character(input$nbDate)))
>>>>>>> 780e4925b60f43f9495cfb96ce1dd575010d4473
    
    colnames(tb) <- c("Input", "Value")
    
    return(tb)
    
  }, include.rownames=FALSE)
  
  # Changes example navbar based on changes in control panel
  nbObserve <- observe({
    
    updateNavBar(session, "navBar", brand = input$nbBrand, fixed = input$nbFixed, inverse = input$nbInvert)
    
  })

###### CODE TO CONTROL ALERT DEMO ######

  # Alert UI Code Example
  output$alUICode <- renderText({
    baseUI(paste0("\t", "bsAlert(inputId = \"alert_anchor\")", "\n"))    
  })

  # Alert Server Code Example
  output$alServerCode <- renderText({
    
    txt <- "createAlert(session, inputId = \"alert_anchor\","
    if(input$alTitle) txt <- paste0(txt, "\n\t\ttitle = \"TITLE GOES HERE\",")
    txt <- paste0(txt, "\n\t\tmessage = \"MESSAGE GOES HERE\",")
    txt <- paste0(txt, "\n\t\ttype = \"", input$alType, "\",")
    txt <- paste0(txt, "\n\t\tdismiss = ", input$alDis, ",\n\t\tblock = ", input$alBlock, ",\n\t\tappend = ", input$alAppend, "\n\t)")
    
    baseServer(paste0("\t", txt, "\n"))
    
  })
  
  #Alert Creator
  alCreate <- observe({

    input$alCreate
    
      title <- isolate(input$alTitle)
      dismiss <- isolate(input$alDis)
      type <- isolate(input$alType)
      block <- isolate(input$alBlock)
      append <- isolate(input$alAppend)
      
      message <- includeHTML("http://www.gameofipsum.com/api/?type=html&paragraphs=1&percent=0")
      message <- as.vector(substr(message, 4, nchar(message) - 4))
      
      if(title) {
        tt <- switch(type,
                     "warning" = "Warning!",
                     "danger" = "Danger!",
                     "info" = "Just so you know...",
                     "success" = "Congratulations!")
      }
          
      txt <- "createAlert(session, \"alert_anchor\","
      if(title) txt <- paste0(txt, " title = \"", tt, "\",")
      txt <- paste0(txt, " message = \"", message, "\",")
      txt <- paste0(txt, " type = \"", type, "\",")
      txt <- paste0(txt, " dismiss = ", dismiss, ",")
      txt <- paste0(txt, " block = ", block, ",")
      txt <- paste0(txt, " append = ", append, ")")
      
      eval(parse(text=txt))
    
  })

###### CODE TO CONTROL PROGRESS BAR DEMO ######

  # Progress Bar UI Code Demo
  output$pbUICode <- renderText({
    baseUI("\tbsProgressBar(\"pb1\", value = 50)\n")
  })

  # Progress Bar Server Code Demo
  output$pbServerCode <- renderText({
    
    if(input$pbradio == "none") {
      striped=FALSE
      animate=FALSE
    } else if(input$pbradio == "striped") {
      striped=TRUE
      animate=FALSE
    } else {
      striped=TRUE
      animate=TRUE
    }
    
    txt <- paste0("updateProgressBar(session, inputId = \"pb1\", value = ", input$pbnumb, ", visible = ", !input$pbcb,", color = \"", input$pbselect, "\", striped = ", striped, ", animate = ", animate, ")")
    eval(parse(text=txt))
    return(baseServer(paste("\t", txt)))
    
  })
 

###### CODE TO CONTROL TYPEAHEAD DEMO ######

  output$taUICode <- renderText({
    
    txt <- "\t# This is the variable containing the source for the typeahead. It has been truncated to save space.\n"
    txt <- paste0(txt, "\tpollutants = c('Acetone', 'Acrolein', 'Benzene', 'Benzyl Chloride', ...)\n")
    txt <- paste0(txt, "\n")
    txt <- paste0(txt, "\tbsTypeAhead(inputId = \"ta1\", label = \"TypeAhead:\", choices = pollutants)\n")
    baseUI(txt)
    
  })

  output$taServerCode <- renderText({

    choice <- switch(input$taChoice,
                     "Pollutants" = "pollutants",
                     "Fruits and Vegetables" = "fruits",
                     "Animals" = "animals")
    code <- paste0("updateTypeAhead(session, inputId = \"ta1\", label = \"", input$taLabel, "\", choices = ", choice, ")")
    
    txt <- "\t# These are additional variables containing sources for the typeahead. They have also been truncated to save space.\n"
    txt <- paste0(txt, "\tpollutants = c('Acetone', 'Acrolein', 'Benzene', 'Benzyl Chloride', ...)\n")
    txt <- paste0(txt, "\tfruits = c('Apple', 'Banana', 'Pear', 'Peach', 'Orange', 'Strawberre')\n")
    txt <- paste0(txt, "\tanimals = c('Cat', 'Dog', 'Deer', 'Squirrel', 'Opossum', 'Fox', 'Sparrow')\n")
    txt <- paste0(txt, "\n")
    txt <- paste0(txt, code, "\n")

    eval(parse(text=code))
    
    return(baseServer(txt))    
    
  })

<<<<<<< HEAD
###### CODE TO CONTROL TOOLTIPS AND POPOVERS DEMO ######

  # Code to control Tooltips and Popovers example page mockup
=======
###### CODE TO CONTROL TYPEAHEAD DEMO ######

  # Code to control Tooltips and Popovers example page mockup
  
>>>>>>> 780e4925b60f43f9495cfb96ce1dd575010d4473
  randData <- reactive({
    
    rfunc <- switch(input$tpdist,
                    "Normal" = rnorm,
                    "Lognormal" = rlnorm,
                    "Uniform" = runif,
                    "Exponential" = rexp)
    
    rfunc(input$tpobs)
    
  })
<<<<<<< HEAD
  output$tpplot <- renderPlot({hist(randData(), main=input$tptitle)})

  # Generates text for serverside tooltip and/or popover add.
  tpText <- reactive({
    
    target <- switch(input$tpTarget,
                    "link" = "tplink",
                    "slider" = "tpobs",
                    "select" = "tpdist",
                    "text" = "tptitle")
    func <- switch(input$tpType,
                  "Tooltip" = "addTooltip",
                  "Popover" = "addPopover")
    txt <- paste0(func, "(session, id = ", deparse(target), ", title = ", deparse(input$tpTitle))
    if(func == "addPopover") txt <- paste0(txt, ", content = ", deparse(input$tpContent))
    txt <- paste0(txt, ", placement = ", deparse(input$tpPlacement), ", trigger = ", deparse(input$tpTrigger), ")")

    return(txt)
    
  })

  # Tooltips and Popovers Server Code Example
  output$tpServerCode <- renderText({baseServer(paste0("\t", tpText()))})

  # Tooltips and Popovers UI Code Example
  output$tpUICode <- renderText({
    baseUI(
      '  tags$p(HTML("This is some example text. It is here so that I can put a <a id = \"tpLink\" href = \"#\">link</a> in the example. ...")),
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
  bsPopover("tpplot", "Boxplot", "I really wanted to have a boxplot based on the same dataset as the histogram appear ...", trigger="click", placement="right")'
)
  })
  
  # Observer to add tooltips/popovers when the "Add" Button is clicked.
  tpObs <- observe({
    if(input$tpAdd > 0) {
      eval(parse(text = isolate(tpText())))
    }
  })

###### CODE TO CONTROL COLLAPSE DEMO ######

  output$coUICode <- renderText({
    
    ft <- '\tbsCollapse(multiple = TRUE, open = col1, id = "collapse1",\n'
    ft <- paste0(ft, '\t\tbsCollapsePanel("Collapse #1", "Cell treachery spearwife night\'s watch, tower suckling ...", id="col1", value="test1"),\n')
    ft <- paste0(ft, '\t\tbsCollapsePanel("Collapse #2", actionButton("btn123", "A Button"), textInput("txt1234", "A Text Input"), id="col2", value="test2"),\n')
    ft <- paste0(ft, '\t\tbsCollapsePanel("Collapse #3", plotOutput("testPlot1"), id="col3", value="test3")\n')
    ft <- paste0(ft, '\t)\n')
    
    return(baseUI(ft))
    
  })
  
  output$coServerCode <- renderText({"There are currently no server-side functions for Collapse Panels."})

  output$coValue <- renderText({paste("input$collapse1 = ", input$collapse1)})
    
  output$testPlot1 <- renderPlot({plot(rnorm(1000))})

=======

  output$tpplot <- renderPlot({hist(randData(), main=input$tptitle)})
  output$tpboxplot <- renderPlot({boxplot(randData(), main="")})

  tpObs <- observe({
    
    target <- switch(isolate(input$ttTarget),
                    "link" = "tplink",
                    "slider" = "tpobs",
                    "select" = "tpdist",
                    "text" = "tptitle")
    
    
    
  })

#   
#   # Alert Code Generator
#   output$alCode <- renderText({
#     
#     txt = "createAlert(session, inputId = \"alert_anchor\", "
#     if(input$alTitle) txt = paste0(txt, " title = \"...\", ")
#     txt = paste0(txt, " message = \"...\",")
#     txt = paste0(txt, " type = \"", input$alType, "\", ")
#     txt = paste0(txt, " dismiss = ", input$alDis, ", block = ", input$alBlock, ", append = ", input$alAppend, ")")
#     
#     return(txt)
#     
#   })
#   
#   #Alert Creator
#   alCreate <- observe({
# 
#     input$alCreate
#     
#       title <- isolate(input$alTitle)
#       dismiss <- isolate(input$alDis)
#       type <- isolate(input$alType)
#       block <- isolate(input$alBlock)
#       append <- isolate(input$alAppend)
#       
#       message <- includeHTML("http://www.gameofipsum.com/api/?type=html&paragraphs=1&percent=0")
#       message <- as.vector(substr(message, 4, nchar(message) - 4))
#       
#       if(title) {
#         tt <- switch(type,
#                      "warning" = "Warning!",
#                      "danger" = "Danger!",
#                      "info" = "Just so you know...",
#                      "success" = "Congratulations!")
#       }
#           
#       txt <- "createAlert(session, \"alert_anchor\","
#       if(title) txt <- paste0(txt, " title = \"", tt, "\",")
#       txt <- paste0(txt, " message = \"", message, "\",")
#       txt <- paste0(txt, " type = \"", type, "\",")
#       txt <- paste0(txt, " dismiss = ", dismiss, ",")
#       txt <- paste0(txt, " block = ", block, ",")
#       txt <- paste0(txt, " append = ", append, ")")
#       
#       eval(parse(text=txt))
#     
#   })
#   
#   output$ttCode <- renderText({
#     
#     if(input$ttTarget == "button") {
#       target="button1"
#     } else {
#       target = "text1"
#     }
#     
#     txt <- "## In ui.R: <br />"
#     txt <- paste0(txt, "bsTooltip(id = \"", target, "\", title = \"", input$ttTitle, "\", placement = \"", input$ttPlacement, "\", trigger = ", deparse(input$ttTrigger), ")")
#     txt <- paste0(txt, "<br /><br /> ## In server.R: <br />")
#     txt <- paste0(txt, "addTooltip(session, id = \"", target, "\", title = \"", input$ttTitle, "\", placement = \"", input$ttPlacement, "\", trigger = ", deparse(input$ttTrigger), ")")
#     return(HTML(txt))
#     
#   })
#   
#   output$coCode <- renderText({
#     
#     ft <- '# This code, placed inside ui.R, creates the collapse group below (text has been truncated):
# bsCollapse(multiple = TRUE, open = col1, id = "collapse1",
#            bsCollapsePanel("Collapse #1", "Cell treachery spearwife night\'s watch, tower suckling ...", id="col1", value="test1"),
#            bsCollapsePanel("Collapse #2", actionButton("btn123", "A Button"), textInput("txt1234", "A Text Input"), id="col2", value="test2"),
#            bsCollapsePanel("Collapse #3", plotOutput("testPlot1"), id="col3", value="test3"))'
#     
#     ut <- paste0("updateCollapse(session, \"collapse1\", open = ", deparse(input$coOpen), ")")
#     
#     return(paste(ft))
#   })
#   
#   output$coValue <- renderText({paste("input$collapse1 = ", input$collapse1)})
#   
#   # Tooltip creator
#   ttCreate <- observe({
#     
#     if(input$ttAdd > 0) {
#     
#     target <- isolate(input$ttTarget)
#     title <- isolate(input$ttTitle)
#     placement <- isolate(input$ttPlacement)
#     trigger <- isolate(input$ttTrigger)
#     
#     if(target == "button") {
#       target = "button1"
#     } else {
#       target = "text1"
#     }
#     
#     removeTooltip(session, target)
#     addTooltip(session, target, title, placement, trigger)
#     
#     }
#     
#   })
#     
#   output$testPlot1 <- renderPlot({plot(rnorm(1000))})
#   
#   output$poCode <- renderText({
#     
#     if(input$poTarget == "button") {
#       target="button2"
#     } else {
#       target = "text2"
#     }
#     
#     txt <- "## In ui.R: <br />"
#     txt <- paste0(txt, "bsPopover(id = \"", target, "\", title = \"", input$ttTitle, "\", content = \"", input$poContent, "\", placement = \"", input$poPlacement, "\", trigger = ", deparse(input$poTrigger), ")")
#     txt <- paste0(txt, "<br /><br /> ## In server.R: <br />")
#     txt <- paste0(txt, "addPopover(session, id = \"", target, "\", title = \"", input$ttTitle, "\", content = \"", input$poContent, "\", placement = \"", input$poPlacement, "\", trigger = ", deparse(input$poTrigger), ")")
#     return(HTML(txt))
#     
#   })
#   
#   # popover creator
#   poCreate <- observe({
#     
#     if(input$poAdd > 0) {
#       
#       target <- isolate(input$poTarget)
#       title <- isolate(input$poTitle)
#       content <- isolate(input$poContent)
#       placement <- isolate(input$poPlacement)
#       trigger <- isolate(input$poTrigger)
#     
#       if(target == "button") {
#         target = "button2"
#       } else {
#         target = "text2"
#       }
# 
#       removePopover(session, target)
#       addPopover(session, target, title, content, placement, trigger)
#       
#     }
#     
#   })
>>>>>>> 780e4925b60f43f9495cfb96ce1dd575010d4473
  
})
