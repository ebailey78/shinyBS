(function() {

  // The following function refer to tooltips but are used in the creation of 
  // tooltips and popovers because there structure is so similar. type="popover"
  // will create a popover.
  
  shinyBS.addTooltip = function(id, type, opts) {
    
    var $id = shinyBS.getTooltipTarget(id);
    var dopts = {html: true};
    opts = $.extend(opts, dopts);
    
    if(type == "tooltip") {
      $id.tooltip("destroy");
      $id.tooltip(opts);
    } else if(type == "popover") {
      $id.popover("destroy");
      $id.popover(opts);
    }
    
  };
  
  shinyBS.removeTooltip = function(id, type) {
    var $id = shinyBS.getTooltipTarget(id);
    if(type == "tooltip") {
      $id.tooltip("destroy");
    } else if(type == "popover") {
      $id.popover("destroy");
    }
  };
  
  // Makes adjustments to the tooltip and popover targets for specialized 
  // shiny inputs/outputs
  shinyBS.getTooltipTarget = function(id) {
    
    var $id = $("#" + id).closest(".shiny-input-container, .shiny-bound-output, .btn, .shiny-download-link");
    
  /*  
    if($id.hasClass("js-range-slider")) {
      $id = $id.parent();
    } else if($id.hasClass("selectized")) {
      $id = $id.siblings("div.selectize-control")
    }
  */
  
    return $id;
    
  };
  
  Shiny.addCustomMessageHandler("updateTooltipOrPopover", function(data) {
    if(data.action == "add") {
      shinyBS.addTooltip(data.id, data.type, data.options);
    } else if(data.action == "remove") {
      shinyBS.removeTooltip(data.id, data.type);
    }
  });
  
})();