class RecipesController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@pantry = Pantry.find(params[:pantry_id])
		@items = @pantry.recent_item_names_as_hash #@pantry.items.order(:expiration_date).limit(3)

		search_for = @items.length > 3 ? @items.keys[0..2].join(' ') : @items.keys.join(' ')
		@search_results = Yummly.search(search_for)
		# @recipes = @search_results.matches {|a, b| b.rating <=> a.rating}
		@recipes = @search_results.matches.sort {|a, b| b['rating'] <=> a['rating']} if @search_results.recipes.count != 0
	end
end
