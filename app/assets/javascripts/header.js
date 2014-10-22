var elementFinder = function(){

	// $(element)
	// $('#home').tipsy({fallback: "Home"});
 //  $('#sign_up').tipsy({fallback: "Sign Up"});
 //  $('#login').tipsy({fallback: "Login"});
 //  $('#logout_button').tipsy({fallback: "Logout"});
 //  $('#kitchen').tipsy({fallback: "Pantries"});
 //  $('#edit_cog').tipsy({fallback: "Edit Profile"});
 //  $("[id^='edit_pantry']").tipsy({gravity: "s", fallback: "Pantry Settings"});
 //  $("[id^='new_item']").tipsy({gravity: "s", fallback: "Add Item"});
 //  $("[id^='new_invite']").tipsy({gravity: "s", fallback: "Invite to Pantry"});
 //  $(".opt-out").tipsy({gravity: "s", fallback: "Leave Pantry"});
  
 //  $(".cookbook").tipsy({gravity: "s", fallback: "Find Recipes"});

}

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

  $('a[rel=tipsy]').tipsy({fade: true, gravity: 'n'});

  elementFinder();





});
