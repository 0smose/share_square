class AdsController < ApplicationController

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
		@ad = Ad.new(frequency: params[:frequency], type: params[:type], duration: params[:duration], title: params[:title], description: params[:description], category: params[:category], other_propositions: params[:other_propositions], availability: params[:availability])
		@ad.save

		if @ad.save
			redirect_to root_path
			flash[:success] = "Votre annonce a été crée"
		else
			render 'new'
		end
	end

	def edit
		@ad = Ad.find(params[:id])
	end

	def update
		@ad = Ad.find(params[:id])
		
		if @ad.update(frequency: params[:frequency], duration: params[:duration], title: params[:title], description: params[:description], other_propositions: params[:other_propositions], availability: params[:availability])
			redirect_to ad_path
			flash[:success] = "Votre annonce a bien été modifié"
		else
			flash[:alert] = "Try again"
			render :edit
		end		
	end

	def destroy
		@ad = Ad.find(params[:id])
		@ad.destroy
		redirect_to root_path
	end
end

def is_validated
	@ad = Ad.find(params[:id])
	if @ad_path.validated != true
		redirect_to root_path
		flash[:alert] = "cet annonce n'as pas été validé"
	end

end
