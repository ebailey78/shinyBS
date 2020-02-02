(function() {
  let collapse = new Shiny.InputBinding();
  $.extend(shinyBS.inputBindings.collapse, {
    find: function(scope) {
      return $(scope).find(".sbs-panel-group");
    },
    getValue: function(el) {
      return $(el).data("sbs-value");
    },
    receiveMessage: function(el, data) {
      var $el = $(el);
  /* I would think this code should work, but it doesn't for some reason so I am 
     commenting it out.
      if(data.hasOwnProperty('multiple')) {
        if(data.multiple) {
          $el.find(".collapse").each(function(i) {$(this).collapse({parent: false, toggle: false})});
        } else {
          $el.find(".collapse").each(function(i) {$(this).collapse({parent: "#"+$el.attr("id"), toggle: false})});
        }
      }
  */
      if(data.hasOwnProperty('style')) {
        var panels = Object.keys(data.style)
        for(var i = 0; i < panels.length; i++) {
          var $p = $el.find("div[value='" + panels[i] + "']")
          $p
            .removeClass("panel-primary panel-danger panel-warning panel-error panel-info panel-success")
            .addClass("panel-" + data.style[panels[i]]);
        }
      }
      if(data.hasOwnProperty('open')) {
        if(!Array.isArray(data.open)) {
          data.open = [data.open]
        }
        data.open.forEach(function(value, index, array) {
          $el.find("div[value='" + value + "'] > .panel-collapse").collapse("show");
        })
      }
      if(data.hasOwnProperty("close")) {
        if(!Array.isArray(data.close)) {
          data.close = [data.close];
        }
        data.close.forEach(function(value, index, array) {
          $el.find("div[value='" + value + "'] > .panel-collapse").collapse("hide");
        })
      }
    },
    subscribe: function(el, callback) {
      $(el).find(".collapse").on("shown.bs.collapse hidden.bs.collapse", callback);
    },
    initialize: function(el) {
      var $el = $(el);
      var $panels = $el.children(".panel");
      var val = [];
      $panels.each(function(i) {
        if($(this).children("div.panel-collapse.collapse").hasClass("in")) {
          val.push($(this).attr("value"));
        }
        var $pan = $(this).children("div.panel-collapse.collapse");
        if($el.attr("data-sbs-multi") == "FALSE") {
          var par = "#" + $el.attr("id");
        } else {
          var par = false;
        }
        $pan.collapse({parent: par, toggle: false});
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
  })
  Shiny.inputBindings.register(collapse);
})()