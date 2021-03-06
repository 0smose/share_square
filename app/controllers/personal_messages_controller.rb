class PersonalMessagesController < ApplicationController
  before_action :authenticate_user!
  # We check if a conversation between the users already exists 
  before_action :find_conversation!


  def new
    # If the conversation does exist, redirect to the “show conversation” action.
    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_user.personal_messages.build
  end

  def create
    #If the conversation doesn't exist, we create one.
    @conversation ||= Conversation.create(sender_id: current_user.id,
      recipient_id: @recipient.id) 
    # The personnal messages are "created" and saved later in the data base
    @personal_message = current_user.personal_messages.build(personal_message_params)

    @personal_message.conversation_id = @conversation.id
    
    if @personal_message.save
      # Ajax protocol 
      respond_to do |format|
        format.html { redirect_to conversation_path(@conversation) }
        format.js { }
      end
    end
  end


  private

  def personal_message_params
    params.require(:personal_message).permit(:body, :user)
  end

  def find_conversation!
    # If the :recipient_id is set (that is, the “send a message” link was clicked),  
    if params[:recipient_id]
      # we try to find the other user to address the message.
      @recipient = User.find_by(id: params[:recipient_id])

      # If the user was not found, redirect to the root path. 
      redirect_to(root_path) and return  unless @recipient
      # If the user was found, check if the conversation between him and the current user already exist.
      @conversation = Conversation.between(current_user.id, @recipient.id)[0]
    else
      # Lastly, if the :recipient_id id is not set, we try to find an existing conversation by :conversation_id.
      @conversation = Conversation.find_by(id: params[:conversation_id])
      # If there is no existing conversation between the users, we redirect to root_path
      redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
    end
  end
end
