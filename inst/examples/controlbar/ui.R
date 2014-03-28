library(shiny)
library(shinyBS)

shinyUI(basicPage(
  
  bsControlBar(inputId = "rs1", brand = "RStudio",
               bsControlMenu("file", "File",
                             bsControlSubMenu("file_new", "New File", icon = "file",
                                              bsControlLink("new_rscript", "R Script"),
                                              bsControlDivider(),
                                              bsControlLink("new_text", "Text File"),
                                              bsControlLink("new_cfile", "C++ File"),
                                              bsControlDivider(),
                                              bsControlLink("new_sweave", "R Sweave"),
                                              bsControlLink("new_mark", "R Markdown"),
                                              bsControlLink("new_html", "R HTML"),
                                              bsControlLink("new_pres", "R Presentation"),
                                              bsControlDivider(),
                                              bsControlLink("new_rdfile", "Rd File")
                                              ),
                             bsControlLink("file_newproj", "New Project"),
                             bsControlDivider(),
                             bsControlLink("file_open", "Open File", icon = "folder-open"),
                             bsControlLink("file_reopen", "Reopen with Encoding..."),
                             bsControlSubMenu("file_recent", "Recent Files", icon = "bookmark",
                                              bsControlLink("old_file1", "Old_file1.csv"),
                                              bsControlLink("old_file2", "Old_file2.csv"),
                                              bsControlLink("old_file3", "Old_file3.csv")
                                              ),
                             bsControlDivider(),
                             bsControlLink("file_openproj", "Open Project..."),
                             bsControlLink("file_openprojnewwin", "Open Project in New Window..."),
                             bsControlSubMenu("file_recentproj", "Recent Projects", icon = "bookmark",
                                              bsControlLink("old_proj1", "Old_Project.Rproj"),
                                              bsControlLink("old_proj2", "Old_Project2.Rproj")
                                              ),
                             bsControlDivider(),
                             bsControlLink("file_save", "Save"),
                             bsControlLink("file_saveas", "Save As..."),
                             bsControlLink("file_saveencode", "Save with Encoding..."),
                             bsControlLink("file_saveall", "Save All"),
                             bsControlDivider(),
                             bsControlLink("file_notebook", "Compile Notebook..."),
                             bsControlDivider(),
                             bsControlLink("file_print", "Print", icon = "print"),
                             bsControlDivider(),
                             bsControlLink("file_close", "Close"),
                             bsControlLink("file_closeall", "Close All"),
                             bsControlDivider(),
                             bsControlLink("file_closeproj", "Close Project"),
                             bsControlDivider(),
                             bsControlLink("file_quit", "Quit RStudio...", icon = "off")
                             ),
                bsControlMenu("view", "View",
                             bsControlSubMenu("view_tool", "Toolbars",
                                              bsControlLink("tool_menu", "Menu Bar", toggle = TRUE, active = TRUE),
                                              bsControlLink("tool_nav", "Navigation Toolbar", toggle = TRUE, active = TRUE),
                                              bsControlLink("tool_book", "Bookmarks Toolbar", toggle = TRUE),
                                              bsControlLink("tool_addon", "Add-on Bar", toggle = TRUE),
                                              bsControlDivider(),
                                              bsControlLink("tool_cust", "Customize")
                                              ),
                             bsControlSubMenu("view_side", "Sidebar", radio = TRUE,
                                              bsControlLink("side_book", "Bookmarks", toggle = TRUE),
                                              bsControlLink("side_hist", "History", toggle = TRUE)
                                              ),
                             bsControlDivider(),
                             bsControlSubMenu("view_zoom", "Zoom",
                                              bsControlLink("zoom_in", "Zoom In", icon = "zoom-in"),
                                              bsControlLink("zoom_out", "Zoom Out", icon = "zoom-out"),
                                              bsControlDivider(),
                                              bsControlLink("zoom_reset", "Reset"),
                                              bsControlDivider(),
                                              bsControlLink("zoom_text", "Zoom Text Only", toggle = TRUE)
                                              ),
                             bsControlSubMenu("view_style", "Page Style", radio = TRUE,
                                              bsControlLink("style_none", "No Style", toggle = TRUE),
                                              bsControlLink("style_basic", "Basic Page Style", toggle = TRUE, active = TRUE)
                                              ),
                             bsControlSubMenu("view_encode", "Character Encoding", radio = TRUE,
                                              bsControlSubMenu("encode_auto", "Auto-Detect", radio = TRUE,
                                                               bsControlLink("auto_off", "Off", toggle = TRUE, active = TRUE),
                                                               bsControlLink("auto_chinese", "Chinese", toggle = TRUE),
                                                               bsControlLink("auto_eastasian", "East Asian", toggle = TRUE),
                                                               bsControlLink("auto_japanese", "Japanese", toggle = TRUE),
                                                               bsControlLink("auto_korean", "Korean", toggle = TRUE),
                                                               bsControlLink("auto_russian", "Russian", toggle = TRUE),
                                                               bsControlLink("auto_simpchin", "Simple Chinese", toggle = TRUE),
                                                               bsControlLink("auto_tradchin", "Traditional Chinese", toggle = TRUE),
                                                               bsControlLink("auto_ukrainian", "Ukrainian", toggle = TRUE),
                                                               bsControlLink("auto_universal", "Universal", toggle = TRUE)),
                                              bsControlSubMenu("encode_more", "More Encodings", radio = TRUE,
                                                               bsControlLink("more_more", "I'm not doing this right now.", toggle = TRUE)
                                                               ),
                                              bsControlLink("encode_custom", "Customize List..."),
                                              bsControlDivider(),
                                              bsControlLink("encode_western", "Western (ISO-8859-1)", toggle = TRUE),
                                              bsControlLink("encode_unicode", "Unicode (UTF-8)", toggle = TRUE, active = TRUE),
                                              bsControlLink("encode_japanese", "Japanese (EUC-JP)", toggle = TRUE)
                                              ),
                             bsControlLink("view_full", "Full Screen", icon = "fullscreen")
                             )
              ),
#   
#   bsControlBar(inputId = "cb1", 
#                bsControlMenu("data", "Data",
#                              bsControlSubMenu("monitor", "Monitor", radio = TRUE,
#                                               bsControlLink("mon_EM", "East Chicago - Marina", toggle = TRUE),
#                                               bsControlLink("mon_GI", "Gary IITRI", toggle = TRUE),
#                                               bsControlLink("mon_NE", "New Albany - Falls of the Ohio")
#                              ),
#                              bsControlSubMenu("pollutant", "Pollutant", radio = TRUE,
#                                               bsControlLink("p92", "Acetone"),
#                                               bsControlLink("p100", "Benzene")
#                              ),
#                              bsControlLink("save", "Save")
#                ),
#                bsControlMenu("view", "View",
#                              bsControlLink("map", "Monitor Map", icon = "map-marker"),
#                              bsControlSubMenu("trend", "Trend Lines",
#                                               bsControlLink("lm", "Linear", toggle = TRUE),
#                                               bsControlLink("loess", "LOESS", toggle = TRUE))
#                ),
#                bsControlMenu("opts", "Options",
#                              bsControlSubMenu("units", "Units", radio = TRUE,
#                                               bsControlLink("ugm3", HTML("&mu;g/m<sup>3</sup>"), toggle = TRUE, active = TRUE),
#                                               bsControlLink("ppbv", "ppbv", toggle = TRUE)
#                                               )
#                              )
#               ),
  bsActionButton("test", "Test", style = "info"),
  plotOutput("plot"),
  htmlOutput("testing")
  
  ))