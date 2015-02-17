shinyBS
-------

**shinyBS** is a package that adds several additional Twitter Boostrap 
components to shiny. RStudio recently updated shiny to work with Bootstrap3 
which completely broke the original shinyBS. I am updating shinyBS to
work with the newest versions of shiny but it is taking some time. 

Bootstrap has removed some components from version 3 (namely typeaheads 
and submenus in dropdowns). I originally intended to create work arounds
to keep these features available in shinyBS, despite the fact that they 
were removed from Bootstrap. In the interest of avoiding "feature creep"
I've decided that I am only going to restore those features that are 
present in the version of Bootstrap supported by Shiny. This will break
backwards compatibility for some, and I apologize for this. 

Concentrating on getting Bootstrap's core functionality incorporated into
the newest version of shinyBS will allow me to get a working version back
on CRAN as quickly as possible. After that is done, I will look at either 
reincorporating the lost functionality back into shinyBS or creating new	
packages that give users access to this functionality.

I have most of the functionality that I intend to release with shinyBS 0.50 
working now and am now working primarily on testing and documentation. I hope
to have the new version on CRAN by the end of February 2015.

Features that will remain in version 0.5 include:

* Alerts
* Tooltips
* Popovers
* Modal Windows
* Progress Bars
* Collapse Panels
* Button upgrades
* Button Groups

Features that will not be included in version 0.5 include:

* Navbars and related components
* Typeaheads

Sorry for any inconvenience,

Eric
