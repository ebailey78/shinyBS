library(shiny)
library(shinyMenu)

shinyUI(basicPage(
  shinyMenuBar("barNone", brand = "shinyMenu",
               shinyMenu("items", label = "Menu Items", icon = "tasks", caret = TRUE,
                         shinyMenuHeader("Command Buttons"),
                         shinyMenuItem("cmd1", "Command #1"),
                         shinyMenuItem("cmd1", "Command #2"),
                         shinyMenuHeader("Radio Buttons"),
                         shinyMenuItem("rad1", label = "Radio #1", type = "radio", group = "rad_1"),
                         shinyMenuItem("rad2", label = "Radio #2", type = "radio", group = "rad_1"),
                         shinyMenuItem("rad3", label = "Radio #3", type = "radio", group = "rad_1"),
                         shinyMenuHeader("Checkbox Buttons"),
                         shinyMenuItem("cb1", label = "Checkbox #1", type = "checkbox"),
                         shinyMenuItem("cb2", label = "Checkbox #2", type = "checkbox"),
                         shinyMenuItem("cb3", label = "Checkbox #3", type = "checkbox")
               ),
               shinyMenu("subs", label = "Submenus", icon = "terminal", caret = TRUE,
                         shinyMenu("sub1", label = "Submenu with Commands", type = "submenu",
                                   shinyMenuItem("cmd3", "Command #3"),
                                   shinyMenuItem("cmd4", "Command #4")
                         ),
                         shinyMenu("sub2", label = "Submenu with Radios", type = "submenu",
                                   shinyMenuItem("rad4", "Radio #4", type = "radio", group = "rad_2"),
                                   shinyMenuItem("rad5", "Radio #5", type = "radio", group = "rad_2", checked = TRUE),
                                   shinyMenuItem("rad6", "Radio #6", type = "radio", group = "rad_2")
                         ),
                         shinyMenu("sub3", label = "Submenu with Submenus", type = "submenu",
                                   shinyMenu("sub4", label = "Submenu with Submenus", type = "submenu",
                                             shinyMenu("sub5", label = "Submenu with Submenus", type = "submenu",
                                                       shinyMenu("sub6", label = "Submenu with Submenus", type = "submenu",
                                                                 shinyMenuItem("cmd5", "And so forth...")
                                                       )
                                             )
                                   )
                         )
             )
  ),
  plotOutput("chart1"),
  shinyMenu("popup1", type = "popup", target = "chart1",
            shinyMenu("plot_type", type = "submenu", label = "Plot Type",
                      shinyMenuItem("pt_plot", type = "radio", group = "ptype", value = "plot", label = "Scatterplot"),
                      shinyMenuItem("pt_hist", type = "radio", group = "ptype", value = "hist", label = "Histogram", checked = TRUE),
                      shinyMenuItem("pt_box", type = "radio", group = "ptype", value = "boxplot", label = "Boxplot")
            ),
            shinyMenu("dist_type", type = "submenu", label = "Distribution",
                      shinyMenuItem("dt_norm", type = "radio", group = "dtype", value = "rnorm", label = "Normal"),
                      shinyMenuItem("dt_lnorm", type = "radio", group = "dtype", value = "rlnorm", label = "Lognormal"),
                      shinyMenuItem("dt_unif", type = "radio", group = "dtype", value = "runif", label = "Uniform"),
                      shinyMenuItem("dt_exp", type = "radio", group = "dtype", value = "rexp", label = "Exponential")
            ),
            shinyMenu("colors", type = "submenu", label = "Color",
                      shinyMenuItem("col_white", type = "radio", group = "clr", value = "white", label = "White"),
                      shinyMenuItem("col_red", type = "radio", group = "clr", value = "red", label = "Red", checked = TRUE),
                      shinyMenuItem("col_blue", type = "radio", group = "clr", value = "blue", label = "Blue"),
                      shinyMenuItem("col_yell", type = "radio", group = "clr", value = "yellow", label = "Yellow"),
                      shinyMenuItem("col_orange", type = "radio", group = "clr", value = "orange", label = "Orange"),
                      shinyMenuItem("col_purple", type = "radio", group = "clr", value = "purple", label = "Purple"),
                      shinyMenuItem("col_green", type = "radio", group = "clr", value = "green", label = "Green")  
                      ),
            shinyMenuDivider(),
            shinyMenuHeader("Options"),
            shinyMenuItem("rug", type = "checkbox", label = 'Rug')
            )
  

))