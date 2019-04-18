App.auth = App.cable.subscriptions.create "OnlineChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    #console.log('Online :' + data['user'])
  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Offline!')
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('Received : ' + data['user'])
    if data['online'] == "on"
      $('#users').append data['user'] + ' ';
