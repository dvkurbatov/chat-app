App.appearances = App.cable.subscriptions.create("AppearanceChannel", {
  appear: function(){
    console.log('apear')
  },
  received: function(data) {
    var user_id = data.id
    var action = data.action
    var selector = 'li.list-group-item.user-id-' + user_id;
    if (action == 'append') {
      $(selector).append('<span class="glyphicon glyphicon-ok">online</span>')
    } else {
      $(selector).children().last().remove()
    }
  }
})