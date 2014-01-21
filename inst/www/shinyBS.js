function addTooltip(id, title, placement, trigger) {

  $("#"+id).tooltip({title: title,
                    placement: placement,
                    trigger: trigger});  
  
}

function addPopover(id, title, content, placement, trigger) {
  
  $("#"+id).popover({placement: placement,
                     trigger: trigger,
                     title: title,
                     content: content
                   });
                   
}