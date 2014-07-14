var shinyMenu = {};
shinyMenu.bindings = {};
/*
Binding for menu command links. These work just like action buttons but are for
shinyBS menus. For consistency with the other menu types the 'menu-checked' 
attribute is used for what would seem to make more sense for the 'menu-value' 
attribute. But the 'menu-value' attribute is reserved to store the return value
for the radio and checkbox menu items.
*/
shinyMenu.bindings.commandBinding = new Shiny.InputBinding();
$.extend(shinyMenu.bindings.commandBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-menu-item[data-menu-type = 'command']");
  },
  getValue: function(el) {
    return $(el).data('menu-checked');
  },
  setValue: function(el, value) {
    $(el).data('menu-checked', value);
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    $el.on("click.sbs-menu", function(e) {
      if($el.hasClass("disabled") == false) {
        $el.data("menu-checked", $el.data("menu-checked") + 1);
        callback();
      }
    })
  },
  unsubscribe: function(el) {
    $(el).off(".sbs-menu");
  },
  receiveMessage: function(el, data) {
    var $el = $(el);
    if(data.hasOwnProperty("disabled")) {
      $el.toggleClass("disabled", data.disabled)
    }
    if(data.hasOwnProperty("value")) {
      $el.data("menu-value", data.value)
      $el.trigger("menu-update.sbs-menu");
    }
    if(data.hasOwnProperty("checked")) {
      $el.data("menu-checked", data.checked)
      $el.trigger("menu-update.sbs-menu")
    }
    if(data.hasOwnProperty("click")) {
      $el.trigger("click.sbs-menu");
    }
    if(data.hasOwnProperty("label")) {
      $el.find("span.sbs-menu-label").text(data.label)
    }
    if(data.hasOwnProperty("icon")) {
      $el.find("i").removeClass().addClass("fa fa-fw left-icon " + data.icon)
    }
  },
  initialize: function(el) {
    $(el).data("menu-checked", 0);
  }
});
Shiny.inputBindings.register(shinyMenu.bindings.commandBinding);

/*
Binding for menu checkbox links. These work just like checkbox inputs but are for
shinyBS menus. This binding reuses as much as it can from the command link
binding.
*/
shinyMenu.bindings.checkboxBinding = new Shiny.InputBinding();
$.extend(shinyMenu.bindings.checkboxBinding, shinyMenu.bindings.commandBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-menu-item[data-menu-type = 'checkbox']");
  },
  initialize: function(el) {
    var $el = $(el);
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    $el.on("click.sbs-menu", function(e) {
      $el.data("menu-checked", !$el.data("menu-checked"))
      $el.trigger("menu-update.sbs-menu");
    });
    
    $el.on("menu-update.sbs-menu", function(e) {
      $el.find("i.left-icon")
        .toggleClass("fa-check-square-o", $el.data("menu-checked"))
        .toggleClass("fa-square-o", !$el.data("menu-checked"))
      callback();
      if($el.data("menu-group") !== undefined) {
        $("span#" + $el.data("menu-group")).trigger("menu-update.sbs-menu");
      }
    });
  }
});
Shiny.inputBindings.register(shinyMenu.bindings.checkboxBinding);

shinyMenu.bindings.radioBinding = new Shiny.InputBinding();
$.extend(shinyMenu.bindings.radioBinding, shinyMenu.bindings.checkboxBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-menu-item[data-menu-type = 'radio']");
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    $el.on("click.sbs-menu", function(e) {
      if(!$el.hasClass("disabled")) {
        if(!$el.data("menu-checked")) {
          $el.data("menu-checked", true);
          $el.trigger("menu-update.sbs-menu");
        }
      }
    });
    $el.on("menu-update.sbs-menu", function(e) {
      
      //Find all radio menu items in the group
      var $grp = $("li.sbs-menu-item[data-menu-group = '" + $el.data("menu-group") + "']")
      
      // Filter out the selected element and set the rest to false
      $grp.filter(function() {
          return $(this).attr("id") != $el.attr("id");      
      }).data("menu-checked", false)
        .find("i.left-icon")
          .removeClass("fa-dot-circle-o")
          .addClass("fa-circle-o");
      
      // Change $el icon to 'checked'
      $el.find("i.left-icon")
        .addClass("fa-dot-circle-o")
        .removeClass("fa-circle-o");
      
      // Trigger a callback for all elements in the group
      $grp.trigger("menu-callback.sbs-menu");
      
      // Trigger an update of the menu-group as well.
      $("span#" + $el.data("menu-group")).trigger("menu-update.sbs-menu");
      
    });
    $el.on("menu-callback.sbs-menu", function(e) {
      callback();
    })
  },
  initialize: function(el) {
    var $el = $(el);
    var grpname = $el.data("menu-group");
    // Radio groups must have one option selected by default, it not, this will 
    // select the first one encountered, by default
    var $act = $("li.sbs-menu-item[data-menu-group = '" + grpname + "']")
      .filter(function() {
        return $(this).data("menu-checked");
      });
    if($act.length == 0) {
        $el.data("menu-checked", true)
          .find("i.left-icon")
            .removeClass("fa-circle-o")
            .addClass("fa-dot-circle-o");     
    }
  }
});
Shiny.inputBindings.register(shinyMenu.bindings.radioBinding);

shinyMenu.bindings.groupBinding = new Shiny.InputBinding();
$.extend(shinyMenu.bindings.groupBinding, {
  find: function(scope) {
    return $(scope).find("span.sbs-menu-group")
  },
  getValue: function(el) {
    var $el = $(el);
    var $grp = $("li.sbs-menu-item[data-menu-group = '" + $el.attr("id") + "']")
    var val = [];
    $grp.each(function(i) {
      var $v = $(this);
      if($v.data("menu-checked") == true) {
        if($v.data("menu-value") === undefined) {
          val.push($v.attr("id"));
        } else {
          val.push($v.data("menu-value"));
        }
      }
    })
    return val;
  },
  subscribe: function(el, callback) {
    $(el).on("menu-update.sbs-menu", function() {
        callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".sbs-menu");
  },
  receiveMessage: function(el, data) {
    var $el = $(el)
    var $grp = $("li.sbs-menu-item[data-menu-group = '" + $el.attr("id") + "']")
    if(data.hasOwnProperty("disabled")) {
      $grp.toggleClass("disabled", data.disabled)
    }
    if(data.hasOwnProperty("checked")) {
      $grp.each(function(i) {
        var $v = $(this);
        if(data.checked.indexOf($v.data("menu-value")) != -1 || data.checked.indexOf($v.attr("id")) != -1) {
          $v.data("menu-checked", true).trigger("menu-update.sbs-menu");
        } else {
          $v.data("menu-checked", false).trigger("menu-update.sbs-menu");
        }
      })
    }
  }
});
Shiny.inputBindings.register(shinyMenu.bindings.groupBinding);

shinyMenu.bindings.dateRangePresets = new Shiny.InputBinding();
$.extend(shinyMenu.bindings.dateRangePresets, {
  find: function(scope) {
    return $(scope).find("div.date-range-presets");
  },
  getValue: function(el) {
    
  },
  setValue: function(el, value) {
    
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    $el.find("li.date-range-preset").on("click", function(e) {
      $el.data("value", $(this).data("value"));
      var val = $el.data("value")
      var $tar = $("#" + $(this).data("target"));
      var $inputs = $tar.find("input");
      if(val[0] !== "") {
        $inputs.eq(0).datepicker("update", val[0]);
      }
      if(val[1] !== "") {
        $inputs.eq(1).datepicker("update", val[1]);
      }
      $tar.datepicker("updateDates");
      $tar.trigger("changeDate");
      callback();
    })
  },
  unsubscribe: function(el) {
    $(el).off(".sbs-menu")
  },
  initialize: function(el) {
    $(el).data("value", false)
  }
});
Shiny.inputBindings.register(shinyMenu.bindings.dateRangePresets);


/*
var shinyToolbarMenuBinding = new Shiny.InputBinding();
$.extend(shinyToolbarMenuBinding, {
  find: function(scope){
    return $(scope).find(".sbs-menu[data-type = 'toolbar']");
  },
  getValue: function(el) {
    return $(el).hasClass("open");
  },
  setValue: function(el, value) {
    // Strictly speaking, you're never supposed to do this...
    $(el).toggleClass("open", value);
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    $el.on("click", function(e) {
      var $p = $el.children("ul");
      var x = $p.left();
      var y = $p.top();
      var h = $p.outerHeight();
      var w = $p.outerWidth();
      var wh = $(document).height();
      var ww = $(document).width();
      
      if(x + h > wh & h < wh) {
        $el.removeClass("dropdown").addClass("dropup")
      } else {
        $el.removeClass("dropup").addClass("dropdown")
      }

    })
    $(document).on("click", function(e) {
      if($el.hasClass("open")) {
        $el.removeClass("open");
        callback();
      }
    });
  }  
});
Shiny.inputBindings.register(shinyToolbarMenuBinding);

var shinySubmenuMenuBinding = new Shiny.InputBinding();
$.extend(shinySubmenuMenuBinding, {
  find: function(scope){
    return $(scope).find(".sbs-menu[data-type = 'submenu']");
  },
  getValue: function(el) {
    return $(el).hasClass("open");
  },
  setValue: function(el, value) {
    // Strictly speaking, you're never supposed to do this...
    $(el).toggleClass("open", value);
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    $el.on("mouseover", function(e) {
      var $p = $el.children("ul");
      var pos = $p.offset();
      var h = $p.outerHeight();
      var w = $p.outerWidth();
      var wh = $(document).height();
      var ww = $(document).width();
      
      if(pos.top + h > wh & h < wh) {
        $el.removeClass("dropdown").addClass("dropup")
      } else {
        $el.removeClass("dropup").addClass("dropdown")
      }
      
      if(pos.left + w > ww & w < ww) {
        $el.addClass("pull-left")
      } else {
        $el.removeClass("pull-left")
      }

    })
    $(document).on("click", function(e) {
      if($el.hasClass("open")) {
        $el.removeClass("open");
        callback();
      }
    });
  }  
});
Shiny.inputBindings.register(shinySubmenuMenuBinding);
*/

/*
Binding for the Popup menus. Popup menus aren't strictly inputs but they will 
return a value indicating when they are opened so that may be useful...
*/
var shinyPopupMenuBinding = new Shiny.InputBinding();
$.extend(shinyPopupMenuBinding, {
  find: function(scope) {
    return $(scope).find("div.sbs-menu[data-type = 'popup']");
  },
  getValue: function(el) {
    return $(el).hasClass("open");
  },
  setValue: function(el, value) {
    // Strictly speaking, you're never supposed to do this...
    $(el).toggleClass("open", value);
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    var $tar = $("#" + $(el).attr("data-target"));
    $tar.on("contextmenu.sbs-menu", function(e) {
      e.preventDefault();
      var x = e.clientX;
      var y = e.clientY;
      var wh = $(document).height();
      var ww = $(document).width();
      var $p = $el.children("ul");
      var h = $p.outerHeight();
      var w = $p.outerWidth();
      if(x + w > ww) x = ww - w;
      if(y + h > wh) y = wh - h;      
      $el.addClass("open").css("top", y).css("left", x);
      callback();
    });
    $(document).on("click", function(e) {
      if($el.hasClass("open")) {
        $el.removeClass("open");
        callback();
      }
    });
  },
  unsubscribe: function(el) {
    $(el).off(".sbs-menu");
  }
});
Shiny.inputBindings.register(shinyPopupMenuBinding);

/**/
