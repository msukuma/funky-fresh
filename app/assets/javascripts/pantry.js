$(function(){
    console.log("page loaded")
    $(".pantry-delete").on("ajax:success", function(event, data, status, xhr){
      console.log(event.target)
      var item = $(event.target).closest("tr");
      console.log(item);
      item.remove();
   });
 });