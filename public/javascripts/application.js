// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function fbshare(url,title){
  window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(url)+'&t='+encodeURIComponent(title),'FacebookShare','toolbar=0,status=0,width=626,height=436');
}

$(document).ready(function() {



  $(".btn_leave_reply").click(function() {
    $(this).closest(".word_set").children(".word_set_reply").slideDown();
    return false;
  });

  $('#upload_your_pick_cta').fadeOut(400).fadeIn(400).fadeOut(400).fadeIn(400).fadeOut(400).fadeIn(400).fadeOut(400).fadeIn(400);


  $("#new_user #user_display_name").val("Tu nombre o apodo")
  $("#new_user #user_email").val("No te spamearemos")
  
  $('.text_field').addClass("blur");
  
  $('.text_field').focus(function() {
    $(this).removeClass("blur");
  });  

  $('.text_field').blur(function() {
    $(this).addClass("blur");
  });

  $('#new_user .delete_when_focus, .word_field').click(function() {
    if ($(this).attr("value_entered") != "true") {
      $(this).val("");
      $(this).attr("value_entered", "true")
    };
  });

  $(".word_field").keydown(function() {

    if ($(".word_field").attr("cleared") != "true") {
      $(".word_field").val("");
      $(".word_field").attr("cleared", "true")
    };
    
  });

  $('#new_user .delete_when_focus, .word_field').focus(function() {
    if ($(this).attr("value_entered") != "true") {
      $(this).val("");
      $(this).attr("value_entered", "true")
    };
  });


  $("#user_username").keypress(function(event) {
    if (event.which == '32') {
       event.preventDefault();
     }
  });

  $("#submit_word_form").click(function() {
    if ($(".word_field").attr("cleared") != "true") {
      $(".word_field").val("");
      $(".word_field").attr("cleared", "true")
    };
  });

  $("#new_user").validate({
    rules: {
      "user[display_name]": {required: true, maxlength: 30,  minlength: 4},
      "user[email]": {required: true, email: true},
      "user[username]": {required: true, maxlength: 20,  minlength: 4, remote:"/user/validate_form_data"},
      "user[password]": {required: true, maxlength: 15,  minlength: 4}
    },
    messages: {
      "user[display_name]": {
        required: I18n.t("activerecord.errors.models.user.attributes.display_name.blank"),
        minlength: I18n.t("activerecord.errors.models.user.attributes.display_name.too_short"),
        maxlength: I18n.t("activerecord.errors.models.user.attributes.display_name.too_long")
      },
      "user[email]": {
        required: I18n.t("activerecord.errors.models.user.attributes.email.blank")
      },
      "user[username]": {
        required: I18n.t("activerecord.errors.models.user.attributes.username.blank"),
        minlength: I18n.t("activerecord.errors.models.user.attributes.username.too_short"),
        maxlength: I18n.t("activerecord.errors.models.user.attributes.username.too_long"),
        remote: I18n.t("activerecord.errors.models.user.attributes.username.taken")
      },
      "user[password]": {
        required: I18n.t("activerecord.errors.models.user.attributes.password.blank"),
        minlength: I18n.t("activerecord.errors.models.user.attributes.password.too_short"),
        maxlength: I18n.t("activerecord.errors.models.user.attributes.password.too_long")
      },
      email: "Por favor pon un email valido"
    },
    
    errorElement: "div",
    errorClass: "formError"
    
  });


  $("#user_login").validate({
    rules: {
      "user[username]": {required: true, maxlength: 20,  minlength: 4},
      "user[password]": {required: true, maxlength: 15,  minlength: 4}
    },
    messages: {
      "user[username]": {
        required: I18n.t("activerecord.errors.models.user.attributes.username.blank"),
        minlength: I18n.t("activerecord.errors.models.user.attributes.username.too_short"),
        maxlength: I18n.t("activerecord.errors.models.user.attributes.username.too_long")
      },
      "user[password]": {
        required: I18n.t("activerecord.errors.login.password.blank"),
        minlength: I18n.t("activerecord.errors.models.user.attributes.password.too_short"),
        maxlength: I18n.t("activerecord.errors.models.user.attributes.password.too_long")
      },
      email: "Por favor pon un email valido"
    },
    
    errorElement: "div",
    errorClass: "formError"
    
  });


});


