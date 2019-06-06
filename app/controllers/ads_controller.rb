class AdsController < ApplicationController
	before_action :is_validated, only: [:index]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :is_validated ]

	def index
		@ad = Ad.all.reverse
	end

	def show
		@ad = Ad.find(params[:id])
	end

	def new
		@ad = Ad.new
	end

	def create
		@ad = Ad.new(user_id: current_user.id, frequency: params[:frequency], duration: params[:duration], type: Type.find_by(name: params[:type]), category: Category.find_by(name: params[:category]), title: params[:title], description: params[:description], other_propositions: params[:other_propositions], availability: params[:availability])

		if @ad.save
			redirect_to root_path
			flash[:success] = "Votre annonce a été crée"
		else
			flash[:alert] = "Il y a un eu un problème..."
			render :new
		end
	end

	def edit
		@ad = Ad.find(params[:id])
		# @user = User.find(params[:id])
		redirect_to root_path, notice: "Vous ne pouvez pas éditer l'annonce d'autrui !" unless @ad.user == current_user
	end

	def update
		@ad = Ad.find(params[:id])
		if @ad.user == current_user
			if @ad.update(frequency: params[:frequency], duration: params[:duration], type: Type.find_by(name: params[:type]), category: Category.find_by(name: params[:category]), title: params[:title], description: params[:description], other_propositions: params[:other_propositions], availability: params[:availability])
				redirect_to ad_path(@ad)
				flash[:success] = "Votre annonce a bien été modifié"
			else
				flash[:alert] = "Vous n'avez pas rempli tous les champs, réessayez"
				render :edit
			end		
		else
			redirect_to root_path, notice: "Vous ne pouvez pas éditer l'annonce d'autrui"
		end
	end

	def destroy
		@ad = Ad.find(params[:id])
		@ad.destroy
		redirect_to ads_path
	end
	
	# Method to check if the ad is validated or not
	def is_validated
		@ads = Ad.all
	end
end
