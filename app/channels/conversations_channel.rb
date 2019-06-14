class ConversationsChannel < ApplicationCable::Channel
	def subscribed
		stream_from "conversations"
	end

	def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # This method is launched by conversations.coffee
  def speak(data)
    #We stock the conversation id, the user id and the user's input

  	conversation_id = data['conversation_id']
  	text_content = data['message']

    # We use the informations above to create the message in the database
  	message = PersonalMessage.create!(body: text_content, conversation_id: conversation_id, user_id: current_user.id)
 
  	# We customize our renderer to suit production environment
    renderer = ApplicationController.renderer.new(http_host: 'share-square.herokuapp.com')
  	# We create a variable html which stocks the whole personnal_message partial with the message
    # added in it
    html = renderer.render(partial:'personal_messages/personal_message', locals:{
  		personal_message: message})

  	# Then we send it back to conversations.coffee
  	ActionCable.server.broadcast "conversations", message: html, message_conv_id: message.conversation_id
  end
end
