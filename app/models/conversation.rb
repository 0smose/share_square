class Conversation < ApplicationRecord
	belongs_to :sender, class_name: 'User'
	belongs_to :recipient, class_name: 'User'
	validates :sender, uniqueness: {scope: :recipient}

	has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

	scope :participating, -> (user) do
  	where("(conversations.sender_id = ? OR conversations.recipient_id = ?)", user.id, user.id)
	end

	def with(current_user)
  	sender == current_user ? recipient : sender
	end

	def participates?(user)
  	sender == user || recipient == user
	end

	scope :between, -> (sender_id, recipient_id) do
  	where(sender_id: sender_id, recipient_id: recipient_id).or(where(sender_id: recipient_id, recipient_id: sender_id)).limit(1)
	end
end
