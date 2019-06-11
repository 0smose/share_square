class ConversationsChannel < ApplicationCable::Channel
	def subscribed
		stream_from "conversations"
	end

	def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # This method is launched by conversations.coffee
  def speak(hash_from_conversations)


  	conversation = hash_from_conversations['conversation_id']
  	conversation = conversation.to_i

  	text_content = hash_from_conversations['message']

  	message = PersonalMessage.new(body: text_content, conversation_id: conversation, user_id: current_user.id)
  	message.save
  	# # We create a variable html which stocks the whole personnal_message partial with the message
  	# # added in it
  	# html = ApplicationController.render(partial:'personal_messages/personal_message', locals:{
  	# 	message: hash_from_conversations['message']})

  	# # Then we send it back to conversations.coffee
  	# ActionCable.server.broadcast "conversations", message: html
  end
end
