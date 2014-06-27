context("Buttons")

appDir = file.path(system.file(package = "shinyBS"), "tests", "buttons")

remoteApp <- runRemoteApp(appDir = appDir, port = 5000, launch.browser = FALSE)

source(file.path(appDir, "global.R"))

remDr <- remoteDriver()
remDr$open(silent = TRUE)
remDr$navigate("http:127.0.0.1:5000")

#Convenience Functions
id <- findElement(remDr, "id")
css <- findElement(remDr, "css selector")
cscss <- findChildren("css selector")

actButs <- cscss(id("actionButs"), "button.sbs-action-button")
togButs <- cscss(id("toggleButs"), "button.sbs-toggle-button")

test_that("can connect to app", {
  appTitle <- remDr$getTitle()[[1]]
  expect_equal(appTitle, "shinyBS Buttons Test")
})

test_that("Action Buttons Work", {
  Sys.sleep(1)
  for(but in actButs) {
    bid <- getId(but)
    expect_true(checkInputBinding(id(bid)), label = bid, info = "binding check")
    txt <- id(paste0("t_", bid))  
    class <- getClass(but)
    opts <- unlist(strsplit(bid, "_"))[-1]
    classes <- unlist(strsplit(class, " "))
    for(i in seq(2)) {
      v <- as.integer(txt$getElementText()[[1]][1])
      id(bid)$clickElement()
      Sys.sleep(0.3)
      if(hasClass(id(bid), "disabled")) {
        expect_equal(as.integer(txt$getElementText()[[1]][1]), v,
                     label = bid, info = paste("disabled click check:", i))
      } else {
        expect_more_than(as.integer(txt$getElementText()[[1]][1]), v,
                         label = bid, info = paste("enabled click check:", i))
      }
    }
    for(opt in opts) {
      if(opt == "disabled") {
        expect_true(hasClass(id(bid), "disabled"), 
                    info = 'action disabled check', 
                    label = bid)
      } else {
        expect_true(hasClass(id(bid), paste0("btn-", opt)), 
                    info = paste("action", opt, "check"), 
                    label = bid)
      }
    }
  }
})
 
test_that("Toggle Buttons Work", {
  Sys.sleep(1)
  for(but in togButs) {
    bid <- getId(but)
    expect_true(checkInputBinding(id(bid)), label = bid, info = "binding check")
    txt <- id(paste0("t_", bid))  
    class <- getClass(but)
    opts <- unlist(strsplit(bid, "_"))[-1]
    classes <- unlist(strsplit(class, " "))
    for(i in seq(2)) {
      v <- as.logical(txt$getElementText()[[1]][1])
      id(bid)$clickElement()
      Sys.sleep(0.3)
      if(hasClass(id(bid), "disabled")) {
        expect_equal(as.logical(txt$getElementText()[[1]][1]), v,
                     label = bid, info = paste("click check:", i))
      } else {
        expect_equal(as.logical(txt$getElementText()[[1]][1]), !v,
                     label = bid, info = paste("click check:", i))
      }
    }
    for(opt in opts) {
      if(opt == "disabled") {
        expect_true(hasClass(id(bid), "disabled"), 
                    info = 'toggle disabled check', 
                    label = bid)
      } else {
        expect_true(hasClass(id(bid), paste0("btn-", opt)), 
                    info = paste("toggle", opt, "check"), 
                    label = bid)
      }
    }
  }
})

remDr$close()
close(remoteApp)
