$(document).ready(function() {
  $(document).on("ajax:complete", "header li a.login", function(event,data){
    $("div#frontpage").html(data.responseText);
  });

  $(document).on("ajax:complete", "header li a.register", function(event,data){
    $("div#frontpage").html(data.responseText);
  });
});
