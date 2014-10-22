$(document).ready(function() {
  $(document).on("ajax:complete", "header li a.login", function(event,data){
    $(".body_container").html(data.responseText);
  });

  $(document).on("ajax:complete", "header li a.register", function(event,data){
    $(".body_container").html(data.responseText);
  });

  $(document).on("ajax:complete", "header li a.home", function(event,data){
    $(".body_container").html(data.responseText);
  });
});
