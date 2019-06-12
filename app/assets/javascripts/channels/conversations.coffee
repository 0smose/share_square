App.conversations = App.cable.subscriptions.create "ConversationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    # We set the scrollTOp property to the height of the div so that the scroll bar stays at the bottom
    $('#conversation-body')[0].scrollTop = $('#conversation-body')[0].scrollHeight;

    # When the user hits enter in the text area, we launch the speak method from this file
    # with the text-area content, the conversation and the user id and
    # we empty the the text area and prevent default behaviors
    $(document).on 'keypress','#text-field', (event) =>
      if event.keyCode is 13
        @speak(event.target.value, event.target.dataset.conversation, event.target.dataset.user)
        event.target.value = ""
        event.preventDefault()

    # Same thing when user clicks on the send button
    $(document).on 'click','#send-btn', (event) =>
      @speak($('#text-field').val(), event.target.dataset.conversation, event.target.dataset.user)
      $('#text-field').val('')
      event.preventDefault()
      
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    # The content received by conversations_channel.rb is added at the end of
    # the conversation-body div
    $("#conversation-body").append(data.message)
    # We reset the scrollbar to the bottom
    $('#conversation-body')[0].scrollTop = $('#conversation-body')[0].scrollHeight;


  speak: (textarea_content, conversation, user) ->
    # We call the function in conversations_channel.rb named speak, passing the text-area content
    @perform 'speak', message: textarea_content, conversation_id: conversation, user_id: user