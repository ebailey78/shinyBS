\name{bsNavDropDown}
\alias{bsNavDropDown}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bsNavDropDown(inputId, label, choices, selected = "")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{inputId}{
%%     ~~Describe \code{inputId} here~~
}
  \item{label}{
%%     ~~Describe \code{label} here~~
}
  \item{choices}{
%%     ~~Describe \code{choices} here~~
}
  \item{selected}{
%%     ~~Describe \code{selected} here~~
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
function (inputId, label, choices, selected = "") 
{
    if (!inherits(label, "shiny.tag")) 
        label <- HTML(label)
    choices <- lapply(choices, function(choice) tags$li(tags$a(tabindex = "-1", 
        href = "#", HTML(choice))))
    tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"), 
        tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))), 
        tags$li(id = inputId, class = "dropdown shiny-dropdown", 
            `data-value` = selected, tags$a(href = "#", class = "dropdown-toggle", 
                `data-toggle` = "dropdown", label, tags$b(class = "caret")), 
            tags$ul(class = "dropdown-menu", choices)))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
