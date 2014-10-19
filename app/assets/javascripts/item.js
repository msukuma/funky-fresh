$(function(){
  console.log("loaded");
  $(document).on("ajax:complete", "a.item-delete", function(event){
    var item = $(event.target);
    var row = item.closest("tr");
    row.remove();
  });



  $("div.new-item-create form").on("ajax:complete", function(event, data){
    console.log("adding items");
    console.log(data.responseText);
    $("#item-block").html(data.responseText);
  })
 });
