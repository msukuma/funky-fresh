$(function(){
  console.log("in the search js");
  $("form.search").on("ajax:complete", function(event, data){
    alert("I am in the form");
    console.log(data.responseText)
  });
});




  // $("form.search").on("click", ".search-button", function(event){
  //   event.preventDefault();
  //   var url = $(this).parent().attr("action")
  //   console.log(url);
  //     $.ajax({
  //       url: url,
  //       type: "GET",
  //       dataType: "html",
  //       success: function(event, response, data){
  //         console.log(event);
  //         console.log(response);
  //         debugger;
  //       },
  //       error: function() {
  //         alert("Sorry, something went wrong. Try again.");
  //       }
  //     });
  //   });