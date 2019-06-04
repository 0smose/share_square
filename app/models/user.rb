class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: " : Veuillez utiliser un mot de passde valide" }
  #validates :avatar should be added when ActiveStorage is ready!
  validates :description, length:  {in: 50..200}
  validates :skills, presence: true

  has_many :ads
  has_one_attached :avatar
  after_create :welcome_send
  after_destroy :good_bye_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def good_bye_send
    UserMailer.good_bye_email(self).deliver_now
  end
end
