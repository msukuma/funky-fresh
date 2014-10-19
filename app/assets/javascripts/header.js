$(document).ready(function() {

  $("header li a.login").on("ajax:complete", function(event,data){
    alert("I am in the header")
    console.log($(this))
    console.log(data.responseText)
    $("div#frontpage").append(data.responseText)
  })

  $("div.frontpage").on("ajax:complete")


});