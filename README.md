shinyBS
-------

**shinyBS** is a package that adds several additional Twitter Boostrap 
components to shiny. In January RStudio updated shiny to work with Bootstrap3 
which completely broke the original shinyBS. I have updated shinyBS to
work with the newest versions of shiny. 

After several rounds of revisions, shinyBS v0.61 was accepted by CRAN on March 31st, 2015 and is available for install with `install.packages()`

```R
install.packages("shinyBS")
```

Not all functionality that was in the previous versions was kept in this new version. Partly because of time constraints and partly because of some functionality being removed from Bootstrap. 

Features that remain in shinyBS 0.61 include:

* Alerts
* Tooltips
* Popovers
* Modal Windows
* Collapse Panels
* Button upgrades

Features that are not included in shinyBS 0.61 include:

* Navbars and related components
* Typeaheads
* Progress Bars
* Button Groups
* Table Formatting

Now that this version has been been accepted by CRAN I will start working on updates and added functionality. If you have a request please open an issue and let me know. Thanks!

If you want try the newest features, use this github (not-tested) version, in your RStudio run:
```
devtools::install_github("ebailey78/shinyBS")
```
