class ConversationsChannel < ApplicationCable::Channel
	def subscribed
		stream_from "conversations"
	end

	def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # This method is launched by conversations.coffee
  def speak(hash_from_conversations)


  	conversation_id = hash_from_conversations['conversation_id'].to_i
		user_id = hash_from_conversations['user_id'].to_i

  	text_content = hash_from_conversations['message']

  	message = PersonalMessage.create(body: text_content, conversation_id: conversation_id, user_id: user_id)
 
  	# We create a variable html which stocks the whole personnal_message partial with the message
  	# added in it
  	html = ApplicationController.render(partial:'personal_messages/personal_message', locals:{
  		personal_message: message})

  	# Then we send it back to conversations.coffee
  	ActionCable.server.broadcast "conversations", message: html
  end
end
