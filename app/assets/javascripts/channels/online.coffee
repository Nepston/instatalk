App.online = App.cable.subscriptions.create "OnlineChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    #console.log('Online :' + data['user'])
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    App.online.drawOnlineUsers(data.users)

  drawOnlineUsers: (users) ->
    if (users.length > 0)
      text = 'Online: '
      text += users.map((user) -> user['nickname']).join(', ')

      $('.js-online-users').text(text)
