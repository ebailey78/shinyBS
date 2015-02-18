context("Alerts")

devtools::install_github("ebailey78/shinyBS", ref = "shinyBS3-new")
appDir = file.path(system.file(package = "shinyBS"), "tests", "bsAlert")

shinyapps::deployApp(appDir)

source(file.path(appDir, "global.R"))

remoteApp <- runRemoteApp(appDir = appDir, port = 2015, launch.browser = FALSE)

remDr <- RSelenium::remoteDriver()
remDr$open(silent = TRUE)
remDr$navigate("http:127.0.0.1:2015")

#Convenience Functions
id <- findElement(remDr, "id")
css <- findElement(remDr, "css selector")

test_that("can connect to app", {
  appTitle <- remDr$getTitle()[[1]]
  expect_equal(appTitle, "shinyBS Alerts Test")
})

test_that("alert anchors created", {
  
  expect_true(elementExists(remDr, "alert1"))
  expect_true(elementExists(remDr, "alert2"))
  expect_false(elementExists(remDr, "alert3"))
  
  expect_equal(getTag(id("alert1")), "div")
  expect_equal(getTag(id("alert2")), "div")
  expect_true(hasClass(id("alert1"), "tbs-alert"))
  expect_true(hasClass(id("alert2"), "tbs-alert"))
  
})

test_that("Alerts created on load", {
  for(r in seq(nrow(g))) {
    aid <- paste(g[r, 1], g[r, 2], g[r, 3], sep = "_")
    expect_true(elementExists(remDr, aid), label = aid, info = "existence check")
    expect_true(hasClass(id(aid), paste0("alert-", types[g[r, 2]])), label = aid, info = "style check")
    expect_equal(childExists(id(aid), "css selector", "button.close"), g[r, 3], label = aid, info = paste("dismiss check:", g[r, 3]))
  }
})

test_that("Alerts created after load", {
  
  # First test to make sure batch 4 doesn't already exist
  for(r in seq(nrow(g))) {
    aid <- paste("post", g[r, 1], g[r, 2], g[r, 3], sep = "_")
    expect_false(elementExists(remDr, aid), label = aid, info = "non-existence check")
  }
  
  # Click the button that creates the new alerts
  id("but1")$clickElement()
  
  Sys.sleep(0.5)
  
  # Check if alert exists now
  for(r in seq(nrow(g))) {
    aid <- paste("post", g[r, 1], g[r, 2], g[r, 3], sep = "_")
    expect_true(elementExists(remDr, aid), label = aid, info = "existence check")
    expect_true(hasClass(id(aid), paste0("alert-", types[g[r, 2]])), label = aid, info = "style check")
    expect_equal(childExists(id(aid), "css selector", "button.close"), g[r, 3], label = aid, info = paste("dismiss check:", g[r, 3]))
  }
  
})

test_that("closeAlert works", {
  
  # Check if alert still exist
  for(r in seq(nrow(g))) {
    aid <- paste("post", g[r, 1], g[r, 2], g[r, 3], sep = "_")
    expect_true(elementExists(remDr, aid), label = aid, info = "existence check")
    expect_true(hasClass(id(aid), paste0("alert-", types[g[r, 2]])), label = aid, info = "style check")
    expect_equal(childExists(id(aid), "css selector", "button.close"), g[r, 3], label = aid, info = paste("dismiss check:", g[r, 3]))
  }
  
  # Click the button that closes the alerts
  id("but2")$clickElement()
  
  # Check if the new alerts have disappeared but not the old
  for(r in seq(nrow(g))) {
    aid <- paste(g[r, 1], g[r, 2], g[r, 3], sep = "_")
    expect_false(elementExists(remDr, paste0("post_", aid)), label = aid, info = "non-existence check")
    expect_true(elementExists(remDr, aid), label = aid, info = "existence check")
  }
  
})

test_that("close button works", {
  g2 <- g[g[,3] == TRUE, ]
  for(r in seq(nrow(g2))) {
    aid <- paste(g[r, 1], g[r, 2], g[r, 3], sep = "_")
    if(elementExists(remDr, aid)) {
      expect_true(elementExists(remDr, aid), label = aid, info = "pre-check")
      findChild("css selector")(id(aid), "button.close")$clickElement()
      expect_false(elementExists(remDr, aid), label = aid, info = "post-check")      
    }
  }
})

test_that("append works", {
  
  a2 <- id("alert2")
  id("but2")$clickElement()
  start <- length(findChildren("css selector")(a2, "div.alert"))
  id("but1")$clickElement()
  expect_more_than(length(findChildren("css selector")(a2, "div.alert")), start)
  id("but3")$clickElement()
  expect_equal(length(findChildren("css selector")(a2, "div.alert")), 1)

})

test_that("textInput alert", {
  txt <- id("text1")
  #Make Sure textInput is empty
  txt$clearElement()
  expect_true(hasClass(id("text_test"), "alert-info"))
  txt$sendKeysToElement(list("50"))
  Sys.sleep(0.5)
  expect_true(hasClass(id("text_test"), "alert-danger"))
  txt$sendKeysToElement(list("0"))
  Sys.sleep(0.5)
  expect_true(hasClass(id("text_test"), "alert-success"))
})



remDr$close()
close(remoteApp)
