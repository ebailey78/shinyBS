// From: http://andreasnylin.com/blog/2011/09/jquery-not-child-of/
$.expr[':'].childof = function(obj, index, meta, stack){
    return $(obj).parent().is(meta[3]);
};

var controlMenuBinding = new Shiny.InputBinding();
$.extend(controlMenuBinding, {

  find: function(scope) {
    return $(scope).find(".sbs-control-menu");
  },
  getValue: function(el) {
    return $(el).data("sbs-value");
  },
  setValue: function(el, value) {
    
  },
  subscribe: function(el, callback) {
    $(el).find("li.control-item").on("sbs-click", function(e) {
      $(el).data('sbs-value')[$(this).attr('id')] = $(this).data('sbs-value')
      callback();  
    })
  },
  unsubscribe: function(el) {
    
  },
  receiveMessage: function(el, data) {
    
  },
  initialize: function(el) {
    var val = new Object;
    $(el).find("li.control-item").each(function(i, e) {
      if($(this).attr("data-sbs-toggle") !== undefined) {
        $(this).data('sbs-value', $(this).find("i.left-icon").hasClass('fa-check-square-o'));
      } else {
        $(this).data("sbs-value", 0);
      }
      val[$(this).attr('id')] = $(this).data("sbs-value");
    });
    $(el).data('sbs-value', val);
  }

});
Shiny.inputBindings.register(controlMenuBinding);

var controlLinkBinding = new Shiny.InputBinding();
$.extend(controlLinkBinding, {

  find: function(scope) {
    return $(scope).find("li.control-item");
  },
  getValue: function(el) {
    return $(el).data("sbs-value");
  },
  setValue: function(el, value) {
    if($(el).attr("data-sbs-toggle") != undefined) {
      $(el).find("i.left-icon").toggleClass("fa-check-square-o", value).toggleClass("fa-square-o", !value);
    }
    $(el).data('sbs-value', value);
  },
  subscribe: function(el, callback) {
    $(el).on("click", function(e) {
      var $el = $(this);
      if($el.attr("data-sbs-toggle") != undefined) {
        $el.find("i.left-icon").toggleClass('fa-square-o').toggleClass('fa-check-square-o');
        $el.data('sbs-value', $el.find('i.left-icon').hasClass('fa-check-square-o'));
      } else {
        var val = $el.data('sbs-value') || 0;
        $el.data('sbs-value', val + 1);
      }
      callback();
      $(el).trigger("sbs-click");
    })
  },
  unsubscribe: function(el) {
    
  },
  receiveMessage: function(el, data) {
    
  },
  initialize: function(el) {
    if($(this).attr("data-sbs-toggle") !== undefined) {
      $(el).data('sbs-value', $(el).find("i.left-icon").hasClass('fa-check-square-o'));
    } else {
      $(el).data("sbs-value", 0);
    }
  }

});
Shiny.inputBindings.register(controlLinkBinding);