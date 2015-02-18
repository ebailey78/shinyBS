var shinyBS = {inputBindings: {}};

Shiny.addCustomMessageHandler("bsAlertCreate", function(data) {

  var $alert = $("<div class = 'alert'></div>");
  
  if(data.hasOwnProperty('style')) {
    $alert.addClass("alert-" + data.style);
  } else {
    $alert.addClass("alert-info");
  }
  
  if(data.hasOwnProperty("dismiss")) {
    $alert.addClass("alert-dismissable");
  }

  if(data.hasOwnProperty("alertId")) {
    $alert.attr("id", data.alertId);
  }
  
  if(data.hasOwnProperty('dismiss')) {
    if(data.dismiss == true) {
      $alert.append("<button type='button' class='close' data-dismiss='alert'>&times;</button>")
    }
  }

  if(data.hasOwnProperty('title')) {
    $alert.append("<h4>" + data.title + "</h4>");
  }
  
  if(data.hasOwnProperty("content")) {
    $alert.append(data.content);
  }

  if(data.append == true) {
    $alert.appendTo("#" + data.id);
  } else {
    $("#" + data.id).html($alert);
  }

});

Shiny.addCustomMessageHandler("bsAlertClose", function(alertId) {
  $("#" + alertId).alert('close');
});