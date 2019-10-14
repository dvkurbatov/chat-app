App.messages = App.cable.subscriptions.create({
  channel: 'MessagesChannel',
  listener_type: document.querySelector('head').dataset.listenerType,
  listener_id: document.querySelector('head').dataset.listenerId
}, {
  received: function(data) {
    console.log(data);
    console.log(document.querySelector('head').dataset.listenerType == 'channel');
    if ((document.querySelector('head').dataset.listenerId == data.author) || (document.querySelector('head').dataset.listenerType == 'channel')){
      console.log(data.author);
      $("#empty_chat").remove();
      if ($('#messages').children().length > 10){
        $('#messages').children().first().remove();
      }
      $("#messages").append(this.renderMessage(data));
    }
  },
  connected: function(data) {
    console.log('connected');
  },
  rejected: function(data) {
    console.log('reject!');
  },
  disconnected: function(data) {
    console.log('disconnected')
  },
  renderMessage: function(data) {
    return '<div><span>' + data.nickname + ': ' + data.text + '</span></div>';
  }
});