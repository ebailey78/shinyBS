//Creates input binding for TypeAhead Objects
var typeAheadBinding = new Shiny.InputBinding();
$.extend(typeAheadBinding, {
  find: function(scope) {
    return $(scope).find('.typeahead');
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
    $(el).off('.typeAheadBinding');
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

Shiny.addCustomMessageHandler("typeaheadUpdate", function(data) {
  var typeahead = $("input#" + data.id);
  if (data.hasOwnProperty('value')) {
    typeahead[0].value = data.value;
  };
  if (data.hasOwnProperty('label')) {
    typeahead.parent().find('label[for=' + data.id + ']').text(data.label);
  };
  if (data.hasOwnProperty('choices')) {
    typeahead.data('typeahead').source = data.choices;
  };
  typeahead.trigger('change');
})