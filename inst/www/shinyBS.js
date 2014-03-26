//Makes it so clicking on an <a> tag such as bsNavLink won't return you to the top of the page.
$(document).ready(function() {

  $('a[href="#"]').click(function(e){
    e.preventDefault();
  })
  
  $('.dropdown-menu .dropdown-submenu > a').click(function(event){
     event.stopPropagation();
  });

})

var controlItemBinding = new Shiny.InputBinding();
$.extend(controlItemBinding, {

  find: function(scope) {
    return $(scope).find(".sbs-control-item");
  },
  getValue: function(el) {
    return true;
  },
  setValue: function(el, value) {
    $(el).toggleClass("hide", value);
  },
  subscribe: function(el, callback) {
    $(el).on("click.controlItemBinding", function(e) {
      callback();
    })
  },
  unsubscribe: function(el) {
    $(el).off(".controlItemBinding");
  },
  receiveMessage: function(el, data) {

  },
  initialize: function(el) {
    if($(el).attr("data-tog")) {
      $(el).on("click", function(e) {
        $(el).children("a").children("span").children("i").toggleClass("icon-ok");
      })
    }
  }
});
























































































//New Input Bindings

var bsModalBinding = new Shiny.InputBinding();
$.extend(bsModalBinding, {

  find: function(scope) {
    return $(scope).find(".sbs-modal");
  },
  getValue: function(el) {
    return $(el).hasClass("in");
  },
  setValue: function(el, value) {
    $(el).toggleClass("hide", value);
  },
  subscribe: function(el, callback) {
    $(el).on("shown.bsModalBinding hidden.bsModalBinding", function(e) {
      callback();
    })
  },
  receiveMessage: function(el, data) {
    if(data.hasOwnProperty("toggle")) {
      if(data.toggle) {
        $(el).modal("toggle");
      }
    }
  },
  unsubscribe: function(el) {
    $(el).off(".bsModalBinding");
  },
  initialize: function(el) {
    var $trigger = $("#" + $(el).attr("data-trigger"));
    $trigger.attr("data-target", "#" + $(el).attr("id"));
    $trigger.attr("data-toggle", "modal");
  }
});
Shiny.inputBindings.register(bsModalBinding);

var bsButtonBinding = new Shiny.InputBinding();
$.extend(bsButtonBinding, {
  find: function(scope) {
    return $(scope).find(".sbs-btn");
  },
  getValue: function(el) {
    return $(el).attr('data-value');
  },
  setValue: function(el, value) {
    $(el).data('val', value);
  },
  subscribe: function(el, callback) {
    $(el).on("click.bsButtonBinding", function(e) {
        callback();
    });
  },
  getState: function(el) {
    return { value: this.getValue(el) };
  },
  receiveMessage: function(el, data) {
    updateButtonStyle(el, data);
  },    
  unsubscribe: function(el) {
    $(el).off(".bsButtonBinding");
  } 
});
Shiny.inputBindings.register(bsButtonBinding);

/* Creates a clone of the actionButtonBinding, but with a receiveMessage 
function for changing the style, size, etc. of the button. I tried to find a 
way to do this without just copying the input binding but was unsuccessful. */
var bsActionButtonInputBinding = new Shiny.InputBinding();
$.extend(bsActionButtonInputBinding, {
  find: function(scope) {
    return $(scope).find(".sbs-action-button");
  },
  getValue: function(el) {
    return $(el).data('val') || 0;
  },
  setValue: function(el, value) {
    $(el).data('val', value);
  },
  subscribe: function(el, callback) {
    $(el).on("click.bsActionButtonInputBinding", function(e) {
      if(!$(el).hasClass("disabled")) {
        var $el = $(this);
        var val = $el.data('val') || 0;
        $el.data('val', val + 1);
          callback();
      }})
  },
  getState: function(el) {
    return { value: this.getValue(el) };
  },
  receiveMessage: function(el, data) {
    updateButtonStyle(el, data);
  },    
  unsubscribe: function(el) {
    $(el).off(".bsActionButtonInputBinding");
  } 
});
Shiny.inputBindings.register(bsActionButtonInputBinding)

var bsToggleButtonBinding = new Shiny.InputBinding();
$.extend(bsToggleButtonBinding, {
  find: function(scope) {
    return $(scope).find(".sbs-toggle-button");
  },
  getValue: function(el) {
    return $(el).hasClass("bs-active");
  },
  setValue: function(el, value) {
    $(el).toggleClass("active bs-active", value);
  },
  subscribe: function(el, callback) {
    $(el).on("click.bsToggleButtonBinding", function(e) {
      if(!$(el).hasClass("disabled")) {
        $(el).toggleClass("bs-active");
        callback();
      } else {
        //Disabled toggle buttons appear to still toggle invisibly, this makes it to a double toggle so the state remains correct.
        $(el).toggleClass("active");
      }
    });
  },
  getState: function(el) {
    return { value: this.getValue(el) };
  },
  receiveMessage: function(el, data) {
    updateButtonStyle(el, data);
    if(data.hasOwnProperty("value")) {
      $(el).toggleClass("active bs-active", data.value);
    }
  },    
  unsubscribe: function(el) {
    $(el).off(".bsToggleButtonBinding");
  } 
});
Shiny.inputBindings.register(bsToggleButtonBinding);

//Creates an input binding for bsCollapse objects
var collapseBinding = new Shiny.InputBinding();
$.extend(collapseBinding, {
  find: function(scope) {
    return $(scope).find(".accordion");
  },
  getId: function(el) {
    return Shiny.InputBinding.prototype.getId.call(this, el) || el.name;
  },
  getValue: function(el) {
    var op = $(el).find(".in").map(function() {
      var v = $(this).attr("data-value");
      if(v == undefined) {
        v = null;  
      };
      return v;
    }).get();
    return op;  
  },
  
  receiveMessage: function(el, data) {
    if(data.hasOwnProperty('multiple')) {
      if(data.multiple == false) {
        $(el).find('.collapse').each(function(i, e) {
          $(this).data('collapse').$parent = $("#" + $(el).attr("id"));
        })
      } else {
        $(el).find('.collapse').each(function(i, e) {
          $(this).data('collapse').$parent = false;
        })
      }
    }
    if(data.hasOwnProperty('open')) {
      if(data.open instanceof Array) {
        $.each(data.open, function(i, e) {
          if($("#" + e).data('collapse').$parent == false) {
            if(!$("#" + e).hasClass("in")) {
              $("#" + e).collapse('show');
            }
          } else {
            if(!$("#" + data.open[0]).hasClass("in")) {
              $("#" + data.open[0]).collapse('show');
            }
          }
        })
      } else {
        if(!$("#" + data.open).hasClass("in")) {
          $("#" + data.open).collapse('show');
        }
      }
    }
    if(data.hasOwnProperty('close')) {
      if(data.close instanceof Array) {
        $.each(data.close, function(i, e) {
          if($("#" + e).hasClass("in")) {
            $("#" + e).collapse('hide');
          }
        })
      } else {
        if($("#" + data.close).hasClass("in")) {
          $("#" + data.close).collapse('hide');
        }
      }
    }

  },
  
  initialize: function(el) {

    if($(el).attr('data-multiple') == 'FALSE') {
      var par = "#"+$(el).attr("id")
    } else {
      var par = false;
    }
    $(el).find(".collapse").each(function(i, e) {
        $(this).collapse({parent: par, toggle: false});
    })
    
  },
  
  subscribe: function(el, callback) {
    $(el).find("div.accordion-body").on("shown hidden", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).find("div.accordion-body").off("shown hidden");
  }

});
Shiny.inputBindings.register(collapseBinding);

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
    if(data.hasOwnProperty('options')) {
      $(el).children("ul.dropdown-menu").replaceWith(data.options);
      this.initialize(el);
    }
  },
  subscribe: function(el, callback) {
    $(el).on("click.dropdownBinding", function(e) {
      callback();
    });
  },
  initialize: function(el) {
    $(el).find("li").not(".divider, .nav-header, .dropdown-submenu").click(function() {
      $(this).parents(".sbs-dropdown").attr("data-value", $(this).attr("data-value"));
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
    initialize: function(el) {
      $(el).typeahead();
    },
    subscribe: function(el, callback) {                                               
      $(el).on('keyup.typeAheadBinding input.typeAheadBinding', function(event) {
        callback(true);
      });
      $(el).on('change.typeAheadBinding', function(event) {
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
    $(el).on("click.tLinkBinding", function(event) {
      callback();
    })  
  },
  unsubscribe: function(el) {
    $(el).off("click.tLinkBinding");
  }

});
Shiny.inputBindings.register(tLinkBinding);

//Create Input Binding for bsButtonGroups
var buttonGroupBinding = new Shiny.InputBinding();
  $.extend(buttonGroupBinding, {
    find: function(scope) {
      return $(scope).find(".sbs-button-group");
    },
    getValue: function(el) {
      var op = $(el).children(".bs-active").map(function() {
        var v = $(this).attr("data-value");
        if(v == undefined) {
          v = null;  
        };
        return v;
      }).get();
      return op;
    },
    setValue: function(el, value) {
      $(el).children(".bs-active").removeClass("bs-active active");
      if(value instanceof Array) {
        $.each(value, function(i, e) {
          $(el).children("#" + e).addClass("active bs-active");
        })
      } else {
        $(el).children("#" + value).addClass("active bs-active");
      }
    },
    receiveMessage: function(el, data) {
      var $el = $(el);
      if(data.hasOwnProperty("toggle")) {
        if(data.toggle == "none") {
          $el.removeAttr("data-toggle");
          $el.children(".btn").removeClass("bs-active active");
        } else {
          if($(el).attr("data-toggle") == "buttons-radio") {
            $(el).children(".btn")
          }
          $el.attr("data-toggle", "buttons-" + data.toggle);
        }
      };
      if(data.hasOwnProperty("style")) {
        $el.children(".btn").removeClass("btn-primary btn-info btn-success btn-warning btn-danger btn-inverse btn-link");
        if(data.style != "default") {
          $el.children(".btn").addClass("btn-"+data.style);
        }
      };
      if(data.hasOwnProperty("size")) {
        $el.children(".btn").removeClass("btn-large btn-small btn-mini");
        if(data.size != "default") {
          $el.children(".btn").addClass("btn-"+data.size);
        }
      };
      if(data.hasOwnProperty("disabled")) {
        $el.children(".btn").toggleClass("disabled", data.disabled);
      };
      if(data.hasOwnProperty("value")) {
        var val = data.value;
        $el.children(".btn").removeClass("active bs-active");
        if(val instanceof Array & $el.attr("data-toggle") != "buttons-radio") {
          $.each(val, function(i, e) {
            $el.children(".btn[data-value = '"+e+"']").addClass("active bs-active");
          })
        } else {
          if(val instanceof Array & $el.attr("data-toggle") == "buttons-radio") {
            val = val[0];
          }
          $el.children(".btn[data-value = '"+val+"']").addClass("active bs-active");
        }
      };
    },
    subscribe: function(el, callback) {
      $(el).children(".btn").on("click", function(e) {
        if(!$(this).hasClass("disabled")) {
          if($(el).attr("data-toggle") == "buttons-radio") {
            $(el).children(".btn").removeClass("bs-active");
            $(this).addClass("bs-active");
          } else {
            $(this).toggleClass("bs-active");
          }
          callback();
        }
      })
    },
    unsubscribe: function(el) {
      $(el).children(".btn").off("click");
    }
  });
Shiny.inputBindings.register(buttonGroupBinding);


//Support Functions

function addPopover(id, title, content, placement, trigger) {

  var $id = $("#"+id)
  if($id.attr("type") == "slider") {
    $id = $id.parent();
  }
  if($id.hasClass("selectized")) {
    $id = $id.siblings("div.selectize-control");
  }
  var $par = $id.parent();
  if($par.is('[id]')) {
    var par = $par.attr("id");
  } else {
    var par = "par" + parseInt(Math.random()*1000000);
    $par.attr("id", par);
  }

  $id.popover('destroy');
  $id.popover({html: true,
              placement: placement,
              trigger: trigger,
              title: title,
              content: content,
              container: '#' + par
              });
  $id.data("popover")
};

function addTooltip(id, title, placement, trigger) {

  var $id = $("#"+id)
  if($id.attr("type") == "slider") {
    $id = $id.parent()
  }
  if($id.hasClass("selectized")) {
    $id = $id.siblings("div.selectize-control");
  }
  var $par = $id.parent();
  if($par.is('[id]')) {
    var par = $par.attr("id");
  } else {
    var par = "par" + parseInt(Math.random()*1000000);
    $par.attr("id", par);
  }

  $id.tooltip('destroy');
  $id.tooltip({title: title,
               placement: placement,
               trigger: trigger,
               html: true,
               container: "#"+par
  }); 
    
};

function updateButtonStyle(el, data) {
  
  var $el = $(el)
  if(data.hasOwnProperty("label")) {
    $el.html(data.label);
  }
  if(data.hasOwnProperty("style")) {
    $el.removeClass("btn-primary btn-info btn-success btn-warning btn-danger btn-inverse btn-link");
    if(data.style != "default") {
      $el.addClass("btn-"+data.style);
    }
  }
  if(data.hasOwnProperty("size")) {
    $el.removeClass("btn-large btn-small btn-mini");
    if(data.size != "default") {
      $el.addClass("btn-"+data.size);
    }
  }
  if(data.hasOwnProperty("block")) {
    $el.toggleClass("btn-block", data.block);
  }
  if(data.hasOwnProperty("disabled")) {
    $el.toggleClass("disabled", data.disabled);
  }
  
}


//New Customg Message Handlers

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
  })

Shiny.addCustomMessageHandler("addtooltip", 
  function(data) {
    addTooltip(id=data.id, title=data.title, placement=data.placement, trigger=data.trigger);
  }
);

Shiny.addCustomMessageHandler("removetooltip",
  function(tooltipid) {
    $("#"+tooltipid).tooltip("destroy");
  }
);

Shiny.addCustomMessageHandler("addpopover",
  function(data) {
    addPopover(id=data.id, title=data.title, content=data.content, placement=data.placement, trigger=data.trigger);
    
  }
);

Shiny.addCustomMessageHandler("removepopover",
  function(popoverid) {
    $("#"+popoverid).popover("destroy");
  }
);


// Table Highlighting Functions
Shiny.addCustomMessageHandler("highlightCells", 
  function(data) {
    
    var $tab = $("#"+data.id).children("table");
    if(data.skip) {
      var $tds = $tab.find("td:not(:first-child)");
    } else {
      var $tds = $tab.find("td");
    }
        
    if(data.hasOwnProperty("reset")) {
      if(data.reset) {
        $tds.removeClass().removeAttr("style");
      }
    }
    
    if(data.hasOwnProperty("regex")) {
      
      $tds = $tds.filter(function() {
        return this.textContent.match(data.regex);
      })
      
    } else {
      if(data.hasOwnProperty("min")) {
        $tds = $tds.filter(function() {
          return parseFloat($(this).text(), 10) >= parseFloat(data.min, 10)});
      }
      if(data.hasOwnProperty("max")) {
        $tds = $tds.filter(function() {
          return parseFloat($(this).text(), 10) <= parseFloat(data.max, 10)});
      }
    }
    
    if(data.hasOwnProperty("class")) {
      $tds.removeClass().removeAttr("style").addClass(data.class);
    }
    
    if(data.hasOwnProperty("style")) {
      $tds.removeAttr("style").attr("style", data.style);
    }
  }
);

Shiny.addCustomMessageHandler("highlightRows",
  function(data) {
  
    var $tab = $("#"+data.id).children("table");
    if($.isNumeric(data.column)) {
      var ind = parseInt(data.column, 10);
    } else {
      var ind = $tab.find("tr:first-child").children("th").filter(function() {
        return $.trim($(this).text()) == $.trim(data.column);
      }).index();
    }
    
    var $trs = $tab.find("tr:not(:first-child)")

    if(data.hasOwnProperty("reset")) {
      if(data.reset) {
        $trs.removeClass().removeAttr("style");
        $trs.children("td").removeClass().removeAttr("style")
      }
    }
    
    if(data.hasOwnProperty("regex")) {
      
      $trs = $trs.filter(function() {
        return $(this).children("td").eq(ind).get(0).textContent.match(data.regex);
      })
      
    } else {
      
      if(data.hasOwnProperty("min")) {
        $trs = $trs.filter(function() {
          return parseFloat($(this).children("td").eq(ind).text(), 10) >= parseFloat(data.min, 10)});
      }
      
      if(data.hasOwnProperty("max")) {
        $trs = $trs.filter(function() {
          return parseFloat($(this).children("td").eq(ind).text(), 10) <= parseFloat(data.max, 10)});
      }
      
    }
    
    if(data.hasOwnProperty("class")) {
      $trs.children("td").removeClass().removeAttr("style");
      $trs.removeClass().removeAttr("style").addClass(data.class);
    }
    if(data.hasOwnProperty("style")) {
      $trs.children("td").removeAttr("style");
      $trs.removeAttr("style").attr("style", data.style);
    }

})