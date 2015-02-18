hljs.configure({useBR: true});

$('div.code').each(function(i, block) {
  hljs.highlightBlock(block);
});

Shiny.addCustomMessageHandler("displayCode", function(data) {
  
  var $div = $("#" + data.id);
  $div.html(data.content);
  hljs.highlightBlock($div[0]);
  
})