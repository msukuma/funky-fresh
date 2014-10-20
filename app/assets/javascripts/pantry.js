$(function(){
  $('#accordion').on("click", "[id^='edit_pantry_button']", function(e){
    e.preventDefault();
    console.log(this);
    var index = this.id.replace("edit_pantry_button", "");
    $("#edit_pantry_button" + index).hide();
    $("#edit_pantry" + index).show();
    $("#cancel_edit_pantry_button" + index).show();
  });

  $('#accordion').on("click", "[id^='cancel_edit_pantry_button']", function(e){
    e.preventDefault();
    console.log(this);
    var index = this.id.replace("cancel_edit_pantry_button", "");
    $("#edit_pantry_button" + index).show();
    $("#edit_pantry" + index).hide();
    $("#cancel_edit_pantry_button" + index).hide();
  });

  $(document).on("ajax:complete", "[id^='edit_pantry']", function(event, data, status, xhr) {
    console.log(event.target);
    var index = this.id.replace("edit_pantry", "");
    console.log(index);
    console.log(data.responseText);
    $("#pantry" + index).remove();
    $("#creator_pantries").append(data.responseText);
    $("#edit_pantry" + index).hide();
    $("#edit_pantry_button" + index).show();
    $("#cancel_edit_pantry_button" + index).hide();
  });

  $(document).on("click", "#new_pantry_button", function(e){
    e.preventDefault();
    console.log(this);
    $("#new_pantry_button").hide();
    $("#new_pantry").show();
    $("#cancel_new_pantry_button").show();
  });

  $(document).on("click", "#cancel_new_pantry_button", function(e){
    e.preventDefault();
    console.log(this);
    $("#new_pantry_button").show();
    $("#new_pantry").hide();
    $("#cancel_new_pantry_button").hide();
  });

  $(document).on("ajax:complete", "#new_pantry", function(event, data, status, xhr) {
    console.log(event.target);
    console.log(data.responseText);
    $("#creator_pantries").append(data.responseText);
    $("#new_pantry").hide();
    $("#new_pantry_button").show();
    $("#cancel_new_pantry_button").hide();
  });

  $(document).on("ajax:complete", "[id^='pantry_delete_button']", function(event, data, status, xhr){

    var index = this.id.replace("pantry_delete_button", "");
    console.log(index);
    $("#pantry" + index).remove();
  });

  // $(document).on("ajax:complete", "a.pantry-delete", function(event){
  //   var item = $(event.target);
  //   console.log(item);
  //   var row = item.closest("div");
  //   row.remove();
  // });

  $('#accordion').on("click", "[id^='new_invite_button']", function(e){
    e.preventDefault();
    console.log(this);
    var index = this.id.replace("new_invite_button", "");
    console.log(index);
    $("#new_invite_button" + index).hide();
    $("#new_invite" + index).show();
  });
});

