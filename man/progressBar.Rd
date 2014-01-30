\name{bsProgressBar}
\alias{bsProgressBar}
\alias{updateProgressBar}

\title{
  Twitter Bootstrap Progress Bars
}
\description{
  Functions to add and update Twitter Bootstrap Progress Bars in Shiny.
}
\usage{
bsProgressBar(inputId, value = 0, visible = TRUE, color, 
              striped = FALSE, animate = FALSE)
updateProgressBar(session, inputId, value=NULL, visible=NULL, 
                  color=NULL, striped=NULL, animate=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}.
}
  \item{inputId}{
    The id of the input object.
}
  \item{value}{
    The current completion value between 0 and 100.
}
  \item{visible}{
    Should the progress bar be visible (\code{logical}).
}
  \item{color}{
    Following Twitter Bootstrap's style scheme, one of \code{standard}, \code{warning}, \code{danger}, \code{info}, or \code{success}. \code{standard} by default.
}
  \item{striped}{
    Should the progress bar be striped (\code{logical}).
}
  \item{animate}{
    Should the progress bar be animated (\code{logical}).
}
}
\details{
  Progress bars should be initialized with \code{bsProgress} in the \code{ui.R} script. They can then be updated using \code{updateProgressBar} from \code{server.R}.\cr\cr
  When using \code{updateProgressBar} only specify those arguments that you want to change. If you call \code{updateProgressBar(value = 25)} then only the value will be updated and they other options will remain unchanged.
}
\references{
  \href{http://getbootstrap.com/2.3.2/components.html#progress}{Progress Bars for Twitter Bootstrap 2.3.2}
}
\author{
Eric Bailey
}

\examples{
  ## Create a striped, green progress bar.
  ## In ui.R
  \dontrun{bsProgressBar("pb1", visible=FALSE, color="success", striped=TRUE)}
  
  ## Update previous progress bar 'pb1' to be 25\% filled and animated,
  ## In server.R
  \dontrun{updateProgressBar("pb1", value=25, animate=TRUE)}
}
