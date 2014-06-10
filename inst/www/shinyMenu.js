var shinyMenuPopupBinding = new Shiny.InputBinding();
$.extend(shinyMenuPopupBinding, {
  find: function(scope) {
    return $(scope).find("div.sbs-menu-popup");
  },
  getValue: function(el) {
    return $(el).hasClass("open");
  },
  subscribe: function(el, callback) {
    $(el).on("click", function(e) {callback();})
  },
  initialize: function(el) {
    var tar = $(el).attr("data-target");
    var $tar = $($.find("#" + tar));
    $tar.on("contextmenu", function(e) {
      e.preventDefault();
      $(el).addClass("open").css("top", e.clientY).css("left", e.clientX);
    })
    $(document).on("click", function(e) {
      $(el).removeClass("open");
    })
  }
});
Shiny.inputBindings.register(shinyMenuPopupBinding);

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
    $el.on("click.menu", function(e) {
      if($el.hasClass("disabled") == false) {
        obj.updateValue($el);
        $el.trigger("menuUpdate.menu");
      }
    })
    $el.on("menuUpdate.menu", function(e) {
        callback();
    })
  },
  unsubscribe: function(el) {
    $(el).off(".menu");
  },
  receiveMessage: function(el, data) {
    var $el = $(el);
    if(data.hasOwnProperty("disable")) {
      $el.toggleClass("disabled", data.disable)
    }
    if(data.hasOwnProperty("click")) {
      $el.trigger("click.menu");
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


var shinyMenuCheckboxBinding = new Shiny.InputBinding();
$.extend(shinyMenuCheckboxBinding, shinyMenuCommandBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-menu-checkbox");
  },
  initialize: function(el) {
    $(el).data("menu-value", $(el).hasClass("sbs-menu-checked"));
  },
  receiveMessage: function(el, data) {
    var $el = $(el);
    if(data.hasOwnProperty("disable")) {
      $el.toggleClass("disabled", data.disable)
    }
    if(data.hasOwnProperty("checked")) {
      if($el.hasClass("disabled") == false) {
        $el.data("menu-value", data.checked);
        $el.toggleClass("sbs-menu-checked", data.checked)
        $el.find("i.left-icon")
          .toggleClass("fa-check-square-o", data.checked)
          .toggleClass("fa-square-o", !data.checked);
        $el.trigger("menuUpdate.menu");
      }
    }
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
        if($v.attr("data-menu-value") === 'undefined') {
          val.push($v.attr("id"));
        } else {
          val.push($v.attr("data-menu-value"));
        }
      }
    })
    return val;
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    var $grp = $($.find("li[data-group = '" + $el.attr("id") + "']"));
    $grp.on("menuUpdate.menu", function(e) {
      callback();
    });
  }
});
Shiny.inputBindings.register(shinyMenuGroupBinding);
/**/
