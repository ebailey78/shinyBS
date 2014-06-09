library(shiny)
library(shinyBS)

shinyUI(basicPage(
  bsMenuBar("barNone", brand = "bsMenu",
               bsMenu("items", label = "Menu Items", icon = "tasks", caret = TRUE,
                         bsMenuHeader("Command Buttons"),
                         bsMenuItem("cmd1", "Command #1"),
                         bsMenuItem("cmd1", "Command #2"),
                         bsMenuHeader("Radio Buttons"),
                         bsMenuItem("rad1", label = "Radio #1", type = "radio", group = "rad_1"),
                         bsMenuItem("rad2", label = "Radio #2", type = "radio", group = "rad_1"),
                         bsMenuItem("rad3", label = "Radio #3", type = "radio", group = "rad_1"),
                         bsMenuHeader("Checkbox Buttons"),
                         bsMenuItem("cb1", label = "Checkbox #1", type = "checkbox"),
                         bsMenuItem("cb2", label = "Checkbox #2", type = "checkbox"),
                         bsMenuItem("cb3", label = "Checkbox #3", type = "checkbox")
               ),
               bsMenu("subs", label = "Submenus", icon = "terminal", caret = TRUE,
                         bsMenu("sub1", label = "Submenu with Commands", type = "submenu",
                                   bsMenuItem("cmd3", "Command #3"),
                                   bsMenuItem("cmd4", "Command #4")
                         ),
                         bsMenu("sub2", label = "Submenu with Radios", type = "submenu",
                                   bsMenuItem("rad4", "Radio #4", type = "radio", group = "rad_2"),
                                   bsMenuItem("rad5", "Radio #5", type = "radio", group = "rad_2", checked = TRUE),
                                   bsMenuItem("rad6", "Radio #6", type = "radio", group = "rad_2")
                         ),
                         bsMenu("sub3", label = "Submenu with Submenus", type = "submenu",
                                   bsMenu("sub4", label = "Submenu with Submenus", type = "submenu",
                                             bsMenu("sub5", label = "Submenu with Submenus", type = "submenu",
                                                       bsMenu("sub6", label = "Submenu with Submenus", type = "submenu",
                                                                 bsMenuItem("cmd5", "And so forth...")
                                                       )
                                             )
                                   )
                         )
             )#,
             #bsMenuWrap(textInput("test", "Text Input"), width = 10)
  ),
  plotOutput("chart1"),
  bsMenu("popup1", type = "popup", target = "chart1",
            bsMenu("plot_type", type = "submenu", label = "Plot Type",
                      bsMenuItem("pt_plot", type = "radio", group = "ptype", value = "plot", label = "Scatterplot"),
                      bsMenuItem("pt_hist", type = "radio", group = "ptype", value = "hist", label = "Histogram", checked = TRUE),
                      bsMenuItem("pt_box", type = "radio", group = "ptype", value = "boxplot", label = "Boxplot")
            ),
            bsMenu("dist_type", type = "submenu", label = "Distribution",
                      bsMenuItem("dt_norm", type = "radio", group = "dtype", value = "rnorm", label = "Normal"),
                      bsMenuItem("dt_lnorm", type = "radio", group = "dtype", value = "rlnorm", label = "Lognormal"),
                      bsMenuItem("dt_unif", type = "radio", group = "dtype", value = "runif", label = "Uniform"),
                      bsMenuItem("dt_exp", type = "radio", group = "dtype", value = "rexp", label = "Exponential")
            ),
            bsMenu("colors", type = "submenu", label = "Color",
                      bsMenuItem("col_white", type = "radio", group = "clr", value = "white", label = "White"),
                      bsMenuItem("col_red", type = "radio", group = "clr", value = "red", label = "Red", checked = TRUE),
                      bsMenuItem("col_blue", type = "radio", group = "clr", value = "blue", label = "Blue"),
                      bsMenuItem("col_yell", type = "radio", group = "clr", value = "yellow", label = "Yellow"),
                      bsMenuItem("col_orange", type = "radio", group = "clr", value = "orange", label = "Orange"),
                      bsMenuItem("col_purple", type = "radio", group = "clr", value = "purple", label = "Purple"),
                      bsMenuItem("col_green", type = "radio", group = "clr", value = "green", label = "Green")  
                      ),
            bsMenuDivider(),
            bsMenuHeader("Options"),
            bsMenuItem("rug", type = "checkbox", label = 'Rug')
            )
  

))