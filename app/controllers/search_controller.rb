class SearchController < ApplicationController
	def index
		@pantry = Pantry.find(params[:id])
		@user = @pantry.creator
	end
end