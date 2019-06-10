class Admins::AdsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_if_admin

	def index
		@ads = Ad.all
	end

	def create
		@ad = Ad.new(user_id: current_user.id, title: params[:title], description: params[:description], type: Type.find_by(name: params[:type]), category: Category.find_by(name: params[:category]), duration: params[:duration], frequency: params[:frequency], other_propositions: params[:other_propositions], availability: params[:availability])
		if @ad.save
			flash[:success] = "Vous avez bien crée l'annonce"
			redirect_to admins_ads_path
		else
			flash[:alert] = "Vous n'avez pas rempli tous les champs, réessayez"
			render :new
		end
	end

	def edit
		@ad = Ad.find(params[:id])
	end

	def update
		@ad = Ad.find(params[:id])
		if @ad.update(title: params[:title], description: params[:description], type: Type.find_by(name: params[:type]), category: Category.find_by(name: params[:category]), duration: params[:duration], frequency: params[:frequency], other_propositions: params[:other_propositions], availability: params[:availability])
			
			flash[:success] = "Vous avez bien édité l'annonce"
			redirect_to admins_ads_path
		else
			flash[:alert] = "Vous n'avez pas rempli tous les champs, réessayez"
			render :edit
		end
	end

	def destroy
		@ad = Ad.find(params[:id])
		if @ad.destroy
			flash[:success] = "Vous avez bien supprimé l'annonce"
			redirect_to admins_ads_path
		else
			flash[:alert] = "Il y a eu un problème"
			redirect_to admins_ads_path
		end
	end

	def check_if_admin
		if current_user.is_admin == false
			flash[:error] = "Vous n'êtes pas un administrateur !"
			redirect_to root_path
		end
	end
end