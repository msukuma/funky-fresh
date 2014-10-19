$(function(){
  console.log("loaded");
  $(document).on("ajax:complete", "a.item-delete", function(event){
    var item = $(event.target);
    var row = item.closest("tr");
    row.remove();
  });

  $(document).on("ajax:complete", "div.new-item-create form", function(event, data){
    // console.log($(event.target))
    semiTarget = $(this).parent().prev();
    semiTarget.html(data.responseText);
  });
});
