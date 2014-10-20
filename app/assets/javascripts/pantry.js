$(function(){
  $("[id^='pantry_edit_button']").click(function (e) {
    e.preventDefault();
    console.log(this);
    var index = this.id.replace("pantry_edit_button", "");
    $("#pantry_edit_button" + index).hide();
    $("#edit_pantry" + index).show();
  });

  // $(document).on("ajax:complete", "[id^='edit_pantry']", function(event, data, status, xhr) {
  //   console.log(event.target);
  //   var index = this.id.replace("edit_pantry_", "");
  //   console.log(index);
  //   $("#edit_pantry_" + index).hide();
  //   $("#pantry" + index).show();
  // });

  $("#new_pantry_button").click(function (e) {
    e.preventDefault();
    console.log(this);
    $("#new_pantry_button").hide();
    $("#new_pantry").show();
  });

  $(document).on("ajax:complete", "#new_pantry", function(event, data, status, xhr) {
    console.log(event.target);
    console.log(data.responseText);
    $("#creator_pantries").append(data.responseText);
  });

  $("[id^='pantry_delete_button']").on("ajax:complete", function(event, data, status, xhr){
    var index = this.id.replace("pantry_delete_button", "");
    console.log(index);
    $("#pantry" + index).remove();
  });

  $("[id^='new_invite_button']").click(function (e) {
    e.preventDefault();
    console.log(this);
    var index = this.id.replace("new_invite_button", "");
    console.log(index);
    $("#new_invite_button" + index).hide();
    $("#new_invite" + index).show();
  });

  // $(".new-pantry").on("ajax:beforeSend", function(event, data, status, xhr){
  //   $("").html(data.responseText);
  //   $(this).show();
  // });

  // $(".pantry").show()
});

