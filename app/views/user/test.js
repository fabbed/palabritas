$(".word_field")[0].focus();
$(".word_field").keypress(function(event) {
  if (event.which == '32') {
     event.preventDefault();
     $(this).next(".word_field").focus();
   }
});

$("#word_set_form").validate({
  rules: {
    user_words_word_1: {
      required: true,
      maxlength: 20,
      minlength: 3
    }
  }
});