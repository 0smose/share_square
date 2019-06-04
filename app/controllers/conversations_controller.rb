class ConversationsController < ApplicationController
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
	end

	private

	def set_conversation
	  @conversation = Conversation.find_by(id: params[:id])
	end

	def check_participating!
	  redirect_to root_path unless @conversation && @conversation.participates?(current_user)
	end
end
