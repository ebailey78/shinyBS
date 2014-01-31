library(shiny)
library(shinyBS)
pollutants <- c('Acetone', 'Acrolein', 'Benzene', 'Benzyl Chloride', 'Bromodichloromethane', 'Bromoform', 'Bromomethane', '1,3-Butadiene', 'Carbon Disulfide', 'Carbon Tetrachloride', 'Chlorobenzene', 'Chloroethane', 'Chloroform', 'Chloromethane', 'Cyclohexane', 'Dibromochloromethane', '1,2-Dibromoethane', 'm-Dichlorobenzene', 'p-Dichlorobenzene', 'o-Dichlorobenzene', 'Dichlorodifluoromethane (F-12)', '1,1-Dichloroethane', '1,2-Dichloroethane', 't-1,2-Dichloroethene', 'c-1,2-Dichloroethene', 'Dichloromethane', '1,2-Dichloropropane', 'c-1,3-Dichloropropene', 't-1,3-Dichloropropene', 'Dichloro-Tetrafluoroethane (F-114)', '1,4-Dioxane', 'Ethanol', 'Ethyl Acetate', 'Ethylbenzene', 'p-Ethyltoluene', 'Heptane', 'Hexachlorobutadiene', 'Hexane', 'Isopropanol', 'Methyl Ethyl Ketone (MEK)', 'Methyl Isobutyl Ketone (MIBK)', 'Methyl n-Butyl Ketone (MBK)', 'Methyl Tert-Butyl Ether (MTBE)', 'Propene', 'Styrene', '1,1,2,2-Tetrachloroethane', 'Tetrachloroethene (PCE)', 'Tetrahydrofuran (THF)', 'Toluene', 'Trichlorotrifluoroethane (F-113)', '1,2,4-Trichlorobenzene', '1,1,1-Trichloroethane', '1,1,2-Trichloroethane', 'Trichloroethene (TCE)', 'Trichlorofluoromethane (F-11)', '1,3,5-Trimethylbenzene', '1,2,4-Trimethylbenzene', 'Vinyl Acetate', 'Vinyl Chloride', 'Vinylidene Chloride', 'o-Xylene', 'm+p-Xylenes')
fruits <- c("Apple", "Banana", "Pear", "Peach", "Starfruit", "Orange", "Grapefruit", "Lemon", "Strawberry", "Blueberry", "Raspberry", "Persimmon", "Brocolli", "Cauliflower", "Green Beans", "Spinach", "Lettuce", "Asparagus", "Celery", "Olives", "Kale", "Arugula", "Artichokes", "Zuchinni", "Squash", "Watermellon", "Pumpkin", "Carrots", "Cucumber", "Grapes", "Onion", "Peas", "Shallots", "Tomato", "Tomatillo", "Yams")
animals <- c("Cat", "Dog", "Mouse", "Rat", "Opossum", "Raccoon", "Fox", "Deer", "Sqirrel", "Chipmunk", "Black Bear", "Polar Bear", "Grizzly Bear", "Lion", "Tiger", "Monkey", "Gorilla", "Chimpanzee", "Bonobo", "Lemur", "Meerkat", "Pig", "Cow", "Horse", "Chicken", "Goose", "Duck", "Sparrow", "African Swallow", "European Swallow", "Dove", "Hawk", "Eagle", "Crow", "Albatross", "Gazelle", "Cougar", "Hippo", "Rhino", "Kangaroo", "Panda", "Koala", "Rattlesnake", "Snake", "Lizard", "Salamander", "Shark", "Whale", "Dolphin", "Seal", "Sealion", "Otter", "Badger", "Groundhog", "Manatee", "Walrus", "Bass", "Sunfish", "Guppy", "Trout", "Salmon", "Goldfish", "Stingray", "Jellyfish")

shinyServer(function(input, output, session) {
  
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
  
  output$alCode <- renderText({
    
    txt = "createAlert(session, inputId = \"alert_anchor\", "
    if(input$alTitle) txt = paste0(txt, " title = \"...\", ")
    txt = paste0(txt, " message = \"...\",")
    txt = paste0(txt, " type = \"", input$alType, "\", ")
    txt = paste0(txt, " dismiss = ", input$alDis, ", block = ", input$alBlock, ", append = ", input$alAppend, ")")
    
    return(txt)
    
  })
  
  nbOb <- observe({
    
    modifyNavBar(session, "navBar", brand=input$nbBrand, fixed = input$nbFixed, inverse = input$nbInvert)
    
  })
  
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
  
  output$nbDemo <- renderTable({
    
    tb <- rbind(
      c("Link as ActionButton", input$nbLink1),
      c("Dropdown", input$nbdd),
      c("Toggle Link", input$nbLink2),
      c("Button", input$nbButton),
      c("Text Input", input$nbText),
      c("TypeAhead", input$nbTA),
      c("Date Input", as.character(input$nbDate)),
      c("Date Range Input", paste(input$nbDateRange[1], "-", input$nbDateRange[2])))
    
    colnames(tb) <- c("Input", "Value")
    
    return(tb)
    
  }, include.rownames=FALSE)
  
  
  output$hist <- renderPlot({
    hist(rnorm(400))
    
  }, width=600)
  
  output$hist1 <- renderPlot({
    hist(rnorm(500))
  })
  
  output$box1 <- renderPlot({
    a <- rnorm(100, 5, 2)
    b <- rnorm(100, 2, 1)
    c <- rnorm(100, 10, 3)
    boxplot(list(a,b,c))
  })
  
})