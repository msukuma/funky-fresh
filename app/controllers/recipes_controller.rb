class RecipesController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@pantry = Pantry.find(params[:pantry_id])
		@items = @pantry.item_names

		search_for = @items.length > 3 ? @items[0..2].join(' ') : @items.join(' ')
		@search_results = Yummly.search(search_for)
		
		@matches = @search_results.matches 

		@best_matches = @matches.map{|r| [r['id'], r['ingredients'], r['sourceDisplayName']]}.sort{|a, b| (a[1] - @items).length <=> (b[1] - @items).length} unless @matches.empty?
	end
end
