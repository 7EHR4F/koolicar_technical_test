App.activity = App.cable.subscriptions.create("ActivityChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(event) {
   return $('#events').prepend("<div class='event'>" + event.message + "</div>");
  }
});
