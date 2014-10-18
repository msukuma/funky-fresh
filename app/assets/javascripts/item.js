$(function(){
  console.log("loaded");
  $(".item-row").on("ajax:complete", "a.item-delete", function(event){
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
  // $(".item-delete").on("ajax:complete", ".enable-delete", function(event, data, status, xhr){
  //     console.log(event.target)
  //     var item = $(event.target).closest("tr");
  //     console.log(item);
  //     item.remove();
  //  });

  // $("div.new-item-create form").on("ajax:complete", function(event, data, status, xhr){
  //     console.log(event.target);
  //     console.log(data.responseText)
  //     $(".item-row").hide();
  //     $("#item-block").append(data.responseText);
  //  });
