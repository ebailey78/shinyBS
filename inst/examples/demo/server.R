library(shiny)
library(shinyBS)
pollutants <- c('Acetone', 'Acrolein', 'Benzene', 'Benzyl Chloride', 'Bromodichloromethane', 'Bromoform', 'Bromomethane', '1,3-Butadiene', 'Carbon Disulfide', 'Carbon Tetrachloride', 'Chlorobenzene', 'Chloroethane', 'Chloroform', 'Chloromethane', 'Cyclohexane', 'Dibromochloromethane', '1,2-Dibromoethane', 'm-Dichlorobenzene', 'p-Dichlorobenzene', 'o-Dichlorobenzene', 'Dichlorodifluoromethane (F-12)', '1,1-Dichloroethane', '1,2-Dichloroethane', 't-1,2-Dichloroethene', 'c-1,2-Dichloroethene', 'Dichloromethane', '1,2-Dichloropropane', 'c-1,3-Dichloropropene', 't-1,3-Dichloropropene', 'Dichloro-Tetrafluoroethane (F-114)', '1,4-Dioxane', 'Ethanol', 'Ethyl Acetate', 'Ethylbenzene', 'p-Ethyltoluene', 'Heptane', 'Hexachlorobutadiene', 'Hexane', 'Isopropanol', 'Methyl Ethyl Ketone (MEK)', 'Methyl Isobutyl Ketone (MIBK)', 'Methyl n-Butyl Ketone (MBK)', 'Methyl Tert-Butyl Ether (MTBE)', 'Propene', 'Styrene', '1,1,2,2-Tetrachloroethane', 'Tetrachloroethene (PCE)', 'Tetrahydrofuran (THF)', 'Toluene', 'Trichlorotrifluoroethane (F-113)', '1,2,4-Trichlorobenzene', '1,1,1-Trichloroethane', '1,1,2-Trichloroethane', 'Trichloroethene (TCE)', 'Trichlorofluoromethane (F-11)', '1,3,5-Trimethylbenzene', '1,2,4-Trimethylbenzene', 'Vinyl Acetate', 'Vinyl Chloride', 'Vinylidene Chloride', 'o-Xylene', 'm+p-Xylenes')
fruits <- c("Apple", "Banana", "Pear", "Peach", "Starfruit", "Orange", "Grapefruit", "Lemon", "Strawberry", "Blueberry", "Raspberry", "Persimmon", "Brocolli", "Cauliflower", "Green Beans", "Spinach", "Lettuce", "Asparagus", "Celery", "Olives", "Kale", "Arugula", "Artichokes", "Zuchinni", "Squash", "Watermellon", "Pumpkin", "Carrots", "Cucumber", "Grapes", "Onion", "Peas", "Shallots", "Tomato", "Tomatillo", "Yams")
animals <- c("Cat", "Dog", "Mouse", "Rat", "Opossum", "Raccoon", "Fox", "Deer", "Sqirrel", "Chipmunk", "Black Bear", "Polar Bear", "Grizzly Bear", "Lion", "Tiger", "Monkey", "Gorilla", "Chimpanzee", "Bonobo", "Lemur", "Meerkat", "Pig", "Cow", "Horse", "Chicken", "Goose", "Duck", "Sparrow", "African Swallow", "European Swallow", "Dove", "Hawk", "Eagle", "Crow", "Albatross", "Gazelle", "Cougar", "Hippo", "Rhino", "Kangaroo", "Panda", "Koala", "Rattlesnake", "Snake", "Lizard", "Salamander", "Shark", "Whale", "Dolphin", "Seal", "Sealion", "Otter", "Badger", "Groundhog", "Manatee", "Walrus", "Bass", "Sunfish", "Guppy", "Trout", "Tuna", "Salmon", "Goldfish", "Stingray", "Jellyfish")

shinyServer(function(input, output, session) {
  
  #Navbar Updater
  output$nbCode <- renderText({
    
    txt <- paste0("modifyNavBar(session, \"navBar\", brand = \"", input$nbBrand, "\", fixed = ", input$nbFixed, ", inverse = ", input$nbInvert, ")")
    eval(parse(text=txt))
    return(txt)
    
    #modifyNavBar(session, "navBar", brand=input$nbBrand, fixed = input$nbFixed, inverse = input$nbInvert)
    
  })
  
  #Navbar demo table generator
  output$nbDemo <- renderTable({
    
    tb <- rbind(
      c("Link as ActionButton", input$nbLink1),
      c("Dropdown", input$nbdd),
      c("Toggle Link", input$nbLink2),
      c("Button", input$nbButton),
      c("Text Input", input$nbText),
      c("TypeAhead", input$nbTA),
      c("Date Range Input", paste(input$nbDateRange[1], "-", input$nbDateRange[2])))
    
    colnames(tb) <- c("Input", "Value")
    
    return(tb)
    
  }, include.rownames=FALSE)
  
  #Progress Bar Demo
  output$pbCode <- renderText({
    
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
    return(txt)
  })

  #TypeAhead Demo
  output$taCode <- renderText({
    
    
    choice <- switch(input$taChoice,
                     "Pollutants" = "pollutants",
                     "Fruits and Vegetables" = "fruits",
                     "Animals" = "animals")
    
    txt <- paste0("updateTypeAhead(session, inputId = \"ta1\", label = \"", input$taLabel, "\", choices = ", choice, ")")
    
    eval(parse(text=txt))
    
    return(txt)
    
  })
  
  # Alert Code Generator
  output$alCode <- renderText({
    
    txt = "createAlert(session, inputId = \"alert_anchor\", "
    if(input$alTitle) txt = paste0(txt, " title = \"...\", ")
    txt = paste0(txt, " message = \"...\",")
    txt = paste0(txt, " type = \"", input$alType, "\", ")
    txt = paste0(txt, " dismiss = ", input$alDis, ", block = ", input$alBlock, ", append = ", input$alAppend, ")")
    
    return(txt)
    
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
  
  output$ttCode <- renderText({
    
    if(input$ttTarget == "button") {
      target="button1"
    } else {
      target = "text1"
    }
    
    txt <- "## In ui.R: <br />"
    txt <- paste0(txt, "bsTooltip(id = \"", target, "\", title = \"", input$ttTitle, "\", placement = \"", input$ttPlacement, "\", trigger = ", deparse(input$ttTrigger), ")")
    txt <- paste0(txt, "<br /><br /> ## In server.R: <br />")
    txt <- paste0(txt, "addTooltip(session, id = \"", target, "\", title = \"", input$ttTitle, "\", placement = \"", input$ttPlacement, "\", trigger = ", deparse(input$ttTrigger), ")")
    return(HTML(txt))
    
  })
  
  # Tooltip creator
  ttCreate <- observe({
    
    if(input$ttAdd > 0) {
    
    target <- isolate(input$ttTarget)
    title <- isolate(input$ttTitle)
    placement <- isolate(input$ttPlacement)
    trigger <- isolate(input$ttTrigger)
    
    if(target == "button") {
      target = "button1"
    } else {
      target = "text1"
    }
    
    removeTooltip(session, target)
    addTooltip(session, target, title, placement, trigger)
    
    }
    
  })
    
  output$poCode <- renderText({
    
    if(input$poTarget == "button") {
      target="button2"
    } else {
      target = "text2"
    }
    
    txt <- "## In ui.R: <br />"
    txt <- paste0(txt, "bsPopover(id = \"", target, "\", title = \"", input$ttTitle, "\", content = \"", input$poContent, "\", placement = \"", input$poPlacement, "\", trigger = ", deparse(input$poTrigger), ")")
    txt <- paste0(txt, "<br /><br /> ## In server.R: <br />")
    txt <- paste0(txt, "addPopover(session, id = \"", target, "\", title = \"", input$ttTitle, "\", content = \"", input$poContent, "\", placement = \"", input$poPlacement, "\", trigger = ", deparse(input$poTrigger), ")")
    return(HTML(txt))
    
  })
  
  # popover creator
  poCreate <- observe({
    
    if(input$poAdd > 0) {
      
      target <- isolate(input$poTarget)
      title <- isolate(input$poTitle)
      content <- isolate(input$poContent)
      placement <- isolate(input$poPlacement)
      trigger <- isolate(input$poTrigger)
    
      if(target == "button") {
        target = "button2"
      } else {
        target = "text2"
      }

      removePopover(session, target)
      addPopover(session, target, title, content, placement, trigger)
      
    }
    
  })
  
})