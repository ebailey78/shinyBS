#### CODE FOR TOOLTIPS ####
#'@templateVar item_name Tooltip
#'@template component
#'@details Tooltips are used to convey very small amounts of information about
#' an element of your shiny app to the user. They are usually set to appear on
#' hover and can contain text to help better explain an element of
#' your shiny app.
NULL

#'@rdname tooltips
#'@param id The id of the element you want to attach/remove the tooltip to/from
#'@param title The content of the tooltip
#'@param placement Where the tooltip shoud appear relative to its target
#'@param trigger What action should cause the tooltip to appear
#'@param options A named list of additional tooltip options (See Details)
#'@details shiny and shinyBS use jQuery to select elements within the page.
#' shinyBS will prepend the \code{id} argument with a "#" to tell jQuery to
#' look for an id, but additional css selectors can be included within the
#' \code{id} argument. For example, if you wanted to attach a tooltip to the
#' first header of a table with an id of "tableEx" you could do something like
#' \code{id = "tableEx th:nth-child(1)"}.
#'
#' \code{bsTooltip} is used from within ui.R to add tooltips to elements
#'@section Options: \code{placement} can be \code{right}, \code{left},
#' \code{top}, or \code{bottom}
#'
#' \code{trigger} can be \code{hover}, \code{click}, \code{focus}, or
#' \code{manual}
#' 
#' \code{options} gives access to less commonly used options in the bootstrap 
#' tooltip API. It should be a names list in which the names match options for 
#' tooltips (See the Bootstrap documentation). Values provided in \code{options}
#' will overwrite any values provided by \code{title}, \code{placement}, or
#' \code{trigger} arguments.
#'@export
bsTooltip <- function(id, title, placement="bottom", trigger="hover", options = NULL) {
  
  options = buildTooltipOrPopoverOptionsList(title, placement, trigger, options)
  
  createTooltipOrPopoverOnUI(id, "tooltip", options)
  
}

#'@rdname tooltips
#'@details \code{removeTooltip} will remove any tooltips attached to the
#' selected element.
#'@export
removeTooltip <- function(session, id) {
  
  session$sendCustomMessage(type="updateTooltip", list(action = "remove", type = "tooltip", id = id))
  
}

#'@rdname tooltips
#'@param session The session object passed from shinyServer
#'@details \code{addTooltip} is called from within server.R to add tooltips to
#' elements
#'@export
addTooltip <- function(session, id, title, placement = "bottom", trigger = "hover", options = NULL) {
  
  options <- buildTooltipOrPopoverOptionsList(title, placement, trigger, options)
  createTooltipOrPopoverOnServer(session, id, "tooltip", options)
  
}



#'@templateVar item_name Popover
#'@template component
#'@details Popovers are used to convey small amounts of information to the user
#' of your shiny app. They are usually set to appear on click or hover and can
#' contain text to help better explain an element of your shiny app.
NULL

#'@rdname popovers
#'@param id The id of the element you want to attach/remove the popover to/from
#'@param title The title to appear at the top of the popover.
#'@param content The main body of the popover
#'@param placement Where the popover shoud appear relative to its target
#'@param trigger What action should cause the popover to appear
#'@param options A named list of additional popover options (See Details)
#'@details shiny and shinyBS use jQuery to select elements within the page.
#'shinyBS will prepend the \code{id} argument with a "#" to tell jQuery to look
#'for an id, but additional css selectors can be included within the \code{id}
#'argument. For example, if you wanted to attach a popover to the first header
#'of a table with an id of "tableEx" you could do something like \code{id =
#'"tableEx th:nth-child(1)"}.
#'
#' \code{options} gives access to less commonly used options in the bootstrap 
#' popover API. It should be a named list in which the names match options for 
#' popovers (See the Bootstrap documentation). Values provided in \code{options}
#' will overwrite any values provided by \code{title}, \code{content}, 
#' \code{placement}, or \code{trigger} arguments.
#' 
#' \code{bsPopover} is used from within ui.R to add popovers to elements
#' 
#'@section Options: \code{placement} can be \code{right}, \code{left},
#' \code{top}, or \code{bottom}
#'
#' \code{trigger} can be \code{hover}, \code{click}, \code{focus}, or
#' \code{manual}
#'@export
bsPopover <- function(id, title, content, placement="bottom", trigger="hover", options = NULL) {
  
  options = buildTooltipOrPopoverOptionsList(title, placement, trigger, options, content)
  
  createTooltipOrPopoverOnUI(id, "popover", options)
  
}

#'@rdname popovers
#'@details \code{removePopover} will remove any popovers attached to the
#' selected element.
#'@export
removePopover <- function(session, id) {
  
  session$sendCustomMessage(type="updateTooltip", list(action = "remove", type = "popover", id = id))
  
}

#'@rdname popovers
#'@param session The session object passed from shinyServer
#'@details \code{addPopover} is called from within server.R to add popovers to
#' elements
#'@export
addPopover <- function(session, id, title, content, placement = "bottom", trigger = "hover", options = NULL) {
  
  options <- buildTooltipOrPopoverOptionsList(title, placement, trigger, options)
  createTooltipOrPopoverOnServer(session, id, "popover", options)
  
}




























# Shared functions with really long names...
createTooltipOrPopoverOnServer <- function(session, id, type, options) {
  
  data <- list(action = "add", type = type, id = id, options = options)
  session$sendCustomMessage(type = "updateTooltipOrPopover", data)
  
}

createTooltipOrPopoverOnUI <- function(id, type, options) {
  
  options = paste0("{'", paste(names(options), options, sep = "': '", collapse = "', '"), "'}")
  
  sbsHead(tags$script(paste0("$(document).ready(function() {setTimeout(function() {shinyBS.addTooltip('", id, "', '", type, "', ", options, ")}, 100)});")))
  
}

buildTooltipOrPopoverOptionsList <- function(title, placement, trigger, options, content) {
  
  if(is.null(options)) {
    options = list()
  }
  
  if(!missing(content)) {
    if(is.null(options$content)) {
      options$content = content
    }
  }
  
  if(is.null(options$placement)) {
    options$placement = placement
  }
  
  if(is.null(options$trigger)) {
    if(length(trigger) > 1) trigger = paste(trigger, collapse = " ")
    options$trigger = trigger
  }
  
  if(is.null(options$title)) {
    options$title = title
  }
  
  return(options)
  
}