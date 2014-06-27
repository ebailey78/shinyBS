library(shiny)
library(shinyBS)

styles <- c("default", "primary", "info", "success", "warning", "danger", "inverse", "link")
sizes <- c("large", "standard", "small", "mini")
block <- c(FALSE, TRUE)
disabled <- c(FALSE, TRUE)
val <- c(FALSE, TRUE)

g <- expand.grid(styles, sizes, block, disabled, stringsAsFactors = FALSE)

actBtns <- list()
togBtns <- list()
actText <- list()
togText <- list()

for(r in seq(nrow(g))) {
  id <- paste(g[r, 1], g[r, 2], sep = "_")
  if(g[r, 3]) id <- paste0(id, "_block")
  if(g[r, 4]) id <- paste0(id, "_disabled")
  
  actBtns <- c(actBtns,
               bsActionButton(paste0("act_", id), "actionButton", 
                              style = g[r, 1], size = g[r, 2],
                              block = g[r, 3], disabled = g[r, 4])
               )
  
  actText <- c(actText,
               list(textOutput(paste0("t_act_", id)))
               )
  
  togBtns <- c(togBtns,
               bsToggleButton(paste0("tog_", id), "toggleButton", 
                              style = g[r, 1], size = g[r, 2],
                              block = g[r, 3], disabled = g[r, 4])
               )
  togText <- c(togText,
               list(textOutput(paste0("t_tog_", id)))
  )
  
}
