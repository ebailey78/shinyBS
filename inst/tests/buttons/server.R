library(shiny)
library(shinyBS)

shinyServer(function(input, output, server) {
  
  for(r in seq(nrow(g))) {
    id <- paste(g[r, 1], g[r, 2], sep = "_")
    if(g[r, 3]) id <- paste0(id, "_block")
    if(g[r, 4]) id <- paste0(id, "_disabled")

    op <- paste0("t_act_", id)
    ip <- paste0("act_", id)

    eval(parse(text = paste0("output$",  paste0("t_act_", id), " <- renderText({input$", paste0("act_", id), "})")))
    eval(parse(text = paste0("output$",  paste0("t_tog_", id), " <- renderText({input$", paste0("tog_", id), "})")))
  }

})