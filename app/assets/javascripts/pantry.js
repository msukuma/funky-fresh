$(function(){
  $("[id^='pantry_edit_button']").click(function (e) {
    e.preventDefault();
    console.log(this);
    var index = this.id.replace("pantry_edit_button", "");
    $("#pantry" + index).hide();
    $("#pantry_edit_form" + index).show();
  });

  // $(document).on("ajax:complete", "[id^='edit_pantry']", function(event, data, status, xhr) {
  //   console.log(event.target);
  //   var index = this.id.replace("edit_pantry_", "");
  //   console.log(index);
  //   $("#edit_pantry_" + index).hide();
  //   $("#pantry" + index).show();
  // });

  $(document).on("ajax:complete", "#new_pantry", function(event, data, status, xhr) {
    console.log(event.target);
    console.log(data.responseText);
    $("#creator_pantries").append(data.responseText);
  });

  $(".pantry-delete").on("ajax:complete", function(event, data, status, xhr){
    var index = this.id.replace("pantry_delete_button", "");
    $("#pantry" + index).remove();
  });

  // $(".new-pantry").on("ajax:beforeSend", function(event, data, status, xhr){
  //   $("").html(data.responseText);
  //   $(this).show();
  // });

  // $(".pantry").show()
});

