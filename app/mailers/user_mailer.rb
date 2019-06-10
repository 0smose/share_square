class UserMailer < ApplicationMailer
	# We set the default sender address
	default from: 'no-reply@share-square.com'

	# We prepare a method that will be called by the model each time an user is created
	def welcome_email(user)
		# We get the user
		@user = user
		# Wedefine the website url
		@url = 'http://share-square.herokuapp.com/users/sign_in' 
		#We send a welcome email every time a user signs up
		mail(to: @user.email, subject: "Bienvenue sur Share Square")
	end

	def good_bye_email(user)
		@user = user
		@url = 'http://share-square.herokuapp.com/users/sign_up'
		@home = 'https://share-square.herokuapp.com'
		mail(to: @user.email, subject: "A bientôt sur Share Square")
	end

	def validated(user, ad)
		@user = user
		@ad = ad
		@home = 'https://share-square.herokuapp.com'
		mail(to: @user.email, subject: "Bonne nouvelle")
	end

	def ad_validated(user, ad)
		@user = user
		@ad = ad
		@home = 'https://share-square.herokuapp.com'
		@url = 'http://share-square.herokuapp.com/ads'
		mail(to: @user.email, subject: "Bonne nouvelle")
	end

	def ad_not_validated(user, ad, comment)
		@user = user
		@ad = ad
		@comment = comment
		@home = 'https://share-square.herokuapp.com'
		mail(to: @user.email, subject: "Mauvaise nouvelle")
	end

end
