$(function() {
  $('#new_message_form').on('ajax:success', function(data) {
    console.log('success!');
    $(this).find('input[type="text"]').val('');
  });
});