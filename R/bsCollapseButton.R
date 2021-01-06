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
#' @param target value HTML id of object to be toggled 
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
bsCollapseButton <- function(inputId, label, target, icon=NULL, width=NULL, ...)
{
  actionButton(inputId,
               label,
               icon=icon,
               width=width,
               ...,
               "data-toggle"="collapse",
               "data-target"=paste0("#", target)
  )
}

#' @describeIn bsCollapseButton Create an \code{\link[shiny]{actionLink}}
#'   that will toggle the collapsed state of a
#'   \code{\link{bsCollapsePanel}} when clicked.
#' @export
bsCollapseLink <- function(inputId, label, target, icon=NULL, width=NULL, ...)
{
  actionLink(inputId,
             label,
             icon=icon,
             width=width,
             ...,
             "data-toggle"="collapse",
             "data-target"=paste0("#", target)
  )
}

