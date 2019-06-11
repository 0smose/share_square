App.conversations = App.cable.subscriptions.create "ConversationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    $(document).on 'click','#send-btn', (event) =>
  		@speak(event.target.value)
  		event.target.value = ""
  		event.preventDefault()


    $(document).on 'keypress','#text-field', (event) =>
  	 	if event.keyCode is 13
	  	  @speak(event.target.value)
	  	  event.target.value = ""
	  	  event.preventDefault()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    alert(data['message'])

   #speak: (message) ->
   # @perform 'speak', message: message
