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
    initializeGroup(el);
  }

});
Shiny.inputBindings.register(controlGroupBinding);

var controlLinkBinding = new Shiny.InputBinding();
$.extend(controlLinkBinding, {

  find: function(scope) {
    return $(scope).find("li.sbs-control-link");
  },
  getValue: function(el) {
    return $(el).data("sbs-value");
  },
  setValue: function(el, value) {
    var $el = $(el); 
    if($el.attr("data-sbs-toggle") != undefined) {
      $el.find("i.left-icon").toggleClass("fa-check-square-o", value).toggleClass("fa-square-o", !value);
    }
    $el.data('sbs-value', value);
  },
  subscribe: function(el, callback) {
    var $el = $(el);
    $el.children("a").on("click", function(e) {
      updateLink($el);
      callback();
      $el.trigger("sbs-click");
    })
  },
  unsubscribe: function(el) {
    
  },
  receiveMessage: function(el, data) {
    
  },
  initialize: function(el) {

  }

});
Shiny.inputBindings.register(controlLinkBinding);

// Activates when a control-link is clicked
function updateLink($el) {
  
  if($el.attr("data-sbs-toggle") != undefined) {
    var $icon = $el.find("i.left-icon");
    $icon.toggleClass('fa-square-o').toggleClass('fa-check-square-o');
    $el.data('sbs-value', $icon.hasClass('fa-check-square-o'));
  } else {
    var val = $el.data('sbs-value') || 0;
    $el.data('sbs-value', val + 1);
  }
  updateGroup($el);
}

function updateGroup($el) {
  
  var $par = $el.parent('ul.dropdown-menu').parent("li.sbs-control-group");
  var val = $par.data("sbs-value");
  val[$el.attr("id")] = $el.data("sbs-value");
  $par.data("sbs-value", val);
    
}

function initializeLink(el) {
  var $el = $(el);
  if($el.attr("data-sbs-toggle") !== undefined) {
    $el.data('sbs-value', $el.find("i.left-icon").hasClass('fa-check-square-o'));
  } else {
    $el.data("sbs-value", 0);
  }
}

function initializeGroup(el) {
  var $el = $(el);
  var val = new Object;
  $el.children("ul.dropdown-menu").children("li.sbs-control").each(function(e) {
    var $this = $(this);
    if($this.hasClass("control-item")) {
      initializeItem(this);
    } else if($this.hasClass("sbs-control-group")) {
      initializeGroup(this);
    }
    val[$this.attr('id')] = $this.data('sbs-value');
  })
  $el.data('sbs-value', val);
}
