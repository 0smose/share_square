class AdsController < ApplicationController


	def index
		@ads = Ad.all.reverse

	end


end
