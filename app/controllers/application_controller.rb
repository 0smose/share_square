class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	# If the authenticity token is not the same when a user log in this method protect the user's data 
	protect_from_forgery

	protected

	# We define permission to first_name, last_nae; description and skills
	# for the sign_up form in order to add users into our database
	def configure_permitted_parameters
		added_attrs = [:first_name, :last_name, :description, :skills, :email, :password, :password_confirmation, :remember_me]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
		devise_parameter_sanitizer.permit :login, keys: added_attrs
	end
end
