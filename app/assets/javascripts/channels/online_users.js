(function() {
  App.online_users = App.cable.subscriptions.create('OnlineUsersChannel', {
    received: function(user) {
      var $loggedUsers = $('#logged_users');
      
      function li(user) {
        return '<li>O usuário ' + user['username'] + ' acabou de entrar!</li>';
      }

      $loggedUsers.append(li(user));
    }
  });
}());
