var shinyBS = {inputBindings: {}};

Shiny.addCustomMessageHandler("createAlert", 
  function(data) {

    var cl = "alert";
    if(data.hasOwnProperty('type')) {
      cl = cl + " alert-" + data.type;
    } else {
      cl = cl + " alert-info";
    };
    if(data.hasOwnProperty('block')) {
      if(data.block == true) {
        cl = cl + " alert-block";
      }
    }
    
    if(data.dismiss == true) {
      cl = cl + " alert-dismissible";
    }
    
    al = "<div class='" + cl + "'"
    
    if(data.hasOwnProperty('alertId')) {
      al = al + " id=" + data.alertId
    }
    
    al = al + ">"
    
    if(data.dismiss == true) {
      al = al + "<button type='button' class='close' data-dismiss='alert'>&times;</button>";
    }
    
    if(data.hasOwnProperty('title')) {
      al = al+"<h4>" + data.title + "</h4>";
    }
    
    al = al + data.message + "</div>";
    
    if(data.append == true) {
      $(al).appendTo("#" + data.id);
    } else {
      $("#" + data.id).html(al);
    }
  
  }
);

Shiny.addCustomMessageHandler("closeAlert",
  function(alertId) {
    $("#"+alertId).alert('close');
  }
);

