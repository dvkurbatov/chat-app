$(function() {
  $('#new_message_form').on('ajax:success', function(a, b,c ) {
    console.log('success!');
    $(this).find('input[type="text"]').val('');
  });
});