library(shiny)
library(shinyBS)

shinyUI(basicPage(
  
  bsControlBar(inputId = "rs1", brand = "RStudio",
               bsControlMenu("file", "File",
                             bsControlSubMenu("file_new", "New File", icon = "file",
                                              bsControlItem("new_rscript", "R Script"),
                                              bsControlDivider(),
                                              bsControlItem("new_text", "Text File"),
                                              bsControlItem("new_cfile", "C++ File"),
                                              bsControlDivider(),
                                              bsControlItem("new_sweave", "R Sweave"),
                                              bsControlItem("new_mark", "R Markdown"),
                                              bsControlItem("new_html", "R HTML"),
                                              bsControlItem("new_pres", "R Presentation"),
                                              bsControlDivider(),
                                              bsControlItem("new_rdfile", "Rd File")
                                              ),
                             bsControlItem("file_newproj", "New Project"),
                             bsControlDivider(),
                             bsControlItem("file_open", "Open File", icon = "folder-open"),
                             bsControlItem("file_reopen", "Reopen with Encoding..."),
                             bsControlSubMenu("file_recent", "Recent Files", icon = "bookmark",
                                              bsControlItem("old_file1", "Old_file1.csv"),
                                              bsControlItem("old_file2", "Old_file2.csv"),
                                              bsControlItem("old_file3", "Old_file3.csv")
                                              ),
                             bsControlDivider(),
                             bsControlItem("file_openproj", "Open Project..."),
                             bsControlItem("file_openprojnewwin", "Open Project in New Window..."),
                             bsControlSubMenu("file_recentproj", "Recent Projects", icon = "bookmark",
                                              bsControlItem("old_proj1", "Old_Project.Rproj"),
                                              bsControlItem("old_proj2", "Old_Project2.Rproj")
                                              ),
                             bsControlDivider(),
                             bsControlItem("file_save", "Save"),
                             bsControlItem("file_saveas", "Save As..."),
                             bsControlItem("file_saveencode", "Save with Encoding..."),
                             bsControlItem("file_saveall", "Save All"),
                             bsControlDivider(),
                             bsControlItem("file_notebook", "Compile Notebook..."),
                             bsControlDivider(),
                             bsControlItem("file_print", "Print", icon = "print"),
                             bsControlDivider(),
                             bsControlItem("file_close", "Close"),
                             bsControlItem("file_closeall", "Close All"),
                             bsControlDivider(),
                             bsControlItem("file_closeproj", "Close Project"),
                             bsControlDivider(),
                             bsControlItem("file_quit", "Quit RStudio...", icon = "off")
                             ),
                bsControlMenu("view", "View",
                             bsControlSubMenu("view_tool", "Toolbars",
                                              bsControlItem("tool_menu", "Menu Bar", toggle = TRUE, active = TRUE),
                                              bsControlItem("tool_nav", "Navigation Toolbar", toggle = TRUE, active = TRUE),
                                              bsControlItem("tool_book", "Bookmarks Toolbar", toggle = TRUE),
                                              bsControlItem("tool_addon", "Add-on Bar", toggle = TRUE),
                                              bsControlDivider(),
                                              bsControlItem("tool_cust", "Customize")
                                              ),
                             bsControlSubMenu("view_side", "Sidebar", radio = TRUE,
                                              bsControlItem("side_book", "Bookmarks", toggle = TRUE),
                                              bsControlItem("side_hist", "History", toggle = TRUE)
                                              ),
                             bsControlDivider(),
                             bsControlSubMenu("view_zoom", "Zoom",
                                              bsControlItem("zoom_in", "Zoom In", icon = "zoom-in"),
                                              bsControlItem("zoom_out", "Zoom Out", icon = "zoom-out"),
                                              bsControlDivider(),
                                              bsControlItem("zoom_reset", "Reset"),
                                              bsControlDivider(),
                                              bsControlItem("zoom_text", "Zoom Text Only", toggle = TRUE)
                                              ),
                             bsControlSubMenu("view_style", "Page Style", radio = TRUE,
                                              bsControlItem("style_none", "No Style", toggle = TRUE),
                                              bsControlItem("style_basic", "Basic Page Style", toggle = TRUE, active = TRUE)
                                              ),
                             bsControlSubMenu("view_encode", "Character Encoding", radio = TRUE,
                                              bsControlSubMenu("encode_auto", "Auto-Detect", radio = TRUE,
                                                               bsControlItem("auto_off", "Off", toggle = TRUE, active = TRUE),
                                                               bsControlItem("auto_chinese", "Chinese", toggle = TRUE),
                                                               bsControlItem("auto_eastasian", "East Asian", toggle = TRUE),
                                                               bsControlItem("auto_japanese", "Japanese", toggle = TRUE),
                                                               bsControlItem("auto_korean", "Korean", toggle = TRUE),
                                                               bsControlItem("auto_russian", "Russian", toggle = TRUE),
                                                               bsControlItem("auto_simpchin", "Simple Chinese", toggle = TRUE),
                                                               bsControlItem("auto_tradchin", "Traditional Chinese", toggle = TRUE),
                                                               bsControlItem("auto_ukrainian", "Ukrainian", toggle = TRUE),
                                                               bsControlItem("auto_universal", "Universal", toggle = TRUE)),
                                              bsControlSubMenu("encode_more", "More Encodings", radio = TRUE,
                                                               bsControlItem("more_more", "I'm not doing this right now.", toggle = TRUE)
                                                               ),
                                              bsControlItem("encode_custom", "Customize List..."),
                                              bsControlDivider(),
                                              bsControlItem("encode_western", "Western (ISO-8859-1)", toggle = TRUE),
                                              bsControlItem("encode_unicode", "Unicode (UTF-8)", toggle = TRUE, active = TRUE),
                                              bsControlItem("encode_japanese", "Japanese (EUC-JP)", toggle = TRUE)
                                              ),
                             bsControlItem("view_full", "Full Screen", icon = "fullscreen")
                             )
              ),
#   
#   bsControlBar(inputId = "cb1", 
#                bsControlMenu("data", "Data",
#                              bsControlSubMenu("monitor", "Monitor", radio = TRUE,
#                                               bsControlItem("mon_EM", "East Chicago - Marina", toggle = TRUE),
#                                               bsControlItem("mon_GI", "Gary IITRI", toggle = TRUE),
#                                               bsControlItem("mon_NE", "New Albany - Falls of the Ohio")
#                              ),
#                              bsControlSubMenu("pollutant", "Pollutant", radio = TRUE,
#                                               bsControlItem("p92", "Acetone"),
#                                               bsControlItem("p100", "Benzene")
#                              ),
#                              bsControlItem("save", "Save")
#                ),
#                bsControlMenu("view", "View",
#                              bsControlItem("map", "Monitor Map", icon = "map-marker"),
#                              bsControlSubMenu("trend", "Trend Lines",
#                                               bsControlItem("lm", "Linear", toggle = TRUE),
#                                               bsControlItem("loess", "LOESS", toggle = TRUE))
#                ),
#                bsControlMenu("opts", "Options",
#                              bsControlSubMenu("units", "Units", radio = TRUE,
#                                               bsControlItem("ugm3", HTML("&mu;g/m<sup>3</sup>"), toggle = TRUE, active = TRUE),
#                                               bsControlItem("ppbv", "ppbv", toggle = TRUE)
#                                               )
#                              )
#               ),
  bsActionButton("test", "Test", style = "info"),
  plotOutput("plot"),
  textOutput("testing")
  
  ))