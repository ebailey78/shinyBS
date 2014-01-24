\name{bsNavDateRangeInput}
\alias{bsNavDateRangeInput}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bsNavDateRangeInput(inputId, start = NULL, end = NULL, min = NULL, max = NULL, format = "yyyy-mm-dd", startview = "month", weekstart = 0, language = "en")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{inputId}{
%%     ~~Describe \code{inputId} here~~
}
  \item{start}{
%%     ~~Describe \code{start} here~~
}
  \item{end}{
%%     ~~Describe \code{end} here~~
}
  \item{min}{
%%     ~~Describe \code{min} here~~
}
  \item{max}{
%%     ~~Describe \code{max} here~~
}
  \item{format}{
%%     ~~Describe \code{format} here~~
}
  \item{startview}{
%%     ~~Describe \code{startview} here~~
}
  \item{weekstart}{
%%     ~~Describe \code{weekstart} here~~
}
  \item{language}{
%%     ~~Describe \code{language} here~~
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
function (inputId, start = NULL, end = NULL, min = NULL, max = NULL, 
    format = "yyyy-mm-dd", startview = "month", weekstart = 0, 
    language = "en") 
{
    if (inherits(start, "Date")) 
        start <- format(start, "\%Y-\%m-\%d")
    if (inherits(end, "Date")) 
        end <- format(end, "\%Y-\%m-\%d")
    if (inherits(min, "Date")) 
        min <- format(min, "\%Y-\%m-\%d")
    if (inherits(max, "Date")) 
        max <- format(max, "\%Y-\%m-\%d")
    tagList(singleton(tags$head(tags$script(src = "shared/datepicker/js/bootstrap-datepicker.min.js"), 
        tags$link(rel = "stylesheet", type = "text/css", href = "shared/datepicker/css/datepicker.css"))), 
        singleton(tags$head(tags$script(src = "tbs/shinyBS.js"), 
            tags$link(rel = "stylesheet", type = "text/css", 
                href = "tbs/shinyBS.css"))), tags$li(tags$form(class = "navbar-form", 
            tags$div(id = inputId, class = "shiny-date-range-input input-daterange", 
                tags$input(type = "text", `data-date-language` = language, 
                  `data-date-weekstart` = weekstart, `data-date-format` = format, 
                  `data-date-start-view` = startview, `data-min-date` = min, 
                  `data-max-date` = max, `data-initial-date` = start), 
                tags$input(type = "text", `data-date-language` = language, 
                  `data-date-weekstart` = weekstart, `data-date-format` = format, 
                  `data-date-start-view` = startview, `data-min-date` = min, 
                  `data-max-date` = max, `data-initial-date` = end)))))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
