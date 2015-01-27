shinyBS
-------

**shinyBS** is a package that adds several additional Twitter Boostrap 
components to shiny. RStudio recently updated shiny to work with Bootstrap3 
which has completely broken shinyBS. I am in the process of updating shinyBS to
work with the newest versions of shiny but it may take some time. As I get 
components working I will add them to this branch. Once I have it completely 
working I will update the version on CRAN. You can install shinyBS from this 
branch by first installing `devtools`. At the R prompt type:

```R
install.packages("devtools")
```

After installing `devtools` in R you can install shinyBS by typing at the R prompt: 

```R
devtools::install_github("ebailey78/shinyBS", ref = "shinyBS3")
```

### What's New

#### Version 0.50 (Bootstrap3 Update)
* Alerts
    + Removed 'block' option
    + Defaults to 'info' type
* Collapse Panels
    + Now accepts a 'type' argument to change styling of header
    + The 'multiple' option can no longer be changed from update collapse.
    + can change style of panels with the ```updateCollapse()``` function
* bsGlyph
    + Removed because of added native shiny support
* bsModal
    + Removed the href option (depreciated in bootstrap v3.3.0)
    + Added "size" option
    + added toggle argument to ```bsToggleModal()``` so you can explicitly tell 
      the modal to open or close
* Tooltips and Popovers
    + Added an options argument that allows more access to tooltip options for
      advanced users.

#### Version 0.30 (depreciated)

* **bsMenus**
    * Completely reworked how navbars are implemented. As a result, all the `bsNav` functions have been depreciated and replaced with functions that start with `bsMenu`.
      + `bsMenu()` - creates three different types of menus:
        * toolbar - similar to `bsNavDropdown()`, creates top-level menus in a navbar
        * submenu - creates submenus in an existing toolbar or popup menu
        * popup - creates a contextual popup menu that appears when you right-click on an ui element
      + `bsMenuItem()` - creates three different types of menu elements:
        * command - the equivilent of an `actionButton`.
        * checkbox - the equivilent of a `checkboxInput`.
        * radio - the equivilent of a `radioInput`. Provided multiple radio elements the same `group` attribute to link them together.
      + `bsMenuWrap()` - A wrapper for any text-like inputs (e.g., `textInput()`, `numericInput()`, or `bsTypeAhead()`) or buttons that format them to work better within navbars. This replaces the individual functions that existed in the `bsNav` scheme. Only `bsMenuDateRangeInput()` remains as a stand-alone function for menubar inputs
      + `bsMenuGroup()` - A convenience function that allows you to create many `bsMenuItem()` elements at once.
      + `bsMenuItemGroup()` - A function that ties multiple menu elements together so that changing one automatically changes the others. This is so that you can have access to the same functionality in multiple locations (e.g., being able to add a trend line to a graph from a navbar menu or from a contextual popup menu.)
      + `bsMenuDivider()` - adds a horizontal dividing line to a menu to help organize elements.
      + `bsMenuHeader()` - adds a non-clickable heading to a menu, again, for organizational purposes.
* **bsModal**
    * You can now create modal windows with the `bsModal()` function. These are trigger from a button or link and can contain any combination of inputs, outputs, or standard html.
* **Alerts**
    * Added a check so that if an alert already exists with the same alertId as an alert you are trying to create, the new alert isn't created.
* **Bug Fixes/Requested Changes**
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

