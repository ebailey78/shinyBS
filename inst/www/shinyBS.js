var shinyBS = {inputBindings: {}};

shinyBS.inputBindings.collapse = new Shiny.InputBinding();
$.extend(shinyBS.inputBindings.collapse, {
  find: function(scope) {
    return $(scope).find(".sbs-panel-group");
  },
  getValue: function(el) {
    return $(el).data("sbs-value");
  },
  receiveMessage: function(el, data) {
    var $el = $(el);
    if(data.hasOwnProperty('multiple')) {
      if(data.multiple) {
        $el.find(".collapse").each(function(i) {$(this).collapse({parent: false, toggle: false})});
      } else {
        $el.find(".collapse").each(function(i) {$(this).collapse({parent: "#"+$el.attr("id"), toggle: false})});
      }
    }
    if(data.hasOwnProperty('type')) {
      panels = Object.keys(data.type)
      for(var i = 0; i < panels.length; i++) {
        $el.find("#" + panels[i]).parent().attr("class", "panel panel-" + data.type[panels[i]])
      }
    }
    if(data.hasOwnProperty('open')) {
      if(!Array.isArray(data.open)) {
        data.open = [data.open]
      }
      data.open.forEach(function(value, index, array) {
        $el.find("#" + value).collapse("show");
      })
    }
    if(data.hasOwnProperty("close")) {
      if(!Array.isArray(data.close)) {
        data.close = [data.close];
      }
      data.close.forEach(function(value, index, array) {
        $el.find("#" + value).collapse("hide");
      })
    }
  },
  subscribe: function(el, callback) {
    $(el).find(".collapse").on("shown.bs.collapse hidden.bs.collapse", callback);
  },
  initialize: function(el) {
    var $el = $(el);
    var $panels = $el.find(".panel");
    var val = [];
    $panels.each(function(i) {
      if($(this).find("div.panel-collapse.collapse").hasClass("in")) {
        val.push($(this).attr("value"));
      }
    });
    $el.data("sbs-value", val);
    $panels.on("show.bs.collapse", function(event) {
      var val = $el.data("sbs-value");
      val.push($(this).attr("value"));
      $el.data("sbs-value", val)
    });
    $panels.on("hide.bs.collapse", function(event) {
      var val = $el.data("sbs-value");
      var i = val.indexOf($(this).attr("value"))
      if(i != -1) {
        val.splice(i, 1);
        $el.data("sbs-value", val);
      }
    });
  }
});
Shiny.inputBindings.register(shinyBS.inputBindings.collapse);

shinyBS.inputBindings.modal = new Shiny.InputBinding();
$.extend(shinyBS.inputBindings.modal, {
  find: function(scope) {
    return $(scope).find(".sbs-modal");
  },
  getValue: function(el) {
    return $(el).hasClass("in");
  },
  subscribe: function(el, callback) {
    $(el).on("hidden.bs.modal shown.bs.modal", callback)
  },
  unsubscribe: function(el) {
    $(el).off("hidden.bs.modal shown.bs.modal")
  },
  receiveMessage: function(el, data) {
    if(data.hasOwnProperty("toggle")) {
      if(data.toggle == "show") {
        $(el).modal("show");
      } else if(data.toggle == "hide") {
        $(el).modal("hide");
      } else {
        $(el).modal("toggle");
      }
    };
  },
  initialize: function(el) {
    $("#" + $(el).attr("data-sbs-trigger")).attr({"data-toggle": "modal", "data-target": "#" + $(el).attr("id")});
  }
});
Shiny.inputBindings.register(shinyBS.inputBindings.modal);

Shiny.addCustomMessageHandler("createAlert", 
  function(data) {

    var cl = "alert";
    if(data.hasOwnProperty('type')) {
      cl = cl + " alert-" + data.type;
    } else {
      cl = cl + " alert-info";
    };
    if(data.hasOwnProperty('block')) {
      if(data.block == true) {
        cl = cl + " alert-block";
      }
    }
    
    if(data.dismiss == true) {
      cl = cl + " alert-dismissible";
    }
    
    al = "<div class='" + cl + "'"
    
    if(data.hasOwnProperty('alertId')) {
      al = al + " id=" + data.alertId
    }
    
    al = al + ">"
    
    if(data.dismiss == true) {
      al = al + "<button type='button' class='close' data-dismiss='alert'>&times;</button>";
    }
    
    if(data.hasOwnProperty('title')) {
      al = al+"<h4>" + data.title + "</h4>";
    }
    
    al = al + data.message + "</div>";
    
    if(data.append == true) {
      $(al).appendTo("#" + data.id);
    } else {
      $("#" + data.id).html(al);
    }
  
  }
);

Shiny.addCustomMessageHandler("closeAlert",
  function(alertId) {
    $("#"+alertId).alert('close');
  }
);

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
  
}

shinyBS.removeTooltip = function(id, type) {
  var $id = shinyBS.getTooltipTarget(id);
  if(type == "tooltip") {
    $(id).tooltip("destroy");
  } else if(type == "popover") {
    $(id).popover("destroy");
  }
}

// Makes adjustments to the tooltip and popover targets for specialized 
// shiny inputs/outputs
shinyBS.getTooltipTarget = function(id) {
  
  var $id = $("#" + id);
  
  if($id.hasClass("js-range-slider")) {
    $id = $id.parent();
  }

  return $id;
  
}

Shiny.addCustomMessageHandler("updateTooltipOrPopover", function(data) {
  if(data.action == "add") {
    shinyBS.addTooltip(data.id, data.type, data.options);
  } else if(data.action == "remove") {
    shinyBS.removeTooltip(data.id, data.type)
  }
})

