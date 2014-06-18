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
      $el.data("menu-checked", data.value)
      $el.trigger("menuUpdate.sbs-menu");
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
    $el.on("menu-update.sbs-menu", function(e) {
      $el.find("i.left-icon")
        .toggleClass("fa-check-square-o", $el.data("menu-checked"))
        .toggleClass("fa-square-o", !$el.data("menu-checked"))
    });
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    $el.on("click.sbs-menu", function(e) {
      $el.data("menu-checked", !el.data("menu-checked"))
      $el.trigger("menu-update.sbs-menu");
    })
  }
});
Shiny.inputBindings.register(shinyMenu.bindings.checkboxBinding);

shinyMenu.bindings.radioBinding = new Shiny.InputBinding();
$.extend(shinyMenu.bindings.radioBinding, shinyMenu.bindings.checkboxBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-menu-item[data-menu-type = 'radio']");
  },
  initialize: function(el) {
    var $el = $(el);
    var grpname = $el.data("menu-group");
    // Radio groups must have one option selected by default, it not, this will select the first one encountered, by default
    var $act = $("li.sbs-menu-item[data-menu-group = '" + grpname + "']").filter(function() {
      return $(this).data("menu-checked");
    });
    if($act.length == 0) {
        $el.data("menu-checked", true)
          .find("i.left-icon")
            .removeClass("fa-circle-o")
            .addClass("fa-dot-circle-o");     
    }
    $el.on("menu-update.sbs-menu", function(e) {
      
    })
  },
  updateValue: function($el) {
    var grpname = $el.data("menu-group");
    var $act = $("li.sbs-menu-item[data-menu-group = '" + grpname + "']").filter(function() {
      return $(this).data("menu-checked")
    })
    if($act.length > 0) {
      if($el.attr("id") != $act.attr("id")) {
        $act.data("menu-checked", false)
          .find("i.left-icon")
            .removeClass("fa-dot-circle-o")
            .addClass("fa-circle-o");
        $act.trigger("menuUpdate.sbs-menu");
        
        $el.data("menu-checked", true)
          .find("i.left-icon")
            .removeClass("fa-circle-o")
            .addClass("fa-dot-circle-o");     
      }   
    }
  }
});
Shiny.inputBindings.register(shinyMenu.bindings.radioBinding);

var shinyMenuGroupBinding = new Shiny.InputBinding();
$.extend(shinyMenuGroupBinding, {
  find: function(scope) {
    return $(scope).find("span.sbs-menu-group")
  },
  getValue: function(el) {
    var $el = $(el);
    var $grp = $.find("li.sbs-menu-item[data-menu-group = '" + $el.attr("id") + "']")
    var val = [];
    $.each($grp, function(i, v) {
      var $v = $(v);
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
    $(el).on("menuUpdate.sbs-menu", function() {
        callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".sbs-menu");
  },
  receiveMessage: function(el, data) {
    if(data.hasOwnProperty("value")) {
      var $grp = $("li.sbs-menu-item[data-menu-group = '" + $(el).attr("id") + "']")
      if(data.value instanceof Array) {
        $.each($grp, function(i, v) {
          var $v = $(v);
          if(data.value.indexOf($v.data("menu-value")) != -1 || data.value.indexOf($v.attr("id")) != -1) {
            $v.data("menu-checked", true).trigger("click.sbs-menu");
          }
        })
      } else {
        $grp.filter(function() {
          return $(this).data("menu-value") == data.value | $(this).attr("id") == data.value
        }).data("menu-checked", true).trigger("click.sbs-menu");
      }
    }
  }
});
Shiny.inputBindings.register(shinyMenuGroupBinding);

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

shinyMenu.setCommandValue = function(el) {
  var $el = $(el);
  $el.data("menu-checked", $el.data("menu-checked") + 1);
}

/**/
