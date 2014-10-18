$(function(){
    $(".pantry-delete").on("ajax:success", function(event, data, status, xhr){
      console.log(event.target)
      var item = $(event.target).closest("tr");
      console.log(item);
      item.remove();
   });

    $(".new-pantry").on("ajax:beforeSend", function(event, data, status, xhr){
      alert("creating new pantry")
      $("").html(data.responseText);
        $(this).show();
   
   });



 });

