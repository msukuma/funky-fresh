$(function(){
  $(".item-delete").on("ajax:success", function(event, data, status, xhr){
      console.log(event.target)
      var item = $(event.target).closest("tr");
      console.log(item);
      item.remove();
   });

  $(".form").on("ajax:complete", function(event, data, status, xhr){
      alert("ajax successfull!")
   });


 });
      // $("a.it").html(data.responseText);
