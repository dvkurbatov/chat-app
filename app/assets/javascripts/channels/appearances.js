App.appearances = App.cable.subscriptions.create("AppearanceChannel", {
  appear: function(){
    console.log('apear');
  },
  received: function(data) {
    var user_id = data.id
    var action = data.action
    var selector = 'list-group-item   user-id-' + user_id;
    if (action == 'appear') {
      let onlineStatus = document.createElement('span');
      onlineStatus.className = 'glyphicon glyphicon-ok';
      onlineStatus.innerHTML = 'online';
      document.getElementsByClassName(selector)[0].append(onlineStatus);
    } else {
      document.getElementsByClassName(selector)[0].lastElementChild.remove();
    }
  }
})