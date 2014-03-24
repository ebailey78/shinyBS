\name{bsMedia}
\alias{bsMedia}
\title{
  Twitter Bootstrap Media Objects
}
\description{
  Creates a Twitter Bootstrap Media object, which has an image on the left, a title at the top right, and text on the buttom right. Looks similar to comments on many websites.
}
\usage{
bsMedia(id, heading, text, image)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{id}{
    An id for the media object
}
  \item{heading}{
    Large text that will appear on the upper right of the object
}
  \item{text}{
    the main content of the media object
}
  \item{image}{
    the url of an image to place on the left side of the object
}
}
\details{
  \code{bsMedia} was mainly created to produce a more content rich version of 
  the dropdown object. A shiny programmer can provide a named list of 
  \code{bsMedia} object to the choice argument of the bsNavDropDown and have 
  them rendered in the dropdown menu.
}
\references{
  \href{http://getbootstrap.com/2.3.2/components.html}{Media object for Twitter Bootstrap 2.3.2}
}

\author{
Eric Bailey
}

\note{
  Run \code{bsNavDemo()} for a live example of media objects in a dropdown.
}

\examples{
\dontrun{

  # Create a list to provide to the choices argument in bsNavDropDown
  media <- list(GI = bsMedia(id = "GI", header = "Gary IITRI", 
                             text = "Gary IITRI has been an active monitor since 1998...",
                             img = "GI_map.png"),
                NE = bsMedia(id = "NE", header = "Falls of the Ohio", 
                             text = "The Falls of the Ohio air toxics monitor is ...",
                             img = "NE_map.png"))
                             
  # Create a media object styled navbar dropdown
  bsNavBar("mainnb", "navBar Demo",
           bsNavDropDown("ndd2", "Monitors", media)
          )
                             
                          
}
}
