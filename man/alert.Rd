\name{createAlert}
\alias{bsAlert}
\alias{createAlert}
\alias{closeAlert}
\title{
Twitter Bootstrap Alerts
}
\description{
  Functions to add and remove Twitter Bootstrap alerts in Shiny
}
\usage{
bsAlert(inputId)
createAlert(session, inputId, alertId = NULL, title = NULL, message = NULL, type = NULL, dismiss = TRUE, block = NULL, append = TRUE)
closeAlert(session, alertId)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
The \code{session} object passed to function given to \code{shinyServer}.
}
  \item{inputId}{
    The Id of the alert anchor
}
  \item{alertId}{
    An id for the created alert. Optional, but necessary if you want to close it later with \code{closeAlert}
}
  \item{title}{
  A title for the alert. This text will be at the top of the alert and be in larger, bold font.
}
  \item{message}{
  The main text of the alert
}
  \item{type}{
  One of four options: \code{warning}, \code{danger}, \code{info}, or /code{success}
}
  \item{dismiss}{
  Should the user be able to dismiss the alert? \code{logical}
}
  \item{block}{
  Should block formatting be applied to the alert \code{logical}
}
  \item{append}{
  Should the alert be added below other alerts already in the alert anchor (\code{TRUE}), or should it replace and already existing alerts (\code{FALSE}).
}
}
\references{
\href{http://getbootstrap.com/2.3.2/components.html\#alerts}{Alerts for Twitter Bootstrap 2.3.2}}
\author{
Eric Bailey
}

\examples{
  \dontrun{Coming Soon}
}
