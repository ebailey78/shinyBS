var controlGroupBinding = new Shiny.InputBinding();
$.extend(controlGroupBinding, {

  find: function(scope) {
    return $(scope).find("li.sbs-control-group");
  },
  getValue: function(el) {
    return $(el).data("sbs-value");
  },
  setValue: function(el, value) {
    
  },
  subscribe: function(el, callback) {
    $(el).find("li.sbs-control-link").on("sbs-click", function(e) {
      callback();  
    })
  },
  unsubscribe: function(el) {
    
  },
  receiveMessage: function(el, data) {
    
  },
  initialize: function(el) {
    //initializeGroup(el);
  }

});
Shiny.inputBindings.register(controlGroupBinding);

var controlLinkBinding = new Shiny.InputBinding();
$.extend(controlLinkBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-control-link");
  },
  getValue: function(el) {
    return $(el).data('sbs-value') || 0;
  },
  setValue: function(el, value) {
    $(el).data('sbs-value', value);
  },
  subscribe: function(el, callback) {
    $(el).on("click.controlLink", function(e) {
      var $el = $(this);
      if($el.hasClass("disabled") == false) {
        var val = $el.data("sbs-value") || 0;
        $el.data("sbs-value", val + 1);
        callback();
      }
    })
  },
  unsubscribe: function(el) {
    $(el).off(".controlLink");
  },
  receiveMessage: function(el, data) {
    if(data.hasOwnProperty("disabled")) {
      $(el).toggleClass("disabled", data.disabled);
      $(el).trigger("change");
    }
  }

});
Shiny.inputBindings.register(controlLinkBinding);

var controlToggleLinkBinding = {};
$.extend(controlToggleLinkBinding, controlLinkBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-control-toggle");
  },
  subscribe: function(el, callback) {
    $(el).on("click.controlLink", function(e) {
      var $el = $(this);
      if($el.hasClass("disabled") == false) {
        $el.trigger("change.controlLink");
        callback();  
      }
    })
  },
  initialize: function(el) {
    var $el = $(el)
    var $on = $el.hasClass("sbs-toggle-on");
    $el.find("i.left-icon").toggleClass("fa-check-square-o", $on).toggleClass("fa-square-o", !$on);  
    $el.on("change.controlLink", function(e) {
      var $el = $(this);
      $el.toggleClass("sbs-toggle-on");
      var $on = $el.hasClass("sbs-toggle-on");
      $el.data('sbs-value', $on)
      $el.find("i.left-icon").toggleClass("fa-check-square-o", $on).toggleClass("fa-square-o", !$on);
    })
  }
});
Shiny.inputBindings.register(controlToggleLinkBinding);

var controlRadioLinkBinding = {};
$.extend(controlRadioLinkBinding, controlToggleLinkBinding, {
  find: function(scope) {
    return $(scope).find("li.sbs-control-radio") 
  },
  initialize: function(el) {
    var $el = $(el)
    var $on = $el.hasClass("sbs-toggle-on");
    $el.find("i.left-icon").toggleClass("fa-dot-circle-o", $on).toggleClass("fa-circle-o", !$on);  
    $(el).on("change.controlLink", function(e) {
      var $this = $(this);
      $this.siblings("li.sbs-control-radio").removeClass("sbs-toggle-on").find("i.left-icon").removeClass('fa-dot-circle-o').addClass("fa-circle-o").data('sbs-value', false);
      $this.data('sbs-value', true)
      $this.find("i.left-icon").addClass("fa-dot-circle-o").removeClass("fa-circle-o");
    })
  }

});
Shiny.inputBindings.register(controlRadioLinkBinding);

var controlRadioGroupBinding = new Shiny.InputBinding();
$.extend(controlRadioGroupBinding, {

  find: function(scope) {
    return $(scope).find("input.sbs-radio-group");
  },
  getValue: function(el) {
    return $(el).value
  },
  setValue: function(el, value) {
    $(el).value = value;
  },
  subscribe: function(el, callback) {
    $(el).children("li.sbs-radio-group").on("change.controlLink", function(e) {
      callback();
    })  
    
  }
  

})