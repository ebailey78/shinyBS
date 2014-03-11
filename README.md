shinyBS
-------

**shinyBS** is a package that adds several additional Twitter Boostrap components to shiny.
You can install shinyBS from this repository by first installing `devtools`. At the R prompt type:

```
install.packages("devtools")
```

After installing `devtools` in R you can install shinyBS by typing at the R prompt: 

```
install_github("shinyBS", "ebailey78")
```

`shinyBS` was also added to CRAN. You can install the CRAN version with:

```
install.packages("shinyBS")
```

For a quick demonstration of `shinyBS` functionality run the following code at the R prompt:

```
library(shinyBS)
bsDemo()
```

### Issues/Bugs

* **pageWithNavBar()** - pageWithNavBar wasn't properly exported so is not available in the CRAN version. I will export it with the next release. Meanwhile, it can be accessed by using `:::`:
 
```
shinyBS:::pageWithNavBar()
```

### What's New

#### Version 0.10 (Initial Release)

* **Alerts** - Create alert anchors in your `ui.R` script and add alerts from `server.R`
* **Tooltips** - Add and configure tooltips on any element with an `inputId` or `outputId` with `bsTooltip()` from the ui or with `addToolTip()` from the server.
* **Popovers** - Works the same as Tooltips but useful for more content heavy applications.
* **TypeAhead** - Works just like a 'textInput' but you can provide custom autocomplete lists to guide the user to specific inputs.
* **Progress Bars** - Fully configurable Progress bars that can be updated and changed from `server.R`.
* **Navigation Bars** - Create Bootstrap style navigation bars with buttons, links, dropdowns, etc that control your shiny app.
* **Collapse Panels** - Create collapsable panels that allow you to remove some clutter from your app.
* **Buttons Groups** - Create button groups that behave like radio buttons or checkbox groups
* **Buttons** - Access Twitter Bootstrap styles and sizes for action buttons and toggle buttons

