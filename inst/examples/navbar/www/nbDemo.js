Shiny.addCustomMessageHandler("options",
  function(data) {
    var $body = $("body");
    if(data.option == "bg") {
      var s = "background-color";
      var v = data.value;
    } else if (data.option == "txt") {
      var s = "color";
      var v = data.value;
    } else if (data.option== "txtsz") {
      var s = "font-size";
      var v = data.value + "pt";
    }
    $body.css(s, v);
  }
)