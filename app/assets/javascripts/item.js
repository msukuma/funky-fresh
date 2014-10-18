$(function(){
    console.log("page loaded")
    $(".item-delete").on("ajax:success", function(event, data, status, xhr){
      console.log("complete ajax call")
   });
 });
