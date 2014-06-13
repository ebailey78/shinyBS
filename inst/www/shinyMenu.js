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

/*
Binding for menu command links. These work just like action buttons but are for
shinyBS menus
*/
var shinyMenuCommandBinding = new Shiny.InputBinding();
$.extend(shinyMenuCommandBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-menu-command");
  },
  getValue: function(el) {
    return $(el).data('menu-value');
  },
  setValue: function(el, value) {
    $(el).data('menu-value', value);
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    var obj = this;
    $el.on("click.sbs-menu", function(e) {
      if($el.hasClass("disabled") == false) {
        obj.updateValue($el);
        $el.trigger("menuUpdate.sbs-menu");
      }
    })
    $el.on("menuUpdate.sbs-menu", function(e) {
      callback();
      if($el[0].hasAttribute("data-group") == true) {
        $("#" + $el.attr("data-group")).trigger("menuUpdate.sbs-menu");
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
    $(el).data("menu-value", 0);
  },
  updateValue: function($el) {
    var val = $el.data("menu-value");
    $el.data("menu-value", val + 1);
  }
});
Shiny.inputBindings.register(shinyMenuCommandBinding);

/*
Binding for menu checkbox links. These work just like action buttons but are for
shinyBS menus. This binding reuses as much as it can from the command link
binding.
*/
var shinyMenuCheckboxBinding = new Shiny.InputBinding();
$.extend(shinyMenuCheckboxBinding, shinyMenuCommandBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-menu-checkbox");
  },
  initialize: function(el) {
    $(el).data("menu-value", $(el).hasClass("sbs-menu-checked"));
  },
  updateValue: function($el) {
    var val = !$el.data("menu-value");
    $el.data("menu-value", val);
    $el.toggleClass("sbs-menu-checked", val);
    $el.find("i.left-icon")
      .toggleClass("fa-check-square-o", val)
      .toggleClass("fa-square-o", !val);
  }
});
Shiny.inputBindings.register(shinyMenuCheckboxBinding);


var shinyMenuRadioBinding = new Shiny.InputBinding();
$.extend(shinyMenuRadioBinding, shinyMenuCheckboxBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-menu-radio");
  },
  initialize: function(el) {
    var $el = $(el);
    // Radio groups must have one option selected by default, it not, this will select the first one encountered, by default
    var $act = $($.find("li.sbs-menu-radio.sbs-menu-checked[data-group = '" + $el.attr("data-group") + "']"))
    if($act.length == 0) {
        $el.data("menu-value", true)
          .addClass("sbs-menu-checked")
          .find("i.left-icon")
            .removeClass("fa-circle-o")
            .addClass("fa-dot-circle-o");     
    }
    $(el).data("menu-value", $(el).hasClass("sbs-menu-checked"));
  },
  updateValue: function($el) {
    var $act = $($.find("li.sbs-menu-radio.sbs-menu-checked[data-group = '" + $el.attr("data-group") + "']"))
    if($act.length > 0) {
      if($el.attr("id") != $act.attr("id")) {
        $act.data("menu-value", false)
          .removeClass("sbs-menu-checked")
          .find("i.left-icon")
            .removeClass("fa-dot-circle-o")
            .addClass("fa-circle-o");
        $act.trigger("menuUpdate.menu");
        
        $el.data("menu-value", true)
          .addClass("sbs-menu-checked")
          .find("i.left-icon")
            .removeClass("fa-circle-o")
            .addClass("fa-dot-circle-o");     
      }   
    }
  }
});
Shiny.inputBindings.register(shinyMenuRadioBinding);

var shinyMenuGroupBinding = new Shiny.InputBinding();
$.extend(shinyMenuGroupBinding, {
  find: function(scope) {
    return $(scope).find("span.sbs-menu-group")
  },
  getValue: function(el) {
    var $el = $(el);
    var $grp = $.find("li[data-group = '" + $el.attr("id") + "']")
    var val = [];
    $.each($grp, function(i, v) {
      var $v = $(v);
      if($v.data("menu-value") == true) {
        if($v.attr("data-menu-value") === undefined) {
          val.push($v.attr("id"));
        } else {
          val.push($v.attr("data-menu-value"));
        }
      }
    })
    return val;
  },
  subscribe: function(el, callback) {
    $(el).on("menuUpdate.sbs-menu", callback);
  },
  unsubscribe: function(el) {
    $(el).off(".sbs-menu");
  }
});
Shiny.inputBindings.register(shinyMenuGroupBinding);
/**/
