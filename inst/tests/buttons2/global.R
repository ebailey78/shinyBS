library(shiny)
library(shinyBS)

styles <- c("default", "primary", "info", "success", "warning", "danger", "inverse", "link")
sizes <- c("large", "standard", "small", "mini")
block <- c(FALSE, TRUE)
disabled <- c(FALSE, TRUE)

g <- expand.grid(styles, sizes, block, disabled, stringsAsFactors = FALSE)

for(r in seq(nrow(g))) {
  
  
  
  
}