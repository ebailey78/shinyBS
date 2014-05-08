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

### What's New

#### Version 0.25 (working version)

* **bsNavDropDown**
  * You can now create submenus inside a drop down by making a including lists inside your choices argument list. The submenus are built recursively so theoretically submenus can go as deep as you want
  * You can create headers and dividers in your menus by include `NA`'s in you choices list, a named `NA` will become a header and an unnamed `NA` will become a divider.
  * You can create dropdowns with media objects as their options. This is done with the `bsMedia()` function. 
  * I am working on a bsNavDemo() example that will better explain changes to dropdowns.
* **bsModal**
  * You can now create modal windows with the `bsModal()` function. These are trigger from a button or link and can contain any combination of inputs, outputs, or standard html.
* **Table Highlighting**
  * Per Request: highlightCells() now accepts a `column` argument which limits cell highlighting to that column.

#### Version 0.20 (released: 2014-03-19)

* **pageWithNavBar**
  * I forgot to include the pageWithNavbar function in the NAMESPACE file so it wasn't exported
* **Buttons/Button Groups** 
  * singletons for including shinyBS's javascript and CSS files weren't added when only button functions were included in an app
  * added `block` argument for creating block level buttons and button groups
  * added `vertical` argument for creating verically oriented button groups
  
* **Tooltips/Popovers**
  * Tooltips and Popovers will now work with the new selectize-type selectInput's in shiny 0.9.0
* **Tables**
  * `highlightCells` lets you highlight table cells based on their content
  * `highlightRows` lets you highlight table rows based on the content of a table column

#### Version 0.10 (released: 2014-03-11)

* **Alerts** - Create alert anchors in your `ui.R` script and add alerts from `server.R`
* **Tooltips** - Add and configure tooltips on any element with an `inputId` or `outputId` with `bsTooltip()` from the ui or with `addToolTip()` from the server.
* **Popovers** - Works the same as Tooltips but useful for more content heavy applications.
* **TypeAhead** - Works just like a 'textInput' but you can provide custom autocomplete lists to guide the user to specific inputs.
* **Progress Bars** - Fully configurable Progress bars that can be updated and changed from `server.R`.
* **Navigation Bars** - Create Bootstrap style navigation bars with buttons, links, dropdowns, etc that control your shiny app.
* **Collapse Panels** - Create collapsable panels that allow you to remove some clutter from your app.
* **Buttons Groups** - Create button groups that behave like radio buttons or checkbox groups
* **Buttons** - Access Twitter Bootstrap styles and sizes for action buttons and toggle buttons

