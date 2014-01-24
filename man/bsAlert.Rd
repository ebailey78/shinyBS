\name{bsAlert}
\alias{bsAlert}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bsAlert(id, text, type = "warn", dismiss = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{id}{
%%     ~~Describe \code{id} here~~
}
  \item{text}{
%%     ~~Describe \code{text} here~~
}
  \item{type}{
%%     ~~Describe \code{type} here~~
}
  \item{dismiss}{
%%     ~~Describe \code{dismiss} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (id, text, type = "warn", dismiss = TRUE) 
{
    tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"), 
        tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))), 
        tags$div(class = paste0("alert alert-", type), if (dismiss) 
            tags$button(type = "button", class = "close", `data-dismiss` = "alert", 
                HTML("&times;")), text))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
