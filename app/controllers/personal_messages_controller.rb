class PersonalMessagesController < ApplicationController
	before_action :find_conversation!

	def new
		puts "*"*100
		puts "hola"
		puts "*"*100
  	redirect_to conversation_path(@conversation) and return if @conversation
  	@personal_message = current_user.personal_messages.build
	end

  def create
  @conversation ||= Conversation.create(sender_id: current_user.id,
                                        recipient_id: @recipient.id)
  @personal_message = current_user.personal_messages.build(personal_message_params)
  @personal_message.conversation_id = @conversation.id
  @personal_message.save!

  flash[:success] = "Your message was sent!"
  redirect_to conversation_path(@conversation)
end

  private

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end

  def find_conversation!
  if params[:recipient_id]
    @recipient = User.find_by(id: params[:recipient_id])
    redirect_to(root_path) and return unless @recipient
    @conversation = Conversation.between(current_user.id, @recipient.id)[0]
  else
    @conversation = Conversation.find_by(id: params[:conversation_id])
    redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
  end
end

end
