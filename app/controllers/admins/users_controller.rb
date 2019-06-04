class Admins::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_if_admin
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], skills: params[:skills], email: params[:email], password: params[:password])
		if @user.save
				redirect_to admins_users_path 
				flash[:success] = "L'utilisateur a bien été crée"
			else 
				flash[:alert] = "Un problème est survenu, veuillez reessayer"
				render :new
			end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
			if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], skills: params[:skills])
				redirect_to admins_user_path 
				flash[:success] = "Vous avez édité ce profil avec succès"
			else 
				flash[:alert] = "Un problème est survenu, veuillez reessayer"
				render :edit
			end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:success] = "Ce profil a bien été supprimé !"
			redirect_to admins_users_path
		else
			flash[:alert] = "Il y a eu un problème !"
			redirect_to admins_users_path
		end
	end

	def check_if_admin
		if current_user.is_admin == false
			flash[:error] = "Vous n'êtes pas un administrateur !"
			redirect_to root_path
		end
	end
end