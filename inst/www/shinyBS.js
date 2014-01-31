//Makes it so clicking on an <a> tag such as bsNavLink won't return you to the top of the page.
$(document).ready(function() {

  $('a[href="#"]').click(function(e){
    e.preventDefault();
  })

})

//Creates an input binding for the bsNavDropdown object 
var dropdownBinding = new Shiny.InputBinding();
$.extend(dropdownBinding, {
  find: function(scope) {
    return $(scope).find(".sbs-dropdown");
  },
  getId: function(el) {
    return Shiny.InputBinding.prototype.getId.call(this, el) || el.name;
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
      $(this).parents(".sbs-dropdown").attr("data-value", $(this).text().trim());
      $(this).parents(".sbs-dropdown").removeClass("open");
    });
  },
  unsubscribe: function(el) {
    $(el).off(".dropdownBinding");
  }
});

Shiny.inputBindings.register(dropdownBinding);


//Creates input binding for TypeAhead Objects
var typeAheadBinding = new Shiny.InputBinding();

$.extend(typeAheadBinding, {
  
    find: function(scope) {
      return $(scope).find('.sbs-typeahead');
    },
    getId: function(el) {
      return Shiny.InputBinding.prototype.getId.call(this, el) || el.name;
    },
    getValue: function(el) {
      return el.value;
    },
    setValue: function(el, value) {
      el.value = value;
    },
    subscribe: function(el, callback) {
      $(el).on('keyup.textInputBinding input.textInputBinding', function(event) {
        callback(true);
      });
      $(el).on('change.textInputBinding', function(event) {
        callback(false);
      });
    },
    unsubscribe: function(el) {
      $(el).off('.textInputBinding');
    },
    receiveMessage: function(el, data) {
      
      if (data.hasOwnProperty('value')) {
        this.setValue(el, data.value);
      };
      if (data.hasOwnProperty('label')) {
        $(el).parent().find('label[for=' + el.id + ']').text(data.label);
      };
      if (data.hasOwnProperty('choices')) {
        $(el).data('typeahead').source = data.choices;
      };
      
      $(el).trigger('change');
      
    },
    getState: function(el) {
      return {
        label: $(el).parent().find('label[for=' + el.id + ']').text(),
        value: el.value
      };
    },
    getRatePolicy: function() {
      return {
        policy: 'debounce',
        delay: 250
      };
    }

});

Shiny.inputBindings.register(typeAheadBinding);


//Create Input Binding for bsNavtoggleLink Objects
var tLinkBinding = new Shiny.InputBinding();

$.extend(tLinkBinding, {
  find: function(scope) {
    return $(scope).find(".sbs-toggle");
  },
  getValue: function(el) {
    return $(el).parent().hasClass("active");
  },
  setValue: function(el, value) {
    $(el).parent().toggleClass("active", value);
  },
  getState: function(el) {
    return {
      label: $(el).text(),
      value: $(el).parent().hasClass("active")
    };
  },
  receiveMessage: function(el, data) {
    if(data.hasOwnProperty("value")) {
      $(el).parent().toggleClass("active", data.value);
    };
    if(data.hasOwnProperty("label")) {
      $(el).html(data.label);
    };
  },
  initialize: function(el) {
    $(el).click(function() {
      $(this).parent().toggleClass("active");
    })
  },

  subscribe: function(el, callback) {
    $(el).on("click.toggleLinkBinding", function(event) {
      callback();
    })  
  },
  unsubscribe: function(el) {
    $(el).off(".toggleLinkBinding");
  }

});

Shiny.inputBindings.register(tLinkBinding);












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

Shiny.addCustomMessageHandler("modifynavbar",
  function(data) {
    $el = $("#"+data.id);
    if(data.hasOwnProperty("brand")) {
      $el.find(".brand").text(data.brand);
    };
    if(data.hasOwnProperty("fixed")) {
      var f = $el.hasClass("navbar-fixed-top")
      $el.toggleClass("navbar-fixed-top", data.fixed);
      if($el.hasClass("navbar-fixed-top") && !f) {
        $("body").css("padding-top", function(i, oV) {
          return (parseInt(oV)+50)+"px";
        })
      } else if(!$el.hasClass("navbar-fixed-top") && f){
        $("body").css("padding-top", function(i, oV) {
          return (parseInt(oV)-50)+"px";
        })
      }
    };
    if(data.hasOwnProperty("inverse")) {
      $el.toggleClass("navbar-inverse", data.inverse);
    };
  });

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

Shiny.addCustomMessageHandler("addpopover",
  function(data) {
    addPopover(id=data.id, title=data.title, content=data.content, placement=data.placmenet, trigger=data.trigger)
  }
)




function addModal(id, target) {
  
  $("#"+id).attr({"href" : "#"+target,
                  "data-toggle" : "modal"
  });
  
};