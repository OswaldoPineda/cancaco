App.notifications = App.cable.subscriptions.create('NotificationsChannel', {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $('.notification-cable').prepend(data.html);
    $('#notification-counter strong').text(data.counter);
    if (data.counter === 1) {
      $('#empty-notification-message').remove();
    }
  }
});
