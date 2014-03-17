\name{Table Highlighting}
\alias{highlightRows}
\alias{highlightCells}
\title{
Table Highlighting
}
\description{
  Functions to style table elements based on their contents.
}
\usage{
highlightRows(session, id, column, min = NULL, max = NULL, regex = NULL, 
              class = NULL, style = NULL, reset = NULL)
highlightCells(session, id, min = NULL, max = NULL, regex = NULL, class = NULL, 
               style = NULL, reset = NULL, skip.row.names = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{session}{
    The \code{session} object passed to function given to \code{shinyServer}
}
  \item{id}{
    The id of the table you want to highlight
}
  \item{column}{
    For \code{highlightRows} the column to do matching on
}
  \item{min}{
    The minimum value of a cell that will match (inclusive)
}
  \item{max}{
    The maximum value of a cell that will match (inclusive)
}
  \item{regex}{
    A regular expression to base the match on.
}
  \item{class}{
    The name of the class to apply to matches
}
  \item{style}{
    CSS style attributes to apply to matches
}
  \item{reset}{
    Should preexisting styles be removed?
}
  \item{skip.row.names}{
    Should the first column of the table be ignored because it contains row names?
  }
}
\details{
  \code{highlightCells()} is used for highlighting individual cells and \code{highlightRows()} is used for highlighting entire rows. Both functions use the same arguments with \code{highlightRows()} having an additional column argument for indicating the column to search. You can supply the column argument with the value that appears in the top row or with a numeric index value for the column.\cr

Cells can be styled with the class or style arguments. class can be one of eight predefined classes (success, warning, error, info, good, bad, neutral, disabled) or any class you have defined. If you use the style argument its contents will be directly inserted into the style attribute of matching td and tr elements.
}
\references{
  \href{http://getbootstrap.com/2.3.2/base-css.html}{Tables for Twitter Bootstrap 2.3.2}
}

\author{
Eric Bailey
}

\note{
  Run \code{bsDemo()} for a live example of alerts.
}
\examples{
\dontrun{

  # Apply the 'warning' class to cells in table 'htTable' that contain a value 
  # between 5 and 10
  highlightCells(session, 'htTable', class = "warning", min = 5, max = 10)
  
  # Apply the 'info' class to rows in table 'htTable' where the text in the 
  # first column contains an 'i'.
  highlightRows(session, 'htable', column = NULL, class = "info", regex = "i")
}

}