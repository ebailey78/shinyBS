library(shiny)
library(shinyBS)

anchors <- c("alert1", "alert2")

at <- c(1,2,3,4)
types <- c("warning", "danger", "info", "success")
titles <- c("Warning!", "Oh snap!", "Heads up!", "Well done!")
messages <- c("Best check yo self, you're not looking too good.",
              "Change a few things up and try submitting again. ",
              "This alert needs your attention, but it's not super important. ",
              "You successfully read this important alert message. ")
dismiss <- c(TRUE, FALSE)

g <- expand.grid(anchors, at, dismiss, stringsAsFactors = FALSE)
