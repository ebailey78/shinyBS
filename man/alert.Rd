\name{bsAlert}
\alias{bsAlert}
\alias{createAlert}
\alias{closeAlert}
\title{
Twitter Bootstrap Alerts
}
\description{
Functions for creating and removing Twitter Bootstrap Alerts in Shiny.
}
\usage{
bsAlert(inputId)
createAlert(session, inputId, alertId = NULL, title=NULL, 
            message=NULL, type=NULL, dismiss=TRUE, block=NULL, 
            append=TRUE)
closeAlert(session, alertId) 
}

\arguments{
\item{session}{The \code{session} object passed to function given to \code{shinyServer}.}

\item{inputId}{The id of the alert anchor you want to add the alert to.}

\item{alertId}{An ID for the created alert. Necessary if you will need to remove the alert programmatically.}

\item{title}{Text for the title of the alert. This will be displayed in a larger font.}

\item{message}{Text for the main body of the alert.}

\item{type}{Following Twitter Bootstrap's style scheme, one of \code{warning}, \code{danger}, \code{info}, or \code{success}. \code{warning} by default.}

\item{dismiss}{Should the alert be user dismissable? \code{logical}}

\item{block}{Should the alert have additional padding suitable for larger alert messages? \code{logical}}

\item{append}{Should the alert be added to the alert anchor or should it replace all existing alerts? \code{logical}}
}
\details{
Use \code{bsAlert} to create an anchor in your ui.R file indicating where you want alerts to appear. Refer to that anchor's \code{inputId} in \code{createAlert} to create and alert at that position.
\cr\cr
Alerts can be destroyed programmatically with \code{closeAlert}, but only if you assigned them an \code{alertId} at creation.
}
\references{
  \href{http://getbootstrap.com/2.3.2/components.html#alerts}{Alerts for Twitter Bootstrap 2.3.2}
}
\author{
Eric Bailey
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (inputId) 
{
    tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"), 
        tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))), 
        tags$div(class = "shinybs-alert", id = inputId, " "))
  }
}
