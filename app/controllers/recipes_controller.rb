class RecipesController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@pantry = Pantry.find(params[:pantry_id])
		@items = @pantry.items.order(:expiration_date).limit(3)
		@search_results = Yummly.search("#{@items[0].prototype.name} #{@items[1].prototype.name}")
		# @recipes = @search_results.matches {|a, b| b.rating <=> a.rating}
		@recipes = @search_results.matches.sort {|a, b| b['rating'] <=> a['rating']}
		# raise params
	end
end
