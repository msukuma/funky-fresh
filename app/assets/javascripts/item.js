$(function(){
  console.log("loaded");
  $(document).on("click", "[id^='new_item_button']", function(e){
    e.preventDefault();
    console.log(this);
    var index = this.id.replace("new_item_button", "");
    console.log(index);
    $("#new_item_button" + index).hide();
    $("#new_item" + index).show();
    $("#cancel_new_item_button" + index).show();
  });

  $(document).on("click", "[id^='cancel_new_item_button']", function(e){
    e.preventDefault();
    var index = this.id.replace("cancel_new_item_button", "");
    $("#new_item_button" + index).show();
    $("#new_item" + index).hide();
    $("#cancel_new_item_button" + index).hide();
  });

  $(document).on("ajax:complete", "a.item-delete", function(event){
    var item = $(event.target);
    console.log(item);
    var row = item.closest("tr");
    row.remove();
  });

  $(document).on("ajax:complete", "div.new-item-create form", function(event, data){
    var semiTarget = $(this).parent().prev()[0].children[1];
    $(this).parent().find("input:text").val("");
    $(semiTarget).html(data.responseText);
    console.log(this);
    var index = this.id.replace("new_item", "");
    $(this).hide();
    $("#new_item_button" + index).show();
    $("#cancel_new_item_button" + index).hide();
  });
});
