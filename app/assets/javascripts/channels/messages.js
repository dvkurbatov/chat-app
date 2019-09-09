App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {

    $("#messages").append(this.renderMessage(data));
  },
  renderMessage: function(data) {
    return '<div><span>' + data.nickname + ': ' + data.message + '</span></div>';
  }
});
