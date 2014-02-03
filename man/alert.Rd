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

createAlert(session, inputId, alertId = NULL, title = NULL, message = NULL, 
            type = NULL, dismiss = TRUE, block = NULL, append = TRUE)
            
closeAlert(session, alertId)
}

\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}
  }
  \item{inputId}{
    Id of alert anchor to create alert in
  }
  \item{alertId}{
    An id for the created alert. Optional, but necessary if you want to close it later with \code{closeAlert}
  }
  \item{title}{
  A title for the alert. This text will be at the top of the alert and be in larger, bold font
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
  Should block formatting be applied to the alert? \code{logical}
  }
  \item{append}{
  Should the alert be added below other alerts already in the alert anchor (\code{TRUE}), or should it replace and already existing alerts (\code{FALSE})
  }
}

\details{
  By default each new alert will be added below any previously existing alerts. If you want only one alert to appear at a time change \code{append} to \code{FALSE}. This will cause new alerts to overwrite any previously existing alerts. \cr \cr
  Block style is an option discussed in the Twitter Bootstrap documentation, though it doesn't make any difference that the author can see. It was left in as an option for completenesses sake.
}

\references{
  \href{http://getbootstrap.com/2.3.2/components.html\#alerts}{Alerts for Twitter Bootstrap 2.3.2}
}

\author{
Eric Bailey
}

\note{
  Run \code{bsDemo()} for a live example of alerts.
}


\examples{
\dontrun{

  ## In ui.R
  ## Create an alert anchor:
  bsAlert(inputId="aa")
  
  ## In server.R
  ## Add an alert to the previously created alert anchor:
  createAlert(inputId = "aa", alertId="a1", 
              title = "Oops!", message="Something isn't right, please recheck your inputs.",
              type = "danger")
  ## Close the alert programatically
  closeAlert(session, alertId = "a1")
}
}
