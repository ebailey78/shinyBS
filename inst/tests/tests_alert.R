context("basic")

appDir = file.path(system.file(package = "shinyBS"), "tests", "alerts")

remoteApp <- runRemoteApp(appDir = appDir, port = 5000, launch.browser = FALSE)

remDr <- remoteDriver()
remDr$open(silent = TRUE)
remDr$navigate("http:127.0.0.1:5000")

test_that("can connect to app", {
  appTitle <- remDr$getTitle()[[1]]
  expect_equal(appTitle, "shinyBS Alerts Test")
})

test_that("can create alerts on load", {
  w1 <- remDr$findElement(using = "id", value = "warn1")
  d1 <- remDr$findElement(using = "id", value = "dang1")
  i1 <- remDr$findElement(using = "id", value = "info1")
  s1 <- remDr$findElement(using = "id", value = "succ1")
  expect_equal(w1$getElementAttribute("id")[[1]][1], "warn1")
  expect_equal(d1$getElementAttribute("id")[[1]][1], "dang1")
  expect_equal(i1$getElementAttribute("id")[[1]][1], "info1")
  expect_equal(s1$getElementAttribute("id")[[1]][1], "succ1")
})

test_that("type argument works", {
  
  w1 <- remDr$findElement(using = "id", value = "warn1")$getElementAttribute("class")[[1]][1]
  d1 <- remDr$findElement(using = "id", value = "dang1")$getElementAttribute("class")[[1]][1]
  i1 <- remDr$findElement(using = "id", value = "info1")$getElementAttribute("class")[[1]][1]
  s1 <- remDr$findElement(using = "id", value = "succ1")$getElementAttribute("class")[[1]][1]
  
  expect_that("alert-warning" %in% unlist(strsplit(w1, " ")), is_true())
  expect_that("alert-danger" %in% unlist(strsplit(d1, " ")), is_true())
  expect_that("alert-info" %in% unlist(strsplit(i1, " ")), is_true())
  expect_that("alert-success" %in% unlist(strsplit(s1, " ")), is_true())

  expect_that("alert-danger" %in% unlist(strsplit(w1, " ")), is_false())
  expect_that("alert-info" %in% unlist(strsplit(d1, " ")), is_false())
  expect_that("alert-success" %in% unlist(strsplit(i1, " ")), is_false())
  expect_that("alert-warning" %in% unlist(strsplit(s1, " ")), is_false())
  
})

test_that("dismiss argument works", {

  cl1 <- remDr$findElement(using = "id", value = "warn1")$findChildElement(using = "css selector", value = "button.close")
  cl2 <- remDr$findElement(using = "id", value = "warn2")$findChildElement(using = "css selector", value = "button.close")
  
  expect_equal(cl1$getElementTagName()[[1]][1], "button")
  expect_that(cl2$getElementTagName()[[1]][1] == "button", is_false())
  
})

test_that("create alerts after load", {
  
  # First test to make sure warn4 doesn't already exist
  w4 <- remDr$findElement(using = "id", value = "warn4")
  expect_that(w4$getElementTagName()[[1]][1] == "div", is_false())
  
  # Click the button that creates the new alerts
  remDr$findElement(using = "id", value = "but1")$clickElement()
  
  # Check if alert exists now
  w4 <- remDr$findElement(using = "id", value = "warn4")
  expect_that(w4$getElementTagName()[[1]][1] == "div", is_true())
  
})

test_that("closeAlert works", {
  
  d2 <- remDr$findElement(using = "id", value = "dang2")
  expect_that(d2$getElementTagName()[[1]][1] == "div", is_true())
  
  remDr$findElement(using = "id", value = "but2")$clickElement()

  d2 <- remDr$findElement(using = "id", value = "dang2")
  expect_that(d2$getElementTagName()[[1]][1] == "div", is_false())
  
})

test_that("text dependent alert", {
  
  
  
})

remDr$close()
close(remoteApp)
