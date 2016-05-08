(function() {
  App.rooms = App.cable.subscriptions.create('RoomsChannel', {
    connected: function() {
      var channel = this;

      function followStream() {
        channel.perform('follow', {
          room_id: $('#messages').attr('data-room-id')
        });
      }

      function setSendFormEvents() {
        $('#new_message').submit(function() {
          channel.perform('say', {
            message: $('#content').val(),
            room_id: $('#messages').attr('data-room-id')
          });
          $('#content').val('');
          return false;
        });
      }

      function init() {
        followStream();
        setSendFormEvents();
      }

      // FIXME: wait for cable subscriptions before sending messages
      setTimeout(init, 1000);
    },

    received: function(data) {
      function message(data) {
        var $li = $('<li>');
        var content = data['username'] + ' says ' + data['message'];

        return $li.html(content);
      }

      $('#messages').append(message(data));
    }
  });

}).call(this);
