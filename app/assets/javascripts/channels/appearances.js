App.appearances = App.cable.subscriptions.create("AppearanceChannel", {
  received: function(data) {
    var user_id = data.id
    var action = data.action
    var selector = '.list-group-item.user-id-' + user_id;
    if (action == 'appear') {
      let onlineStatus = document.createElement('span');
      onlineStatus.className = 'glyphicon glyphicon-ok';
      onlineStatus.innerHTML = 'online';
      document.querySelector(selector).append(onlineStatus);
    } else {
      document.querySelector(selector).lastElementChild.remove();
    }
  }
})