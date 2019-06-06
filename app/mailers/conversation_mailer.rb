class ConversationMailer < ApplicationMailer
	# We set the default sender address
	default from: 'no-reply@share-square.com'

	def new_conversation_email(sender, recipient)
		# We get the sender and the recipient
		@sender = sender
		@recipient = recipient
		# We define the url
		@url = 'http://share-square.herokuapp.com/conversations' 
		#We send a notification email to the recipient every time a new conversation is initiated
		mail(to: @recipient.email, subject: "Vous avez un nouveau message")
	end
end
