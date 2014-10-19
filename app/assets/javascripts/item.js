$(function(){
  console.log("loaded");
  $(document).on("ajax:complete", "a.item-delete", function(event){
    var item = $(event.target);
    console.log(item);
    var row = item.closest("tr");
    row.remove();
  });

  $(document).on("ajax:complete", "a.pantry-delete", function(event){
    var item = $(event.target);
    console.log(item);
    var row = item.closest("div");
    row.remove();
  });

  $(document).on("ajax:complete", "div.new-item-create form", function(event, data){
    var semiTarget = $(this).parent().prev()[0].children[1];
    $(this).parent().find("input:text").val("")
    $(semiTarget).html(data.responseText);
  });
});
