context("Alerts")

appDir = file.path(system.file(package = "shinyBS"), "tests", "alerts")

remoteApp <- runRemoteApp(appDir = appDir, port = 5000, launch.browser = FALSE)

remDr <- remoteDriver()
remDr$open(silent = TRUE)
remDr$navigate("http:127.0.0.1:5000")

#Convenience Functions
byId <- findElement(remDr, "id")
bySel <- findElement(remDr, "css selector")

test_that("can connect to app", {
  appTitle <- remDr$getTitle()[[1]]
  expect_equal(appTitle, "shinyBS Alerts Test")
})

test_that("alert anchors created", {
  
  expect_true(elementExists(remDr, "alert1"))
  expect_true(elementExists(remDr, "alert2"))
  
  expect_equal(getTag(byId("alert1")), "div")
  expect_true(hasClass(remDr, "alert1", "tbs-alert"))
  expect_true(hasClass(remDr, "alert2", "tbs-alert"))
  
})

test_that("can create alerts on load", {
  els <- c("warn1", "dang1", "info1", "succ1", "warn2", "dang2", "info2", "succ2")
  for(el in els) {
    expect_true(elementExists(remDr, el), label = el)
  }
})

test_that("type argument works", {
  
  expect_true(hasClass(remDr, "warn1", "alert-warning"))
  expect_true(hasClass(remDr, "dang1", "alert-danger"))
  expect_true(hasClass(remDr, "info1", "alert-info"))
  expect_true(hasClass(remDr, "succ1", "alert-success"))
  
  expect_false(hasClass(remDr, "warn1", "alert-danger"))
  expect_false(hasClass(remDr, "dang1", "alert-info"))
  expect_false(hasClass(remDr, "info1", "alert-success"))
  expect_false(hasClass(remDr, "succ1", "alert-warning"))
  
})

test_that("dismiss argument works", {
 
  expect_true(getTag(childBySel(byId("warn1"), "button.close")) == "button")
  expect_false(getTag(childBySel(byId("warn2"), "button.close")) == "button")
  
})

test_that("create alerts after load", {
  
  # First test to make sure batch 4 doesn't already exist
  els <- c("warn4", "dang4", "info4", "succ4")
  for(el in els) {
    expect_false(elementExists(remDr, el), label = el)
  }
    
  # Click the button that creates the new alerts
  byId("but1")$clickElement()
  
  # Check if alert exists now
  for(el in els) {
    expect_true(elementExists(remDr, el), label = el)
  }
  
})

test_that("closeAlert works", {
  
  # First test to make sure batch 4 is still open
  els <- c("warn4", "dang4", "info4", "succ4")
  for(el in els) {
    expect_true(elementExists(remDr, el), label = el)
  }
  
  # Click the button that creates the new alerts
  byId("but2")$clickElement()
  
  # Check if alert have disappeared
  for(el in els) {
    expect_false(elementExists(remDr, el), label = el)
  }
  
})

test_that("append works", {
  
  a2 <- byId("alert2")
  byId("but2")$clickElement()
  start <- length(a2$findChildElements(using = "css selector", value = "div.alert"))
  byId("but1")$clickElement()
  expect_more_than(length(a2$findChildElements(using = "css selector", value = "div.alert")), start)
  byId("but3")$clickElement()
  expect_less_than(length(a2$findChildElements(using = "css selector", value = "div.alert")), start)

})

test_that("textInput alert", {
  txt <- byId("text1")
  #Make Sure textInput is empty
  txt$clearElement()
  expect_true(hasClass(remDr, "text_test", "alert-info"))
  txt$sendKeysToElement(list("50"))
  Sys.sleep(0.5)
  expect_true(hasClass(remDr, "text_test", "alert-danger"))
  txt$sendKeysToElement(list("0"))
  Sys.sleep(0.5)
  expect_true(hasClass(remDr, "text_test", "alert-success"))
})


remDr$close()
close(remoteApp)
