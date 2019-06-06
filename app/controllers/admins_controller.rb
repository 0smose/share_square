class AdminsController < ApplicationController
  # This controller manages the ads validation.
	before_action :authenticate_user!
	before_action :check_if_admin


	def index
		@ads = Ad.all

    # We stock the number of ad in a variable 
    @total_ad_count = @ads.count

    @users = User.all

    # We stock the number of users in a variable 
    @total_users_count = @users.count
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    if @ad.update(validated: params[:validated])
      flash[:success] = "Vous avez bien édité l'annonce"
      redirect_to admins_ad_path
    else
      flash[:alert] = "Il y a eu un problème"
      render :edit
    end
  end

  def check_if_admin
  	if current_user.is_admin == false
  		flash[:error] = "Vous n'êtes pas un administrateur !"
  		redirect_to root_path
  	end
  end
end
