class ReadChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update(data)
  		#We find all the messages in the current conversation
		@conversation_messages = PersonalMessage.where(conversation_id: data['conversation_id']).all
		@conversation_messages.each do |message|
			# We mark as read the messages recieved by the current user 
			if message.user_id != current_user.id
				message.update(read: true) unless message.read != false
			end
		end
  end
end
