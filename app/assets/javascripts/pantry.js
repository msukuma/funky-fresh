$(function(){
  $('#accordion').on("click", "[id^='pantry_edit_button']", function(e){
    e.preventDefault();
    console.log(this);
    var index = this.id.replace("pantry_edit_button", "");
    $("#pantry_edit_button" + index).hide();
    $("#edit_pantry" + index).show();
  });

  $(document).on("ajax:complete", "[id^='edit_pantry']", function(event, data, status, xhr) {
    console.log(event.target);
    var index = this.id.replace("edit_pantry", "");
    console.log(index);
    console.log(data.responseText);
    $("#pantry" + index).remove();
    $("#creator_pantries").append(data.responseText);
    $("#edit_pantry" + index).hide();
    $("#pantry_edit_button" + index).show();
  });

  $(document).on("click", "#new_pantry_button", function(e){
    e.preventDefault();
    console.log(this);
    $("#new_pantry_button").hide();
    $("#new_pantry").show();
  });

  $(document).on("ajax:complete", "#new_pantry", function(event, data, status, xhr) {
    console.log(event.target);
    console.log(data.responseText);
    $("#creator_pantries").append(data.responseText);
    $("#new_pantry").hide();
    $("#new_pantry_button").show();
  });

  $(document).on("ajax:complete", "[id^='pantry_delete_button']", function(event, data, status, xhr){
    var index = this.id.replace("pantry_delete_button", "");
    console.log(index);
    $("#pantry" + index).remove();
  });

  $('#accordion').on("click", "[id^='new_invite_button']", function(e){
    e.preventDefault();
    console.log(this);
    var index = this.id.replace("new_invite_button", "");
    console.log(index);
    $("#new_invite_button" + index).hide();
    $("#new_invite" + index).show();
  });
});

