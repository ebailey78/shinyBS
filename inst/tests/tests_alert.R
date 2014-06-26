context("basic")

library(RSelenium)
library(testthat)
library(shinyBS)

remoteApp <- runRemoteApp(appDir = file.path(getwd(), "alerts"), 
                          port = 5000, launch.browser = TRUE)

remDr <- remoteDriver()
remDr$open(silent = TRUE)
appURL <- "http:127.0.0.1:5000"

test_that("can connect to app", {
  
  remDr$navigate(appURL)
  appTitle <- remDr$getTitle()[[1]]
  expect_equal(appTitle, "shinyBS Alerts Test")
  
})

remDr$close()
close(remoteApp)
