$(document).ready(function() {

  $("header li a.login").on("ajax:complete", function(event,data){
    console.log($(this));
    console.log(data.responseText);
    $("div#frontpage").html(data.responseText);
  });


  $("header li a.register").on("ajax:complete", function(event,data){
    console.log($(this));
    console.log(data.responseText);
    $("div#frontpage").html(data.responseText);

  })


});