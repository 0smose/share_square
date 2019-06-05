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

  has_many :sender_conversations, class_name: 'Conversation', foreign_key: 'sender_id'
  has_many :recipient_conversations, class_name: 'Conversation', foreign_key: 'recipient_id'
  has_many :personal_messages, dependent: :destroy
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

  # We create a method to count how many unread messages a user has
  def unread_messages
    # We find the user conversations 
    @user_conversations = Conversation.participating(self)
    # We create an empty array to stock the unread messages
    @unread_messages = []
    # For each conversation we check all the messages
    @user_conversations.each do |conversation|
      conversation.personal_messages.each do |message|
        # We stock in the array all the unread messages received by the user
        if message.read != true && message.user_id != self.id
          @unread_messages << message
        end
      end
    end
    # We return the number of elements in the array
    return @unread_messages.size
  end
end
