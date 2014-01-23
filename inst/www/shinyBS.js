var dropdownBinding = new Shiny.InputBinding();

$.extend(dropdownBinding, {
  find: function(scope) {
    return $(scope).find(".shiny-dropdown");
  },
  getValue: function(el) {
    return $(el).attr("data-value");
  },
  setValue: function(el, value) {
    $(el).attr("data-value", value);
  },
  subscribe: function(el, callback) {
    $(el).on("click.dropdownBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".dropdownBinding");
  }
  
});

Shiny.inputBindings.register(dropdownBinding);

$(document).ready(function() {

  $(".shiny-dropdown").find("li").click(function() {

    $(this).parents(".shiny-dropdown").attr("data-value", $(this).text().trim());
    $(this).parents(".shiny-dropdown").removeClass("open");
  
  });

});


function addTooltip(id, title, placement, trigger) {
  $("#"+id).tooltip({title: title,
                    placement: placement,
                    trigger: trigger,
                    html: true
  });  
}

function addPopover(id, title, content, placement, trigger) {
  
  $("#"+id).popover({placement: placement,
                     trigger: trigger,
                     title: title,
                     content: content
                   });
                   
}

function addModal(id, target) {
  
  $("#"+id).attr({"href" : "#"+target,
                  "data-toggle" : "modal"
  });
  
}