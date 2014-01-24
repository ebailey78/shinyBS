\name{bsModal}
\alias{bsModal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bsModal(inputId, trigger, title, content)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{inputId}{
%%     ~~Describe \code{inputId} here~~
}
  \item{trigger}{
%%     ~~Describe \code{trigger} here~~
}
  \item{title}{
%%     ~~Describe \code{title} here~~
}
  \item{content}{
%%     ~~Describe \code{content} here~~
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
function (inputId, trigger, title, content) 
{
    tagList(singleton(tags$head(tags$script(src = "tbs/shinyBS.js"), 
        tags$link(rel = "stylesheet", type = "text/css", href = "tbs/shinyBS.css"))), 
        tags$div(id = inputId, class = "modal hide fade", tags$div(class = "modal-header", 
            tags$button(type = "button", class = "close", `data-dismiss` = "modal", 
                `aria-hidden` = "true", HTML("&times;")), tags$h4(title)), 
            tags$div(class = "modal-body", HTML(content)), tags$div(class = "modal-footer", 
                tags$a(href = "#", `data-dismiss` = "modal", 
                  `aria-hidden` = "true", class = "btn btn-primary", 
                  "Close"))), tags$script(paste0("addModal('", 
            trigger, "', '", inputId, "');")))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
