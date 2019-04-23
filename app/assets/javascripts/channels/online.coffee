jQuery(document).on 'turbolinks:load', ->
  App.online = App.cable.subscriptions.create "OnlineChannel",
    connected: ->

    disconnected: ->

    received: (data) ->

      App.online.drawOnlineUsers(data.users)

    drawOnlineUsers: (users) ->
      if (users.length > 0)
        text = 'Online: '
        text += users.map((user) -> user['nickname']).join(', ')

        $('.js-online-users').text(text)
