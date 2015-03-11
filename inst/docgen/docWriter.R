library(tools)

family <- "Alerts"
functions <- c("bsAlert", "createAlert", "closeAlert")
path <- "C:/R/shinyBS"

createDocPage <- function(con = stdout(), family, functions, path = "C:/R/shinyBS") {
  
  components <- c()
  componentNav <- c()
  
  writeDesc <- function(desc = Rd$description) {
    
    html <- list("\\code" = "code", "\\bold" = "strong")
    
    inPara <- FALSE
    tags <- tools:::RdTags(desc)
    i <- 1
    op <- ""
    while(i <= length(desc)) {
      if(tags[i] == "TEXT") {
        if(tags[i] == "\n") {
          if(inPara) {
            op <- paste0(op, "</p>\n")
            inPara <- FALSE
          }
          op <- paste0(op, "<p>\n")
          inPara <- TRUE
        } else {
          op <- paste0(op, desc[[i]])
        }
      } else if(tags[i] %in% names(html)) {
        otag <- paste0("<", html[[tags[i]]], ">") 
        ctag <- paste0("</", html[[tags[i]]], ">")
        op <- paste0(op, otag, desc[[i]], ctag)
      }
      i = i + 1
    }
    
    return(op)
    
  }
  
  writeArgs <- function(args) {
    
    args <- args[tools:::RdTags(args) == "\\item"]
    template <- readLines("C:/R/shinyBS/inst/docgen/parameter.txt")
    op <- c()
    
    i <- 1
    while(i <= length(args)) {
      
      arg <- args[[i]]
      item <- unlist(arg[[1]])
      def <- writeDesc(arg[[2]])
      
      arg <- gsub("<%=param %>", item, template, fixed = TRUE)
      arg <- gsub("<%=def %>", def, arg, fixed = TRUE)
      
      op <- c(op, arg)
      
      i = i + 1
      
    }
    
    return(paste0(op, collapse = "\n"))
    
  }
  
  name_Rd <- function(Rd) { 
    tags <- tools:::RdTags(Rd)
    for(i in seq(length(tags))) {
      if(tags[i] != "\\section") {
        n <- gsub("\\", "", tags[i], fixed = TRUE)
      } else {
        n <- unlist(Rd[[i]][[1L]])
        Rd[[i]] <- Rd[[i]][[2L]]
      }
      names(Rd)[i] <- n
    }
    return(Rd)
  }
  
  writeName <- function(Rd) {
    unlist(Rd$name)
  }
  
  writeExample <- function(ex) {
    ex <- ex[[2]]
    ex <- paste0(ex, collapse = "")
    return(ex)
  }
  
  component_template <- readLines("C:/R/shinyBS/inst/docgen/component.txt")
  
  for(fn in functions) {
    
    componentNav <- c(componentNav, paste0("<li><a href = '#", fn, "'>", fn, "</a></li>"))
    
    infile <- file.path(path, "man", paste0(fn, ".Rd"))
    Rd <- name_Rd(tools:::prepare_Rd(parse_Rd(infile, verbose = FALSE)))
    
    comp <- gsub("<%=name %>", writeName(Rd), component_template, fixed = TRUE)
    comp <- gsub("<%=description %>", writeDesc(Rd$description), comp, fixed = TRUE)
    comp <- gsub("<%=usage %>", paste0(unlist(Rd$usage[-1]), collapse = ""), comp, fixed = TRUE)
    comp <- gsub("<%=params %>", writeArgs(Rd$arguments), comp, fixed = TRUE)
    
    components <- c(components, comp)
    
  }
        
  componentNav <- paste0(componentNav, collapse = "\n")
  components <- paste0(components, collapse = "\n")
  
  infile <- file.path(path, "man", paste0(family, ".Rd"))
  Rd <- name_Rd(tools:::prepare_Rd(parse_Rd(infile, verbose = FALSE)))
  
  template <- readLines("C:/R/shinyBS/inst/docgen/document.txt")
  
  ex <- writeExample(Rd$examples)
  
  template <- gsub("<%=family %>", writeName(Rd), template, fixed = TRUE)
  template <- gsub("<%=componentnav %>", componentNav, template, fixed = TRUE)
  template <- gsub("<%=familydescription %>", writeDesc(Rd$description), template, fixed = TRUE)
  template <- gsub("<%=familydetails %>", writeDesc(Rd$details), template, fixed = TRUE)
  template <- gsub("<%=components %>", components, template, fixed = TRUE)
  template <- gsub("<%=changes %>", writeDesc(Rd$Changes), template, fixed = TRUE)
  template <- gsub("<%=example %>", writeExample(Rd$examples), template, fixed = TRUE)
  
  writeLines(template, con)
  
}
  