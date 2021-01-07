#' Create a button or link that toggles the state of a
#' \code{\link{bsCollapsePanel}}.
#' 
#' @inheritParams shiny::actionButton
#'
#' @templateVar item_name bsCollapseButton
#' @templateVar family_name Collapses
#' @template item_details
#' @template footer
#'    
#' @param target HTML id of object to be toggled 
#' @param parent \bold{Optional} HTML id of parent container 
#' 
#' @importFrom shiny actionButton
#' @importFrom shiny actionLink
#' 
NULL

#'
#' @describeIn bsCollapseButton Create an \code{\link[shiny]{actionLink}}
#'   that will toggle the collapsed state of a
#'   \code{\link{bsCollapsePanel}} when clicked.
#' @export
bsCollapseButton <- function(inputId, label, target, parent=NULL, icon=NULL, width=NULL, ...)
{
  target = paste0("#", target)
  if(!is.null(parent)) parent <- paste0("#", parent)
  
  actionButton(inputId,
               label,
               icon=icon,
               width=width,
               ...,
               "data-toggle"="collapse",
               "data-target"=target,
               "data-parent"=parent
  )
}

#' @describeIn bsCollapseButton Create an \code{\link[shiny]{actionLink}}
#'   that will toggle the collapsed state of a
#'   \code{\link{bsCollapsePanel}} when clicked.
#' @export
bsCollapseLink <- function(inputId, label, target, parent=NULL, icon=NULL, width=NULL, ...)
{
  
  if(!is.null(parent)) 
    parent <- HTML(paste0("#", parent))
  
  tmp <- actionLink(inputId,
             label,
             icon=icon,
             width=width,
             ...,
             "data-toggle"="collapse",
             "data-parent"=parent
  )
  
  tmp$attribs$href=paste0('#', target)
  
  tmp
}

