library(shiny)
library(shinyBS)

shinyUI(basicPage(
  bsMenuBar("barNone", brand = "bsMenu",
            bsMenu("items", label = "Menu Items", icon = "tasks", caret = TRUE,
                   bsMenu("plot_type1", type = "submenu", label = "Plot Type",
                          bsMenuItem("pt_plot1", type = "radio", group = "ptype1", value = "plot", label = "Scatterplot"),
                          bsMenuItem("pt_hist1", type = "radio", group = "ptype1", value = "hist", label = "Histogram"),
                          bsMenuItem("pt_box1", type = "radio", group = "ptype1", value = "boxplot", label = "Boxplot")
                   ),
                   bsMenu("dist_type1", type = "submenu", label = "Distribution",
                          bsMenuItem("dt_norm1", type = "radio", group = "dtype1", value = "rnorm", label = "Normal"),
                          bsMenuItem("dt_lnorm1", type = "radio", group = "dtype1", value = "rlnorm", label = "Lognormal"),
                          bsMenuItem("dt_unif1", type = "radio", group = "dtype1", value = "runif", label = "Uniform"),
                          bsMenuItem("dt_exp1", type = "radio", group = "dtype1", value = "rexp", label = "Exponential")
                   ),
                   bsMenu("colors1", type = "submenu", label = "Color",
                          bsMenuItem("col_orange1", type = "radio", group = "clr1", value = "orange", label = "Orange"),
                          bsMenuItem("col_white1", type = "radio", group = "clr1", value = "white", label = "White"),
                          bsMenuItem("col_red1", type = "radio", group = "clr1", value = "red", label = "Red"),
                          bsMenuItem("col_blue1", type = "radio", group = "clr1", value = "blue", label = "Blue"),
                          bsMenuItem("col_yell1", type = "radio", group = "clr1", value = "yellow", label = "Yellow"),
                          bsMenuItem("col_purple1", type = "radio", group = "clr1", value = "purple", label = "Purple"),
                          bsMenuItem("col_green1", type = "radio", group = "clr1", value = "green", label = "Green")  
                   ),
                   bsMenuDivider(),
                   bsMenuHeader("Options"),
                   bsMenuItem("rug1", type = "checkbox", label = 'Rug'),
                   bsMenuItem("nd1", label = "New Data")
           ),
             bsMenuWrap(textInput("plot_title", "Plot Title"), width = "10", icon="tag"),
             bsMenuWrap(numericInput("sample_size", "Sample Size", value = 1000, min = 1, max = 100000, step = 100), width = 10, icon = "truck"),
             bsMenuWrap(bsActionButton("test_but", "Test", style = "danger")),
             bsMenuWrap(bsActionButton("new_data", "New Data", style = "success")),
             bsMenuDateRangeInput("test_dr", "Date Range", presets = list("This Year" = c("2014-01-01", "2014-06-20"), "This Month" = c("2014-06-01", "2014-06-20"), "Present Day" = c("", "2014-06-20")))
  ),
  textOutput("testing"),
  plotOutput("chart1"),
  bsMenu("popup1", type = "popup", target = "chart1",
         bsMenu("plot_type2", type = "submenu", label = "Plot Type",
                bsMenuItem("pt_plot2", type = "radio", group = "ptype2", value = "plot", label = "Scatterplot"),
                bsMenuItem("pt_hist2", type = "radio", group = "ptype2", value = "hist", label = "Histogram", checked = TRUE),
                bsMenuItem("pt_box2", type = "radio", group = "ptype2", value = "boxplot", label = "Boxplot")
         ),
         bsMenu("dist_type2", type = "submenu", label = "Distribution",
                bsMenuItem("dt_norm2", type = "radio", group = "dtype2", value = "rnorm", label = "Normal"),
                bsMenuItem("dt_lnorm2", type = "radio", group = "dtype2", value = "rlnorm", label = "Lognormal"),
                bsMenuItem("dt_unif2", type = "radio", group = "dtype2", value = "runif", label = "Uniform"),
                bsMenuItem("dt_exp2", type = "radio", group = "dtype2", value = "rexp", label = "Exponential")
         ),
         bsMenu("colors2", type = "submenu", label = "Color",
                bsMenuItem("col_blue2", type = "radio", group = "clr2", value = "blue", label = "Blue"),
                bsMenuItem("col_yell2", type = "radio", group = "clr2", value = "yellow", label = "Yellow"),
                bsMenuItem("col_white2", type = "radio", group = "clr2", value = "white", label = "White"),
                bsMenuItem("col_red2", type = "radio", group = "clr2", value = "red", label = "Red"),
                bsMenuItem("col_orange2", type = "radio", group = "clr2", value = "orange", label = "Orange", checked = TRUE),
                bsMenuItem("col_purple2", type = "radio", group = "clr2", value = "purple", label = "Purple"),
                bsMenuItem("col_green2", type = "radio", group = "clr2", value = "green", label = "Green")  
         ),
         bsMenuDivider(),
         bsMenuHeader("Options"),
         bsMenuItem("rug2", type = "checkbox", label = 'Rug'),
         bsMenuItem("nd2", label = "New Data")
  )
  
  
))