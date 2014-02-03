\name{bsNav Outputs}
\alias{bsNavTextOutput}
\title{
Text Output
}
\description{
Create text outputs for Twitter Bootstrap navBar in shiny
}
\usage{
bsNavTextOutput(inputId)
}
\arguments{
  \item{outputId}{
    output variable to read the value from
  }
}
\details{
  Works just like \code{\link{textOutput}} but with additional formatting for placement in navBars
}
\references{
\href{http://getbootstrap.com/2.3.2/components.html\#navbar}{Navbars for Twitter Bootstrap 2.3.2}
}
\author{
  Eric Bailey
}

\seealso{
\code{\link{textOutput}}
}
\examples{

\dontrun{

  ##In ui.R
  ##Create a text output in a navbar
  bsNavTextOutput(outputId = "to1")
}
}