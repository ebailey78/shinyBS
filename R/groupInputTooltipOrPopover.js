# Function for UI-sided creation of tooltips and popovers for groupInputs,
# that is checkboxGroupInput and radioButtons. 
# Extends the bsTooltip/bsPopover by an additional input "choice", which lets the user
# define the input choice, which should get a tooltip. 
# The selection is made a bit finer, filtering by values to get the right element.


groupInputTooltip <- function(id, choice, title, placement = "bottom", trigger = "hover", options = NULL){

  options = shinyBS:::buildTooltipOrPopoverOptionsList(title, placement, trigger, options)
  buildGroupInputTooltipOrPopover(options, "tooltip", id, choice)
}

groupInputPopover <- function(id, choice, title, content, placement = "bottom", trigger = "hover", options = NULL){

  options = shinyBS:::buildTooltipOrPopoverOptionsList(title, placement, trigger, options, content)
  buildGroupInputTooltipOrPopover(options, "popover", id, choice)
}

buildGroupInputTooltipOrPopover <- function(options, type, id, choice){
  
  options = paste0("{'", paste(names(options), options, sep = "': '", collapse = "', '"), "'}")
  
  bsTag <- shiny::tags$script(shiny::HTML(paste0("
    $(document).ready(function() {
      setTimeout(function() {
        $('input', $('#", id, "')).each(function(){
          if(this.getAttribute('value') == '", choice, "') {
            opts = $.extend(", options, ", {html: true});
            $(this.parentElement).", type, "('destroy');
            $(this.parentElement).", type, "(opts);
          }
        })
      }, 500)
    });
  ")))
  
  htmltools::attachDependencies(bsTag, shinyBS:::shinyBSDep)
}
