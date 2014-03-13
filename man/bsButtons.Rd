\name{Button Customizations}
\alias{bsButtonGroup}
\alias{bsActionButton}
\alias{bsButton}
\alias{bsButtonGroup}
\alias{bsToggleButton}
\alias{updateButton}
\alias{updateButtonGroup}

\title{
  Shiny Button Customizations
}
\description{
  Functions for setting and changing the style, size, and state of various 
  buttons in a shiny app. 
}
\usage{
bsButton(inputId, label, value, style = NULL, size = NULL, block = FALSE, 
         disabled = FALSE)
bsActionButton(inputId, label, style = NULL, size = NULL, block = FALSE, 
               disabled = FALSE)
bsToggleButton(inputId, label, value, style = NULL, size = NULL, block = FALSE,
               disabled = FALSE)
bsButtonGroup(inputId, ..., label, toggle = "checkbox", style, size, 
              value = NULL, disabled = FALSE)
updateButton(session, id, label = NULL, value = NULL, style = NULL, size = NULL, 
             block = NULL, disabled = NULL)
updateButtonGroup(session, id, toggle = NULL, style = NULL, size = NULL, 
                  disabled = NULL, value = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}  
  }
  \item{inputId}{
    Id to assign to the button or button group 
}
  \item{id}{
    The id of the button/button group you want to update
  }
  \item{\dots}{
    \code{bsButton()} objects to be added to the button group
}
  \item{label}{
    For buttons, the text to appear inside the button. For button groups, an 
    optional label that will appear above the button group
}
  \item{toggle}{
    The type of toggle behaviour the button group should have (See Details)
}
  \item{style}{
    The bootstrap style the button(s) should take (See Details)
}
  \item{size}{
    The bootstrap size the button(s) should take (See Details)
}
  \item{block}{
    Should the button be a block level button? (i.e., should it span the width 
    of its parent element)
}
  \item{value}{
    The value of the button/button group (See Details)
}
  \item{disabled}{
    Should the button(s) be disabled? \code{logical}
}
}
\details{

\code{bsActionButton()} creates an action button that behaves just as a standard shiny action button does. It has the added functionality of being able to changed its style and size. It can also be disabled/enabled.\cr

\code{toggle} can take a value of either \code{radio} or \code{checkbox}. \code{radio} will allow only one button in the button group to be selected at a time. \code{checkbox} will allow any number of buttons to be selected at a time. \cr

\code{style} can be any of the styles described in the Twitter Bootstrap 2.3.2 documentation. Acceptable values are currently: primary, info, success, warning, danger, inverse, or link. Additionally, when calling one of the update functions, style can be set to \code{default} to return to the default button style.\cr

\code{size} can be any of the sizes described in the Twitter Bootstrap 2.3.2 documentation. Accepatble values are currently: large, small, or mini. Additionally, when calling one of the update functions, style can be set to \code{default} to return to the default size.\cr

For toggle buttons, \code{value} can be \code{TRUE} or \code{FALSE} and corresponds to whether the button is currently 'clicked.' For \code{bsButton}, \code{value} is used to set the value that will be returned by containing \code{bsButtonGroup} object when with button is clicked. For button groups, \code{value} is used to set the current value to be returned by the group and should correspond to values assigned to buttons contained in the button group.
}

\references{
  \href{http://getbootstrap.com/2.3.2/components.html}{Alerts for Twitter Bootstrap 2.3.2}
}

\author{
Eric Bailey
}

\note{
  Run \code{bsDemo()} for a live example of alerts.
}

\examples{
\dontrun{

  # Create an action button, toggle button and a button group 
  # with three buttons with default styling in ui.R
  bsActionButton("ab1", label = "bsActionButton"), 
  bsToggleButton("tb1", label = "bsToggleButton"), tags$p(), 
  bsButtonGroup("btngrp1", label = "bsButtonGroup", toggle = "radio", value = "right", 
                bsButton("btn1", label = "Left", value = "left"), 
                bsButton("btn2", label = "Middle", value = "middle"), 
                bsButton("btn3", label = "Right", value = "right")
                )
                
  # Update the previous buttons/button group to be small 
  # and of primary style in server.R
  updateButton(session, "ab1", style = "primary", size = "small") 
  updateButton(session, "tb1", style = "primary", size = "small") 
  updateButtonGroup(session, "btngrp1", style = "primary", size = "small")
}
}

