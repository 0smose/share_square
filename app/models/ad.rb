class Ad < ApplicationRecord

	extend FriendlyId
  friendly_id :title, use: :slugged

	validates :title, presence: true, length: {maximum: 75}
	validates :description, presence: true, length: {in: 50..2000}
	validates :type, presence: true
	validates :category, presence: true
	validates :duration, presence: true
	validates :frequency, presence: true
	validates :other_propositions, :inclusion => {:in => [true, false]}
	validates :availability, presence: true

	belongs_to :user
	belongs_to :type
	belongs_to :category

	after_update :ad_validated_send

	def ad_validated_send
		if self.validated == true
			UserMailer.ad_validated(self.user, self).deliver_now
		end
	end
end


