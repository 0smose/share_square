class ConversationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_conversation, except: [:index]
	# We make sure that the user is actually authorized to view the requested conversation
	before_action :check_participating!, except: [:index]
	
	def index
	  @conversations = Conversation.participating(current_user).order('updated_at DESC')
	end
	 
	def show
	# We instantiate the @personal_message variable,	
	# as it will be used inside the view to render a form (to send a new message) 
  @personal_message = PersonalMessage.new
  set_to_read
	end

	# We create a method to change the message status from unread to read
	# We call it in the show method above
	def set_to_read
		#We find all the messages in the current conversation
		@conversation_messages = PersonalMessage.where(conversation_id: @conversation).all
		@conversation_messages.each do |message|
			# We mark as read the messages recieved by the current user 
			if message.user_id != current_user.id
				message.update(read: true) unless message.read != false
			end
		end
	end
	private

	def set_conversation
	  @conversation = Conversation.find_by(id: params[:id])
	end

	def check_participating!
	  redirect_to root_path unless @conversation && @conversation.participates?(current_user)
	end
end
