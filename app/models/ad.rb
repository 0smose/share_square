class Ad < ApplicationRecord
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
end


