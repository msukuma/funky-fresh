class RecipesController < ApplicationController
	include RecipeHelper
	def index
		@user = User.find(params[:user_id])
		@pantry = Pantry.find(params[:pantry_id])
		@items = @pantry.item_names_and_plural
		@search_results = search_yummly_for(@items)
		@best_matches = best_matches(@search_results ,@pantry) unless @search_results.matches.empty?
	end
end
