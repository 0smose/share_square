class AvatarsController < ApplicationController

	def create
    @user = User.find(params[:user_id])
    if params[:avatar] == nil
    	redirect_to edit_user_path(@user)
    	flash[:alert] = "Merci de choisir un fichier"
    else
    	@user.avatar.attach(params[:avatar])
    	redirect_to edit_user_path(@user)
  	end
  end

end
