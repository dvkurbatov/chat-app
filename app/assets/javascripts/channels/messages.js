App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#empty_chat").remove();
    if ($('#messages').children().length > 10){
      $('#messages').children().first().remove();
    }
    $("#messages").append(this.renderMessage(data));
  },
  renderMessage: function(data) {
    return '<div><span>' + data.nickname + ': ' + data.message + '</span></div>';
  }
});
