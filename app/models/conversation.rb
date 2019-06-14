class Conversation < ApplicationRecord

	extend FriendlyId
	friendly_id :conversation_slug, use: :slugged
	belongs_to :sender, class_name: 'User'
	belongs_to :recipient, class_name: 'User'
	validates :sender, uniqueness: {scope: :recipient}
	after_create :new_conversation_send 

	# We set up a has_many relation, specifying the default sorting rule (the oldest one comes first)
	has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

	# We introduce a scope called participating, 
	# so that we can list all conversations in which a user participates
	# Example: Conversation.participating(current_user)
	scope :participating, -> (user) do
  	where("(conversations.sender_id = ? OR conversations.recipient_id = ?)", user.id, user.id)
	end

	# This method returns the other participant of a conversation
	def with(current_user)
  	sender == current_user ? recipient : sender
	end

	# This method checks if the given user participates in a conversation
	# either as a sender or as a recipient of the exchanged messages.
	def participates?(user)
  	sender == user || recipient == user
	end

	def new_conversation_send
		ConversationMailer.new_conversation_email(self.sender, self.recipient).deliver_now 
	end

	#This scope returns a conversation for two users
	scope :between, -> (sender_id, recipient_id) do
  	where(sender_id: sender_id, recipient_id: recipient_id).or(where(sender_id: recipient_id, recipient_id: sender_id)).limit(1)
	end

	def conversation_slug
		"#{self.sender.first_name} #{self.recipient.first_name}"
	end
end
