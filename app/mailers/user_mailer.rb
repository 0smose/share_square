class UserMailer < ApplicationMailer
	# We set the default sender address
	default from: 'thplyon02@protonmail.com'

	# We prepare a method that will be called by the model each time an user is created
	def welcome_email(user)
		# We get the user
		@user = user
		# Wedefine teh website url
		@url = 'http://share-square.herokuapp.com/users/sign_in' 
		#We send a welcome email every time a user signs up
		mail(to: @user.email, subjetc: "Bienvenue sur Share Square")
	end
end
