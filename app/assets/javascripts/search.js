$(function(){
  console.log("in the search js");
  $(document).on("ajax:complete", "form.search", function(event, data){
    $(this).parent().find("input#search-field").val("");
    $("div.search-results").empty();
    console.log(data.responseText);
    $(this).parent().find("div.search-results").html(data.responseText)
  });
});