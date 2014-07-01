context("Buttons Updates")

appDir = file.path(system.file(package = "shinyBS"), "tests", "buttons2")

remoteApp <- runRemoteApp(appDir = appDir, port = 5000, launch.browser = FALSE)

#source(file.path(appDir, "global.R"))

remDr <- remoteDriver()
remDr$open(silent = TRUE)
remDr$navigate("http:127.0.0.1:5000")

#Convenience Functions
id <- findElement(remDr, "id")
css <- findElement(remDr, "css selector")
cscss <- findChildren("css selector")

# Give the shiny app a second to get going
Sys.sleep(1)

test_that("can connect to app", {
  appTitle <- remDr$getTitle()[[1]]
  expect_equal(appTitle, "shinyBS Buttons Update Test")
})

test_that("buttons created", {
  
  expect_true(elementExists(remDr, "actionTest"))
  expect_true(elementExists(remDr, "toggleTest"))
  expect_true(checkInputBinding(id("actionTest")))
  expect_true(checkInputBinding(id("toggleTest")))
  
})

test_that("disable works", {
  
  aB <- id("actionTest")
  tB <- id("toggleTest")
  aBt <- id("aBvalue")
  tBt <- id("tBvalue")
  
  aBv <- as.integer(aBt$getElementText()[[1]][1])
  aB$clickElement()
  expect_equal(as.integer(aBt$getElementText()[[1]][1]), aBv + 1)
  id("aBdis")$clickElement()
  aB$clickElement()
  expect_equal(as.integer(aBt$getElementText()[[1]][1]), aBv + 1)
  id("aBdis")$clickElement()
  aB$clickElement()
  expect_equal(as.integer(aBt$getElementText()[[1]][1]), aBv + 2)
  
  tBv <- as.logical(tBt$getElementText()[[1]][1])
  tB$clickElement()
  expect_equal(as.logical(tBt$getElementText()[[1]][1]), !tBv)
  id("tBdis")$clickElement()
  tB$clickElement()
  expect_equal(as.logical(tBt$getElementText()[[1]][1]), !tBv)
  id("tBdis")$clickElement()
  tB$clickElement()
  expect_equal(as.logical(tBt$getElementText()[[1]][1]), tBv)
  
  
})

test_that("style updates work", {
  styles <- c("primary", "info", "success", "warning", "danger", "inverse", "link")
  i = 0
  for(style in styles) {
    id("aBstyle")$clickElement()
    id("tBstyle")$clickElement()
    i = i + 1
    expect_true(hasClass(id("actionTest"), paste0("btn-", style)), info = style)    
    expect_true(hasClass(id("toggleTest"), paste0("btn-", style)), info = style)    
  }
})

test_that("size updates work", {
  sizes <- c("large", "mini", "small")
  i = 0
  for(size in sizes) {
    id("aBsize")$clickElement()
    id("tBsize")$clickElement()
    i = i + 1
    expect_true(hasClass(id("actionTest"), paste0("btn-", size)), info = size)    
    expect_true(hasClass(id("toggleTest"), paste0("btn-", size)), info = size)    
  }
})

remDr$close()
close(remoteApp)
