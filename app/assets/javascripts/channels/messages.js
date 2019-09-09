App.messages = App.cable.subscriptions.create(
  {
    channel: 'MessagesChannel'
  },
  {
  received: function(data) {
    if ($('#messages').data('channel-id') == data.channel.id){
      $("#empty_chat").remove();
      if ($('#messages').children().length > 10){
        $('#messages').children().first().remove();
      }
      $("#messages").append(this.renderMessage(data));
    }
  },
  renderMessage: function(data) {
    return '<div><span>' + data.nickname + ': ' + data.message + '</span></div>';
  }

});
