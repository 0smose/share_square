class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	ActionCable.server.broadcast "conversations_channel", message: data['message']
  end
end
