//Creates and input binding for the bsNavDropdown object 
var dropdownBinding = new Shiny.InputBinding();
$.extend(dropdownBinding, {
  find: function(scope) {
    return $(scope).find(".shiny-dropdown");
  },
  getValue: function(el) {
    return $(el).attr("data-value");
  },
  setValue: function(el, value) {
    $(el).attr("data-value", value);
  },
  receiveMessage: function(el, data) {
    if(data.hasOwnProperty('selected')) {
      $(el).attr("data-value", data.selected)
    }
    if(data.hasOwnProperty('label')) {
      $(el).children("a").html(data.label+"<b class='caret'></b>");
    }
  },
  subscribe: function(el, callback) {
    $(el).on("click.dropdownBinding", function(e) {
      callback();
    });
  },
  initialize: function(el) {
    $(el).find("li").click(function() {
      $(this).parents(".shiny-dropdown").attr("data-value", $(this).text().trim());
      $(this).parents(".shiny-dropdown").removeClass("open");
    });
  },
  unsubscribe: function(el) {
    $(el).off(".dropdownBinding");
  }
});

Shiny.inputBindings.register(dropdownBinding);


Shiny.addCustomMessageHandler("createalert",
  function(data) {

    var cl = "alert";
    if(data.hasOwnProperty('type')) {
      cl = cl+" alert-"+data.type;
    };
    if(data.hasOwnProperty('block')) {
      if(data.block == true) {
        cl = cl+" alert-block";
      }
    }
    
    al = "<div class='"+cl+"'"
    
    if(data.hasOwnProperty('alertId')) {
      al = al + " id=" + data.alertId
    }
    
    al = al+">"
    
    if(data.dismiss == true) {
      al = al+"<button type='button' class='close' data-dismiss='alert'>&times;</button>";
    }
    
    if(data.hasOwnProperty('title')) {
      al = al+"<h4>"+data.title+"</h4>";
    }
    
    al = al + data.message + "</div>";
    
    if(data.append == true) {
      $(al).appendTo("#"+data.id);
    } else {
      $("#"+data.id).html(al);
    }
    
  }
);

Shiny.addCustomMessageHandler("closealert",
  function(alertId) {
    $("#"+alertId).alert('close');
  }
);

Shiny.addCustomMessageHandler("updateprogress",
  function(data) {
    $el = $("#"+data.id);
    if(data.hasOwnProperty('value')) {
      $el.find("div.bar").width(data.value+"%");
    };
    if(data.hasOwnProperty('visible')) {
      $el.toggleClass("hidden", !data.visible);
    };
    if(data.hasOwnProperty('color')) {
      $el.removeClass("progress-standard progress-info progress-success progress-danger progress-warning")
      $el.addClass("progress-"+data.color)
    };
    if(data.hasOwnProperty('striped')) {
      $el.toggleClass('progress-striped', data.striped);
    };
    if(data.hasOwnProperty('animate')) {
      $el.toggleClass('active', data.animate);
    } 
  }
);

function addTooltip(id, title, placement, trigger) {
  
    $("#"+id).tooltip('destroy');
    $("#"+id).tooltip({title: title,
                      placement: placement,
                      trigger: trigger,
                      html: true
    }); 
    
};

Shiny.addCustomMessageHandler("addtooltip", 
  function(data) {
    addTooltip(id=data.id, title=data.title, placement=data.placement, trigger=data.trigger);
  }
);







function addPopover(id, title, content, placement, trigger) {
  
  $("#"+id).popover({placement: placement,
                     trigger: trigger,
                     title: title,
                     content: content
                   });

};






function addModal(id, target) {
  
  $("#"+id).attr({"href" : "#"+target,
                  "data-toggle" : "modal"
  });
  
};