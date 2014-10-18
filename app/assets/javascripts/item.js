$(function(){
  $(".item-delete").on("ajax:success", function(event, data, status, xhr){
      console.log(event.target)
      var item = $(event.target).closest("tr");
      console.log(item);
      item.remove();
   });

  $(".item-new").on("ajax:complete", function(event, data, status, xhr){
      alert("ajax successfull!")
      $("a.item-new").html(data.responseText);
   });


 });
